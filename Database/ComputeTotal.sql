--Write a PLSQL function, computeTotal() that takes an orderid, 
--computes the total for that order and returns the total. 
--The total is the grand total price of all the OrderLineItems of this custorder. 
--The function should consider the customer type, tax, shipping fee etc, to compute the total.

CREATE OR REPLACE Function computeTotal(OrderId IN Integer)
return Float
IS
    Total Float;
    Num_OrderLineItems Integer;
    Num_StoreItems Integer;
    
    CURSOR v_OrderLineItem is
    Select StoreItemsId, Quantity
    From OrderLineItem Odr
    Where Odr.orderId = OrderId;
    
    CURSOR v_StoreItems is
    Select * From StoreItems;
    
Begin
    SELECT COUNT(*) into Num_OrderLineItems
    FROM OrderLineItem;
    
    SELECT COUNT(*) into Num_StoreItems
    FROM StoreItems;

    For v_OrderLineItem in 0..Num_OrderLineItems LOOP
        For v_StoreItems in 0..Num_StoreItems Loop
            if (v_OrderLineItem.StoreItemsId = v_StoreItems.StoreItemsId) Then
            Total := total + v_StoreItems.Price * v_OrderLineItem.Quantity;
            continue;
            End if;
        End loop;
    End loop;
    Return Total;
End;
/


alter session set nls_numeric_characters='.,';