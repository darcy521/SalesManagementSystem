Team members: </br>
Honglin Chen, Jinming Nian  </br> </br>

Note that "computeTotal" is not directly shown in the demo, but it is used in "ShowItemOrders" </br> </br>

All constraints in 1.1 are fully implemented 

- a. custType constraints are implemented in Customer table creation in Table.sql 
- b. email has the constraint "UNIQUE NOT NULL" during table creation.
- c. This is implemented in StoreItems creation as well as CreateOrderLineItem.
- d. This is enforced in CreateOrderLineItem. 
- e. This is enforced in SetShippingDate and implemented in CustOrder table creation. Orders will be created without a shipping date, we think it is appropriate to add shipping date by using "SetShippingDate" after the order is successfully made. 
- f. This is implemented in ShippingFee_Trigger.

