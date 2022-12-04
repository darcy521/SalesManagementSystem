-- create before using the fucntion
create sequence OrderId_seq 
    minvalue 10000000 maxvalue 99999999 
    increment by 1 nocycle noorder;

-- the function
CREATE OR REPLACE FUNCTION createCustOrder(cust_id IN Integer) RETURN Integer IS
    orderid Integer;
    today Date;
    shippingfee Integer := 0;
    cust_type Varchar(10); 
    BEGIN
        orderid := OrderId_seq.nextVal;
        today := SYSDATE;
        Select CustType into cust_type From Customer where custId = cust_id;
        If (cust_type = 'Regular') Then
            shippingfee := 10;
        End If;
        INSERT INTO CustOrder(CustId, OrderId, DateOfOrder, ShippedDate, ShippingFee) 
            values (cust_id, orderid, today, NULL, shippingfee);
        RETURN orderid;
    END;
/

-- executing the function
-- DECLARE
--    res Integer;
-- BEGIN
--    res := createCustOrder(1);
--    dbms_output.put_line('result from ceateCustOrder: ' || res);
-- END;
-- /
