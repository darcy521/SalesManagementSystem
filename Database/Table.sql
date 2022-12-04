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
    CustType VARCHAR(10) CHECK (CustType = 'Gold' or CustType = 'Regular'),
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
    ShippedDate Date CHECK (ShippedDate >= DateOfOrder),
    ShippingFee Integer
);

--OrderLineItem
CREATE TABLE OrderLineItem (
    OrderId Integer REFERENCES CustOrder(OrderId),
    LineId Integer PRIMARY KEY,
    StoreItemsId Integer REFERENCES StoreItems(StoreItemsId),
    Quantity Integer
);

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

--select * from fulldetailtable;
--Select * from StoreItems;
--Select * from Item;
Select * from CustOrder;
Select * from Customer;
update Customer
Set CustType = 'Gold'
Where custId = 5;
--Select * from GoldCustomer;
Select * from OrderLineItem;