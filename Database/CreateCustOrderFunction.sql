-- create before using the fucntion
create sequence OrderId_seq 
    minvalue 10000000 maxvalue 99999999 
    increment by 1 nocycle noorder;

-- the function
CREATE OR REPLACE FUNCTION createCustOrder(CustId IN Integer) RETURN Integer IS
    orderid Integer;
    today Date;
    BEGIN
        orderid := OrderId_seq.nextVal;
        today := SYSDATE;
        INSERT INTO CustOrder(CustId, OrderId, DateOfOrder, ShippedDate, ShippingFee) 
            values (CustId, orderid, today, NULL, 10);
        RETURN orderid;
    END;
/
show errors;

-- executing the function
-- DECLARE
--    res Integer;
-- BEGIN
--    res := createCustOrder(1);
--    dbms_output.put_line('result from ceateCustOrder: ' || res);
-- END;
-- /

DECLARE
   res Integer;
BEGIN
   res := createCustOrder(4);
END;
/