<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src="jquery-3.6.1.min.js"></script>
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
      <title>MasterRobot Bookstore</title>
   </head>
   <body>
        <!-- This form shows storeItems -->
        <form name="createCustOrder-form" method="post" action="http://localhost/data_transmission.php?show=true">
            <h3>Show StoreItems</h3>

            <input type="submit" name="submit" value="show">
            
            <input type="button" name="submit" value="close">
            <button type="submit" value="close">
            <?php 
                closeStoreItems();
            ?>
            </button>
            <?php 
                if (isset($_GET['show'])) {
                    showStoreItems();
                }
            ?>
        </form>

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

        <?php
        // Create connection to Oracle
        $conn = oci_pconnect("c##123", "123", "//localhost/xe");
        if (!$conn) {
        $m = oci_error();
        echo $m['message'], "\n";
        exit;
        }
        else {
        print "Connected to Oracle!";
        }
        // Close the Oracle connection
        oci_close($conn);
        ?>

   </body>
</html>
<?php 
function showStoreItems(){
    //connect to your database. Type in your username, password and the DB path
    $conn=oci_connect("c##123", "123", "//localhost/xe");
    if(!$conn) {
            print "<br> connection failed:";       
        exit;
    }		
    $query = oci_parse($conn, "SELECT * FROM StoreItems");
    
    // Execute the query
    oci_execute($query);
    
    echo "<table id='storeItems-table' border='1'>";
        echo "<tr>";
            echo "<td>StoreItemsId</td>";
            echo "<td>ItemId</td>";
            echo "<td>Price</td>";
            echo "<td>ItemType</td>";
            echo "<td>NumberOfCopies</td>";
        echo "</tr>";
        
    while (($row = oci_fetch_array($query, OCI_BOTH)) != false) {		
        echo "<tr>";
            echo "<td>$row[0]</td>";
            echo "<td>$row[1]</td>";
            echo "<td>$row[2]</td>";
            echo "<td>$row[3]</td>";
            echo "<td>$row[4]</td>";
            echo "</tr>";
    }
    echo "</table>";
    OCILogoff($conn);	
}

function closeStoreItems(){
    
}

function createNewOrder(){
    $conn=oci_connect("c##123", "123", "//localhost/xe");
    if(!$conn) {
            print "<br> connection failed:";       
        exit;
    }		

    $sql = 'BEGIN createCustOrder(:CustId); END;';
    $stmt = oci_parse($conn,$sql);
    
    // Bind the input parameter
    oci_bind_by_name($stmt,':CustId',$CustId,32);
    
    // Bind the output parameter
    oci_bind_by_name($stmt,':message',$message,32);
    
    // Assign a value to the input 
    $name = 'Harry';

    // Execute the query
    oci_execute($stmt);
    
    // $message is now populated with the output value
    print "$message\n";
    
    OCILogoff($conn);
}


?>