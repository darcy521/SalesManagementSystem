CREATE SEQUENCE LineId_seq
    INCREMENT BY 1
    START WITH 00000001
    MINVALUE 00000001
    MAXVALUE 99999999
    CYCLE;

CREATE OR REPLACE PROCEDURE createOrderLineItem(custOrderId in Integer, storeitems_id in Integer,
customerId in Integer, dateOrdered in Date, numberOrdered in Integer, shippedDate in Date)
IS
    tmp Integer := 0;
    CustTypeTmp VARCHAR(10);
    ShippingFee Integer;
    OdrId Integer;
Begin
    Select NumberOfCopies into tmp
    from StoreItems Where StoreItemsId = storeitems_id;
--    Do not forget to display error message on front-end!
--If number of item ordered > stock -> display error and exit
    IF (numberOrdered > tmp) THEN
        dbms_output.put_line('Number of item Ordered is larger than stock, bookstore only has '
        || tmp || ' copies');
        return;
    END IF;

    Select CustTypeTmp into CustTypeTmp
    from customer si Where customerId = si.CustId;
    IF (CustTypeTmp = 'Gold') Then
        ShippingFee := 0;
    ELSE
        ShippingFee := 10;
    END IF;

    INSERT INTO OrderLineItem(LineId, StoreItemsId, Quantity, OrderId) 
    values (LineId_seq.NEXTVAL, storeitems_id, numberOrdered, custOrderId);
    
    Update StoreItems
    Set NumberOfCopies = NumberOfCopies - numberOrdered
    Where StoreItemsId = StoreItems_id;
End;
/


execute createOrderLineItem(10000040, 104, 1, SYSDATE, 3, SYSDATE);
execute createOrderLineItem(10000040, 110, 1, SYSDATE, 3, SYSDATE);
execute createOrderLineItem(10000000, 107, 1, SYSDATE, 3, SYSDATE);
execute createOrderLineItem(10000000, 105, 1, SYSDATE, 3, SYSDATE);