CREATE OR REPLACE PROCEDURE setShippingDate(
    id in INTEGER, sdate in VARCHAR) is

    DECLARE
        orderDate Date := Select DateOfOrder from CustOrder Where OrderId = id;

    BEGIN
        IF (to_date(sdate, 'dd-MON-yy') < orderDate) THEN
        dbms_output.put_line('Shipping date cannot be earlier than order date!');
        return;
        END IF;
        UPDATE CustOrder SET ShippedDate = to_date(sdate,'dd-MON-yy') WHERE OrderId = id;
    END setShippingDate;
/
show errors;

--execute setShippingDate (10000130, '30-NOV-22');

