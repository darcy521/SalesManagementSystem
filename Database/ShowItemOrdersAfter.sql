CREATE OR REPLACE PROCEDURE showItemOrdersAfter(cust_id in Integer, after_date in Date)
IS 
    cid Integer;
    cname VARCHAR(20);
    cemail VARCHAR(20);
    caddress VARCHAR(50);
    o_id Integer;
    odate DATE;
    oshippeddate DATE;
    istoreitemid Integer;
    ititle VARCHAR(25);
    iquantity Integer; -- ordered quantity
    itype VARCHAR(20);
    iprice Float;
    itotal Float;
    praw Float;
    ptax Float;
    pshippingfee Float;
    pdiscount Float := 0;
    ptotal Float;
    cust_type VARCHAR(10);
    temp Float;
    iid Integer;
    
    CURSOR orderids_cursor is 
    Select OrderId From CustOrder Where CustID = cust_id and DateOfOrder >= after_date; 
    
    
    
Begin

    
    -- clear the table
    Delete fulldetailtable;
    
    For oid_temp in orderids_cursor loop
    
        Declare 
            CURSOR orderitem_cursor is 
            Select StoreItemsID, Quantity From OrderLineItem Where OrderId = oid_temp.OrderId;
        Begin
            -- static info about the order
            Select custid, dateoforder, shippeddate, shippingfee into cid, odate, oshippeddate, 
            pshippingfee from custorder where orderid = oid_temp.OrderId;
            Select NAME ,EMAIL , ADDRESS into cname, cemail, caddress From customer Where CustId = cid;
        
            -- get raw price, tax, discount, total, 
            ptotal := computeTotal(oid_temp.OrderId);
            
            Select CustType into cust_type from Customer where CustId = cid;
            If (Cust_Type = 'Gold' And ptotal >= 90.00) Then
                pdiscount := (ptotal / 0.9) - ptotal;
            End If;
            
            temp := ptotal - pdiscount;
            praw := (temp / 1.05);
            ptax := (temp - praw); 
            dbms_output.put_line('before for loop');
            -- fill table with item details
            For OrderItem_temp in orderitem_cursor LOOP
                iquantity := orderitem_temp.quantity;
                istoreitemid := orderitem_temp.storeitemsid;
                -- storeitems find type, price
                select itemtype, price, itemid into itype, iprice, iid from storeitems 
                    where storeitemsid = istoreitemid;
                itotal := iquantity * iprice;
                -- item find title
                select title into ititle from item where itemid = iid;
                
                insert into fulldetailtable(CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_Email, CUSTOMER_Address,
                O_ID, ORDER_DATE, ORDER_SHIPPED_DATE, Item_StoreItemId, Item_Title, Item_Quantity,
                Item_TYPE, Item_Price, Item_Total, PAYMENT_RAW, PAYMENT_TAX, PAYMENT_SHIPPING, PAYMENT_DISCOUNT, PAYMENT_TOTAL)
                values (cid, cname, cemail, caddress, order_id, odate, oshippeddate, istoreitemid, 
                ititle, iquantity, itype, iprice, itotal, praw, ptax, pshippingfee, pdiscount,ptotal);
            End LOOP;
        End;
    End loop;
 
End;
/


--execute showItemOrdersAfter(1, TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
--Select * from fulldetailtable;  
