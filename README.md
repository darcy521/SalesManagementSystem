Team members: </br>
Honglin Chen, Jinming Nian  </br> </br>

Note that the table "StoreItems" stores the general info about all items in the store, it specifies if the item is a "Comic Book" or "Movie". Whereas "Item" stores specific item info. Moreover, results of "computeTotal" is not directly shown in the demo, but it is called inside "ShowItemOrders" </br> </br>

All constraints in 1.1 are fully implemented 

- a. custType constraints are implemented in Customer table creation in Table.sql 
- b. email has the constraint "UNIQUE NOT NULL" during table creation.
- c. This is implemented in StoreItems creation as well as CreateOrderLineItem.
- d. This is enforced in CreateOrderLineItem. 
- e. This is enforced in SetShippingDate and implemented in CustOrder table creation. Orders will be created without a shipping date, we think it is appropriate to add shipping date by using "SetShippingDate" after the order is successfully made. 
- f. This is implemented in ShippingFee_Trigger.

GUI Overview
![GUI_Overview1](https://user-images.githubusercontent.com/94886510/205754594-6fa847b0-ad9f-4eee-a1a5-fd1a034ad91e.png)
![GUI_Overview2 ](https://user-images.githubusercontent.com/94886510/205753653-0054b432-1bd1-43ed-abf7-ae028dde8cab.png)

