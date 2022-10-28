CREATE OR REPLACE Trigger ShippingFee_Trigger
After update of CustType on Customer
For Each Row
Begin
    Update CustOrder
    Set ShippingFee = 0 
    Where (Select CustId from Customer C Where C.CustType = 'Gold')= CustId;
End;
/

