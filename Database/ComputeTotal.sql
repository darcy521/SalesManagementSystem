--Write a PLSQL function, computeTotal() that takes an orderid, 
--computes the total for that order and returns the total. 
--The total is the grand total price of all the OrderLineItems of this custorder. 
--The function should consider the customer type, tax, shipping fee etc, to compute the total.

CREATE OR REPLACE Function computeTotal(OrderId IN Integer)
return Float
IS
    Total Float := 0;
    Cust_Type varchar(15);
--    Num_OrderLineItems Integer;
--    Num_StoreItems Integer;

    CURSOR v_OrderLineItem is
    Select StoreItemsId, Quantity
    From OrderLineItem Odr
    Where Odr.orderId = OrderId;
    
    CURSOR v_StoreItems is
    Select * From StoreItems;
    
Begin
--    two for-loop to calculate total price
    For OrderLineItem_tmp in v_OrderLineItem LOOP
        For StoreItems_tmp in v_StoreItems LOOP
            if (OrderLineItem_tmp.StoreItemsId = StoreItems_tmp.StoreItemsId) Then
            Total := Total + StoreItems_tmp.Price * OrderLineItem_tmp.Quantity;
            continue;
            End if;
        End loop;
    End loop;
    
--    add 5% tax
    Total := Total *  1.05;
    Select CustType into Cust_Type 
    from Customer
    Where CustId = (Select distinct CustId from CustOrder C Where C.OrderId = OrderId);
--    check if order is placed by a gold customer and total >= 100
    If (Cust_Type = 'Gold' And Total >= 100.00) Then
        Total := Total * 0.9;
        dbms_output.put_line('You are Gold Customer and total is larger than or equal to $100
        , thus we offer you 10% off in this order');
    End If;
    
    dbms_output.put_line('Total price has been calculated, Total price of OrderId ' || orderid 
    || ' is : $' || total);
    Return Total;
    
End;
/

--test function
DECLARE
    result float;
Begin
    result := ComputeTotal(4);
    
End;
/

