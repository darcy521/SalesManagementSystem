Spool Table_Output;

-- Item
CREATE TABLE Item (
    ItemId Integer PRIMARY KEY,
    Title VARCHAR(25),
    PublishDate Date,
    StudioName VARCHAR(25),
    Description VARCHAR(50)
);

-- StoreItems
CREATE TABLE StoreItems (
    StoreItemsId Integer PRIMARY KEY,
    ItemId Integer REFERENCES Item(ItemId),
    Price Float,
    ItemType VARCHAR(20) CHECK (ItemType = 'Comic Book' or ItemType = 'Movie'), 
    NumberOfCopies Integer  CHECK (NumberOfCopies >= 0)
);

--Customer
CREATE TABLE Customer (
    CustId Integer PRIMARY KEY,
    Name VARCHAR(20),
    CustType VARCHAR(10),
    Email VARCHAR(20) UNIQUE NOT NULL,
    Address VARCHAR(50)
);

--Gold Customer
CREATE TABLE GoldCustomer (
    CustId Integer REFERENCES Customer(CustId),
    DateJoined Date,
    Coupons VARCHAR(20)
);

--CustOrder
CREATE TABLE CustOrder (
    CustId Integer REFERENCES Customer(CustId),
    OrderId Integer PRIMARY KEY,
    DateOfOrder Date,
    ShippedDate Date,
    ShippingFee Integer
);

Alter table CustOrder 
add check (ShippedDate >= DateOfOrder);
-- ALTER TABLE CustOrder
-- ADD CONSTRAINT check_ShippingFee CHECK (get_GoldCustShippingFee() in 0);

-- CREATE OR REPLACE FUNCTION get_GoldCustShippingFee
-- RETURN Integer IS
--     tmp Integer := 0;
-- BEGIN
--     SELECT ShippingFee into tmp
--     from CustOrder
--     Where ( Select CustId from Customer  C Where C.CustType = 'Gold')= CustId;
--     return tmp;
-- END;
-- /

--OrderLineItem
CREATE TABLE OrderLineItem (
    OrderId Integer REFERENCES CustOrder(OrderId),
    LineId Integer PRIMARY KEY,
    StoreItemsId Integer REFERENCES StoreItems(StoreItemsId),
    Quantity Integer
);
    --， CHECK (Quantity <=  get_NumberOfCopies(StoreItemsId))
--This function use to select the quantity of storeItems
-- CREATE OR REPLACE FUNCTION get_NumberOfCopies (n in Integer )
-- Return Integer IS
--     tmp Integer := 0;
-- Begin
--     Select NumberOfCopies into tmp 
--     from StoreItems si Where si.StoreItemsId = n;
--     Return tmp;
-- End;
-- /

-- Drop function get_NumberOfCopies;

CREATE TABLE fullDetailTable(
    CUSTOMER_ID Integer,
    CUSTOMER_NAME VARCHAR(20), 
    CUSTOMER_Email VARCHAR(20),
    CUSTOMER_Address VARCHAR(50),
    O_ID Integer,
    ORDER_DATE DATE,
    ORDER_SHIPPED_DATE DATE,
    Item_StoreItemId Integer,
    Item_Title VARCHAR(25),
    Item_Quantity Integer, -- ordered quantity
    Item_TYPE VARCHAR(20),
    Item_Price Float,
    Item_Total Float,
    PAYMENT_RAW Float,
    PAYMENT_TAX Float,
    PAYMENT_SHIPPING Float,
    PAYMENT_DISCOUNT Float,
    PAYMENT_TOTAL Float
);

select * from fulldetailtable;
Select * from StoreItems;
Select * from Item;
Select * from CustOrder;
--Delete from CustOrder 
--Where CustId = 3;

Select * from Customer;
Select * from GoldCustomer;

Select * from OrderLineItem;
--Delete from OrderLineItem 
--Where OrderID = 2;
