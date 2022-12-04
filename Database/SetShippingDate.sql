CREATE OR REPLACE PROCEDURE setShippingDate(
    id in INTEGER, sdate in VARCHAR) is
    BEGIN
        UPDATE CustOrder SET ShippedDate = to_date(sdate,'dd-MON-yy') WHERE OrderId = id;
    END setShippingDate;
/
show errors;

--execute setShippingDate (10000130, '30-NOV-22');

