CREATE SEQUENCE LineId_seq
    INCREMENT BY 1
    START WITH 00000001
    MINVALUE 00000001
    MAXVALUE 99999999
    CYCLE;


CREATE PROCEDURE createOrderLineItem(custOrderId in Integer, StoreItemsId in Integer,
customerId in Integer, dataOrdered in Date, numberOrdered in Integer, shippedDate in Date)
IS
    tmp Integer := 0;
    CustTypeTmp VARCHAR(10);
    ShippingFee Integer;
    OdrId Integer;
Begin
    Select NumberOfCopies into tmp
    from StoreItems si Where si.StoreItemsId = StoreItemsId;
--    Do not forget to display error message on front-end!
--If number of item ordered > stock -> display error and exit
    IF (numberOrdered > tmp) THEN
        dbms_output.put_line('Number of item Ordered is larger than stock, bookstore only has '
        || tmp || 'copies');
        return;
    END IF;

    Select CustTypeTmp into CustTypeTmp
    from customer si Where customerId = si.CustId;
    IF (CustTypeTmp = 'Gold') Then
        ShippingFee := 0;
    ELSE
        ShippingFee := 10;
    END IF;

    Select OrderId into OdrId
    From CustOrder Where customerId = custorder.CustId;

    INSERT INTO OrderLineItem(LineId, StoreItemsId, Quantity, OrderId) 
    values (LineId_seq.NEXTVAL, StoreItemsId, numberOrdered,OdrId);
End;
/
