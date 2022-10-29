
CREATE PROCEDURE createOrderLineItem(custOrderId in Integer, StoreItemsId in Integer,
customerId in Integer, dataOrdered in Date, numberOrdered in Integer, shippedDate in Date)
IS
    tmp Integer := 0;
Begin
    Select NumberOfCopies into tmp
    from StoreItems si Where si.StoreItemsId = StoreItemsId;
    IF (numberOrdered > tmp) THEN
    dbms_output.put_line('Number of item Ordered is larger than stock, bookstore only has '
    || tmp || 'copies');
End;
/


--CREATE OR REPLACE FUNCTION get_NumberOfCopies (n in Integer)
--Return Integer IS
--    tmp Integer := 0;
--Begin
--    Select NumberOfCopies into tmp 
--    from StoreItems si Where si.StoreItemsId = n;
--    Return tmp;
--End;
--/