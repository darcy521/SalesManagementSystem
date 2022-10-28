Spool Table_Output;

-- StoreItems
CREATE TABLE StoreItems (
    StoreItemsId Integer PRIMARY KEY,
    ItemId Integer REFERENCES Item(ItemId),
    Price Float,
    ItemType VARCHAR(20),
    NumberOfCopies Integer  CHECK (NumberOfCopies >= 0)
);

-- Item
CREATE TABLE Item (
    ItemId Integer PRIMARY KEY,
    Title VARCHAR(25),
    PublishDate Date,
    StudioName VARCHAR(25),
    Description VARCHAR(25)
);

--OrderLineItem
CREATE TABLE OrderLineItem (
    OrderId Integer REFERENCES CustOrder(OrderId),
    LineId Integer PRIMARY KEY,
    StoreItemsId Integer REFERENCES StoreItems(StoreItemsId),
    Quantity Integer,
    CHECK (Quantity <=  get_NumberOfCopies(StoreItemsId))
);
--This function use to select the quantity of storeItems
CREATE OR REPLACE FUNCTION get_NumberOfCopies (n in Integer )
Return Integer IS
    tmp Integer := 0;
Begin
    Select NumberOfCopies into tmp 
    from StoreItems si Where si.StoreItemsId = n;
    Return tmp;
End;
/

Drop function get_NumberOfCopies;

--CustOrder
CREATE TABLE CustOrder (
    CustId Integer REFERENCES Customer(CustId),
    OrderId Integer PRIMARY KEY,
    DateOfOrder Date,
    ShippedDate Date,
    ShippingFee Integer,
    CHECK (ShippedDate >= DateOfOrder)
);
ALTER TABLE CustOrder
ADD CONSTRAINT check_ShippingFee CHECK (get_GoldCustShippingFee() in 0);

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

Drop table CustOrder;
--Customer
CREATE TABLE Customer (
    CustId Integer PRIMARY KEY,
    Name VARCHAR(20),
    CustType VARCHAR(10),
    Email VARCHAR(20) UNIQUE NOT NULL
);

--Gold Customer
CREATE TABLE GoldCustomer (
    CustId Integer REFERENCES Customer(CustId),
    DateJoined Date,
    Coupons VARCHAR(20)
);

Select * from CustOrder;
