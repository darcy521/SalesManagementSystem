CREATE OR REPLACE Trigger ShippingFee_Trigger
After update of CustType on Customer
For Each Row
Begin
    Update CustOrder
    Set ShippingFee = 0 
    Where (Select CustId from Customer C Where C.CustType = 'Gold')= CustId;
End;
/

 




CREATE OR REPLACE FUNCTION get_GoldCustShippingFee
RETURN Integer IS
    tmp Integer := 0;
BEGIN
    SELECT ShippingFee into tmp
    from CustOrder
    Where ( Select CustId from Customer  C Where C.CustType = 'Gold')= CustId;
    return tmp;
END;
/