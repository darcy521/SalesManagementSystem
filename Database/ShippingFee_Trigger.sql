--create trigger to change shipping fee to 0 automatically when customer upgrade to 'Gold'
--        and change shipping fee to 10 automatically when customer downgrade to 'regular'
CREATE OR REPLACE Trigger ShippingFee_Trigger
After update of CustType on Customer
for each row
--new values after statement, no need to add ':' in when clause
--When (new.CustType = 'Gold')
Declare
--    when it comes to multiple tuples in query, we need to create cursor to save them
    CURSOR Cust_id_Gold IS
	Select CustId from Customer C
    Where C.CustType = 'Gold';
    
    CURSOR Cust_id_Regular IS
	Select CustId from Customer C 
    Where C.CustType = 'Regular';

    CURSOR Cust_Order_Gold IS
    Select CustId, ShippingFee from CustOrder where ShippingFee <> 0;
    
    CURSOR Cust_Order_Regular IS
    Select CustId, ShippingFee from CustOrder where ShippingFee <> 10;
    
    pragma autonomous_transaction;
Begin
--    Select CustId into tmp 
--    from Customer C 
--    Where C.CustType = 'Gold';
    
--    (Select CustId
--    from Customer C 
--    Where C.CustType = 'Gold') in Customer.CustId
    
    If (:new.CustType = 'Gold') Then
        For Cust_id_Gold in Cust_Order_Gold Loop
            Update CustOrder
            Set ShippingFee = 0 
            Where CustId = Cust_id_Gold.CustId;
        End Loop;
    Elsif (:new.CustType = 'Regular') Then
        For Cust_id_Regular in Cust_Order_Regular Loop
            Update CustOrder
            Set ShippingFee = 10 
            Where CustId = Cust_id_Regular.CustId;
        End Loop;
    End if;
    commit;
            
End;
/
