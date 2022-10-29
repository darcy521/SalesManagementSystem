CREATE OR REPLACE PROCEDURE setShippingDate(
    id in INTEGER, sdate in DATE) is
    BEGIN
        UPDATE CustOrder SET ShippedDate = sdate WHERE OrderId = id;
    END setShippingDate;
/
show errors;

execute setShippingDate (10000001, SYSDATE);

