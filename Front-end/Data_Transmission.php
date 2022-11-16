<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
      <title>MasterRobot Bookstore</title>
   </head>
   <body>
         <!-- This form create customer order -->
        <form name="createCustOrder-form" method="post" action="">
            <h3>Create New Order</h3>
            <div>
                <label>Customer ID</label>
                <input type="text" name="customerId-createOrder" placeholder="Please enter your ID" >
            </div>

            <!-- put OrderID here -->
            <!-- not implement yet -->
            <!-- <label>Your Order has been created!</label> -->
            <input type="submit" name="submit" value="Submit">
        </form>

        <!-- This form create orderLineItem-->
        <form name="createOrderLineItem-form" method="post" action="">
            <h3>Create Order Line Item</h3>
            <div>
                <label>Customer Order ID</label>
                <input type="text" name="customerOrderId-createOrderLine" placeholder="Please enter your Order ID" >
            </div>
            <div>
                <label>StoreItems ID</label>
                <input type="text" name="storeItemsID-createOrderLine" placeholder="Please enter StoreItems ID" >
            </div>
            <div>
                <label>Customer ID</label>
                <input type="text" name="customerId-createOrderLine" placeholder="Please enter your ID" >
            </div>
            <div>
                <label>Date</label>
                <input type="date" value="<?php echo date('Y-m-d'); ?>" >
                <div id="current_date"></p>
                    <script>
                    date = new Date();
                    year = date.getFullYear();
                    month = date.getMonth() + 1;
                    day = date.getDate();
                    document.getElementById("current_date").innerHTML = month + "/" + day + "/" + year;
                    </script>
            </div>
            <div>
                <label>ShippedDate: anticipate ?</label>
            </div>

            <!-- not implement yet -->
            <!-- <label>Your OrderLine Item has been created!</label> -->
            <input type="submit" name="submit" value="Submit">
        </form>

        <!-- This form sets Shipping Date -->
        <form name="setShippingDate-form" method="post" action="">
            <h3>Set Shipping Date</h3>
            <div>
                <label>Order ID</label>
                <input type="text" name="orderId-setShippingDate" placeholder="Please enter Order ID">
            </div>
            <div>
                <label>Anticipated ShippedDate</label>
                <input type="date" name="ShippedDate">
            </div>

            <!-- put OrderID here -->
            <!-- not implement yet -->
            <!-- <label>Your Order has been created!</label> -->
            <input type="submit" name="submit" value="Submit">
        </form>

        <!-- This form shows ordered Items -->
        <form name = "orderItems-form" method="post" action="">
            <h3>Show Ordered Items</h3>
            <div>
            <label>OrderID </label>
            <input type="text" name="orderId-input" placeholder="please enter Order ID">
            </div>
            
            <!-- show Ordered Items here-->
            <!-- not implement yet -->
            <input type="submit" name="submit" value="Submit">
        </form>

        <!-- This form shows customer order history by customer ID and Order Date -->
        <form name="custOrder-form" method="post" action="">
            <h3>Show Customer Order history</h3>
            <div>
                <label>Customer ID</label>
                <input type="text" name="customerId-showOrder" placeholder="Please enter your ID">
            </div>
            <p></p>
            <div>
                <label>Date</label>
                <input type="date" name="order-date" placeholder="Please enter date you want to search">
            </div>

            <!-- Show Customer Order history here -->
            <!-- not implement yet -->
            <input type="submit" name="submit" value="Submit">
        </form>

   </body>
</html>
