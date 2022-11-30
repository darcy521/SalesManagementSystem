--Write a PLSQL function, computeTotal() that takes an orderid, 
--computes the total for that order and returns the total. 
--The total is the grand total price of all the OrderLineItems of this custorder. 
--The function should consider the customer type, tax, shipping fee etc, to compute the total.

CREATE OR REPLACE Function computeTotal(Order_Id IN Integer)
return Float
IS
    Total Float := 0;
    itemprice Float := 0;
    Cust_Id Integer;
    Cust_Type varchar(15);
--    Num_OrderLineItems Integer;
--    Num_StoreItems Integer;

    CURSOR v_OrderLineItem is
    Select StoreItemsId, Quantity
    From OrderLineItem Odr
    Where Odr.orderId = Order_Id;
    
Begin
--    calculate total price
    For OrderLineItem_tmp in v_OrderLineItem LOOP
         select price into itemprice from storeitems si where orderlineitem_tmp.storeitemsid = si.storeitemsid;
         Total := Total + itemprice * orderlineitem_tmp.quantity;
    End loop;
    DBMS_OUTPUT.PUT_LINE('reached the end of for loop, raw total is: ' || total);
    
--    add 5% tax 
    Total := Total *  1.05;
    
--    check if order is placed by a gold customer and total >= 100
    Select CustId into Cust_Id from CustOrder co where co.OrderId = Order_Id;
    Select CustType into Cust_Type from Customer c where c.CustId = Cust_Id;

    If (Cust_Type = 'Gold' And Total >= 100.00) Then
        Total := Total * 0.9;
        dbms_output.put_line('You are Gold Customer and total is larger than or equal to $100
        , thus we offer you 10% off in this order');
    End If;
    
    dbms_output.put_line('Total price has been calculated, Total price of OrderId ' || order_id 
    || ' is : $' || total);
    Return Total;
    
End;
/

--test function
DECLARE
    result float;
Begin
    result := computeTotal(5);
    DBMS_OUTPUT.PUT_LINE('result of compute total is: ' || result);
End;
/

