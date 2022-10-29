/*
Write a PLSQL function createCustOrder() to create a CustOrder, 
where the orderId is randomly generated by the function and return the orderId 
to the calling program.
*/

/*
CREATE TABLE CustOrder (
    CustId Integer REFERENCES Customer(CustId),
    OrderId Integer PRIMARY KEY,
    DateOfOrder Date,
    ShippedDate Date,
    ShippingFee Integer, CHECK (ShippedDate >= DateOfOrder)
);
*/

/*
What's been done: 
1. OrderId is randomly generated
2. DateOfOrder is today's date
3. Initialize ShippedDate and ShippingFee as NULL (could run into problem with "check")

*/

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
            values (CustId, orderid, today, NULL, NULL);
        RETURN orderid;
    END;
/
show errors;

-- executing the function
DECLARE
    res Integer;
BEGIN
    res := createCustOrder(1);
    dbms_output.put_line('result from ceateCustOrder: ' || res);
END;
/