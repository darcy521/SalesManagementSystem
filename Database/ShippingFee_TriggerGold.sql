--create trigger to change shipping fee to 0 automatically when customer upgrade to 'Gold'
--        and change shipping fee to 10 automatically when customer downgrade to 'regular'
CREATE OR REPLACE Trigger ShippingFeeGold_Trigger
After update of CustType on Customer
for each row
--new values after statement, no need to add ':' in when clause
When (new.CustType = 'Gold')
Declare
--    when it comes to multiple tuples in query, we need to create cursor to save them
    pragma autonomous_transaction;
Begin
      Update CustOrder
      Set ShippingFee = 0
      Where CustId = :new.CustId;
    commit;
            
End;
/
