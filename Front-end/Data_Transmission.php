<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="utf8" />
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- <script src="jquery-3.6.1.min.js"></script> -->
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
      <title>MasterRobot Bookstore</title>
   </head>
   <body>
        <div class="storeItems">
        <!-- This form shows storeItems -->
        <h3><?php 
            if (isset($_POST['showTypes'])) 
            {echo $_POST['showTypes'];} 
            else {print "Please Select One option to browse ";}?>
        </h3>
        <form name="createCustOrder-form" method="post" action="http://localhost/data_transmission.php?show=true">
            <select name = "showTypes" id="showTypes">
                <option value="Please Select One option to browse" selected></option>
                <option value="storeItems">storeItems</option>
                <option value="items">items</option>
                <option value="Customer">Customer</option>
                <option value="Gold Customer">Gold Customer</option>
                <option value="Customer Order">Customer Order</option>
                <option value="OrderLineItem">OrderLineItem</option>
            </select>
            <input type="submit" name="submit" value="show" class="glow-on-hover">
            <?php 
                if (isset($_POST['showTypes'])) {
                    showTypes();
                }
            ?>
        </form>
        <form method="POST" action="http://localhost/data_transmission.php">
        <input type="submit" value="close" class="glow-on-hover"></form>
        </div>

        <div class="createCustOrder">
         <!-- This form create customer order -->
        <form name="createCustOrder-form" method="post" action="http://localhost/data_transmission.php?createNewOrder=true">
            <h3>Create New Order</h3>
            <div>
                <label>Customer ID</label>
                <input type="text" name="customerId-createOrder" id="customerId-createOrder" placeholder="Please enter your ID" required>
            </div>

            <!-- put OrderID here -->
            <!-- not implement yet -->
            <!-- <label>Your Order has been created!</label> -->
            <input type="submit" name="customerId-submit" value="Submit" class="glow-on-hover">
            <?php
                if (isset($_GET['createNewOrder'])) {
                    createNewOrder();
                }
            ?>
        </form>
        </div>

        <div class="createOrderLineItem">
        <!-- This form create orderLineItem-->
        <form name="createOrderLineItem-form" method="post" action="http://localhost/data_transmission.php?createOrderLineItem=true">
            <h3>Create Order Line Item</h3>
            <div>
                <label>Customer Order ID</label>
                <input type="text" name="customerOrderId-createOrderLine" placeholder="Please enter your Order ID" required>
            </div>
            <div>
                <label>StoreItems ID</label>
                <input type="text" name="storeItemsID-createOrderLine" placeholder="Please enter StoreItems ID" required>
            </div>
            <div>
                <label>Number</label>
                <input type="text" name="numberOrdered-createOrderLine" placeholder="Number you want to buy" required>
                </div>
            <div>
                <label>Customer ID</label>
                <input type="text" name="customerId-createOrderLine" placeholder="Please enter your ID" required>
            </div>
            <div>
                <div style="display: flex; justify-content: center;">
                <label>Order Date: </label>
                <!-- <input type="date" name= "OrderDate-createOrderLine"value="<?php echo date('Y-m-d'); ?>" > -->
                <div id="current_date">
                    <script>
                    date = new Date();
                    year = date.getFullYear();
                    month = date.getMonth() + 1;
                    day = date.getDate();
                    document.getElementById("current_date").innerHTML = month + "/" + day + "/" + year;
                    </script>
                </div>
                </div>
            
                <div style="display: flex; justify-content: center;">
                <label>ShippedDate: Anticipate </label>
                    <div id="current_date_2">
                    <script>
                    date = new Date();
                    year = date.getFullYear();
                    month = date.getMonth() + 1;
                    day = date.getDate() + 1;
                    document.getElementById("current_date_2").innerHTML = month + "/" + day + "/" + year;
                    </script>
                    </div>
                    </div>
            </div>

            <!-- not implement yet -->
            <!-- <label>Your OrderLine Item has been created!</label> -->
            <input type="submit" name="createOrderLineItem-submit" value="Submit" class="glow-on-hover">
            <?php
                if (isset($_GET['createOrderLineItem'])) {
                    createOrderLineItem();
                }
            ?>
        </form>
        </div>

        <div class="setShippingDate">
        <!-- This form sets Shipping Date -->
        <form name="setShippingDate-form" method="post" action="http://localhost/data_transmission.php?set=true">
            <h3>Set Shipping Date</h3>
            <div>
                <label>Order ID</label>
                <input type="text" name="orderId-setShippingDate" placeholder="Please enter Order ID" required>
            </div>
            <div>
                <label>Anticipated ShippedDate</label>
                <input type="date" name="ShippedDate" required>
            </div>

            <!-- put OrderID here -->
            <!-- not implement yet -->
            <!-- <label>Your Order has been created!</label> -->
            <input type="submit" value="Submit" class="glow-on-hover">
            <?php
                if (isset($_GET['set'])) {
                    setShippingDate();
                }
            ?>
        </form>
        </div>

        <div class="orderItems">
        <!-- This form shows ordered Items -->
        <form name = "orderItems-form" method="post" action="">
            <h3>Show Ordered Items</h3>
            <div>
            <label>OrderID </label>
            <input type="text" name="orderId-input" placeholder="please enter Order ID" required>
            </div>
            
            <!-- show Ordered Items here-->
            <!-- not implement yet -->
            <input type="submit" name="submit" value="Submit" class="glow-on-hover">
        </form>
        </div>

        <div class="showCustOrder">
        <!-- This form shows customer order history by customer ID and Order Date -->
        <form name="custOrder-form" method="post" action="">
            <h3>Show Customer Order history</h3>
            <div>
                <label>Customer ID</label>
                <input type="text" name="customerId-showOrder" placeholder="Please enter your ID" required>
            </div>
            <div>
                <label>Date</label>
                <input type="date" name="order-date" placeholder="Please enter date you want to search" required>
            </div>

            <!-- Show Customer Order history here -->
            <!-- not implement yet -->
            <input type="submit" name="submit" value="Submit" class="glow-on-hover">
        </form>
        </div>

   </body>
</html>
<?php 
function showTypes(){
    //connect to your database. Type in your username, password and the DB path
    $conn=oci_connect("c##123", "123", "//localhost/xe", "UTF8");
    if(!$conn) {
            print "<br> connection failed:";       
        exit;
    }		

    if (isset($_POST['showTypes']) && $_POST['showTypes'] == "storeItems"){
        $query = oci_parse($conn, "SELECT * FROM StoreItems order by StoreItemsId");
    
        // Execute the query
        oci_execute($query);
        
        echo "<table id='storeItems-table' border='1' style='align:center; margin:auto;'>";
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
    } elseif (isset($_POST['showTypes']) && $_POST['showTypes'] == "Customer Order"){
        $query = oci_parse($conn, "SELECT * FROM CustOrder order by CustId");
    
        // Execute the query
        oci_execute($query);
        
        echo "<table border='1' style='align:center; margin:auto;'>";
            echo "<tr>";
                echo "<td>CustId</td>";
                echo "<td>OrderId</td>";
                echo "<td>Date Of Ordered</td>";
                echo "<td>Shipped Date</td>";
                echo "<td>Shipping Fee</td>";
            echo "</tr>";
            
        while (($row = oci_fetch_array($query, OCI_BOTH)) != false) {		
            echo "<tr>";
                for ($i = 0; $i <= 4; $i++){
                    if (!empty($row[$i])){
                        // if ($i = 2){
                        //     echo gettype($row[$i]);
                        // }
                        echo "<td>$row[$i]</td>";
                    } else {
                        echo "<td></td>";
                    }
                }
                // if ($row[0]){
                //     echo "<td>$row[0]</td>";
                // } else {
                //     echo "<td></td>";
                // }

                // echo "<td>$row[1]</td>";
                // echo "<td>$row[2]</td>";
                // echo "<td>$row[3]</td>";
                // echo "<td>$row[4]</td>";
                echo "</tr>";
        }
        echo "</table>";
    } elseif (isset($_POST['showTypes']) && $_POST['showTypes'] == "items"){
        $query = oci_parse($conn, "SELECT * FROM Item");
    
        // Execute the query
        oci_execute($query);
        
        echo "<table border='1' style='align:center; margin:auto;'>";
            echo "<tr>";
                echo "<td>ItemId</td>";
                echo "<td>Title</td>";
                echo "<td>Publish Date</td>";
                echo "<td>Studio Name</td>";
                echo "<td>Description</td>";
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
    } elseif (isset($_POST['showTypes']) && $_POST['showTypes'] == "Customer"){
        $query = oci_parse($conn, "SELECT * FROM Customer");
    
        // Execute the query
        oci_execute($query);
        
        echo "<table id='storeItems-table' border='1' style='align:center; margin:auto;'>";
            echo "<tr>";
                echo "<td>Customer ID</td>";
                echo "<td>Name</td>";
                echo "<td>Customer type</td>";
                echo "<td>Email</td>";
                echo "<td>Address</td>";
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
    } elseif (isset($_POST['showTypes']) && $_POST['showTypes'] == "Gold Customer"){
        $query = oci_parse($conn, "SELECT * FROM GoldCustomer");
    
        // Execute the query
        oci_execute($query);
        
        echo "<table border='1' style='align:center; margin:auto;'>";
            echo "<tr>";
                echo "<td>CustId</td>";
                echo "<td>Date Joined</td>";
                echo "<td>Coupons</td>";
            echo "</tr>";
            
        while (($row = oci_fetch_array($query, OCI_BOTH)) != false) {		
            echo "<tr>";
                echo "<td>$row[0]</td>";
                echo "<td>$row[1]</td>";
                echo "<td>$row[2]</td>";
                echo "</tr>";
        }
        echo "</table>";
    } elseif (isset($_POST['showTypes']) && $_POST['showTypes'] == "OrderLineItem"){
        $query = oci_parse($conn, "SELECT * FROM OrderLineItem order by LineId");
    
        // Execute the query
        oci_execute($query);
        
        echo "<table border='1' style='align:center; margin:auto;'>";
            echo "<tr>";
                echo "<td>OrderId</td>";
                echo "<td>LineId</td>";
                echo "<td>Store Items ID</td>";
                echo "<td>Quantity</td>";
            echo "</tr>";
            
        while (($row = oci_fetch_array($query, OCI_BOTH)) != false) {		
            echo "<tr>";
                echo "<td>$row[0]</td>";
                echo "<td>$row[1]</td>";
                echo "<td>$row[2]</td>";
                echo "<td>$row[3]</td>";
                echo "</tr>";
        }
        echo "</table>";
    }
    
    OCILogoff($conn);	
}
function createNewOrder(){
    $conn=oci_connect("c##123", "123", "//localhost/xe", "UTF8");
    if(!$conn) {
            print "<br> connection failed:";       
        exit;
    }		

    // $sql = 'BEGIN :f := "gb_pin_answer"."f_exists"(:p_pidm, :p_num); END;';
    $sql = 'BEGIN :f := createCustOrder(:CustId); END;';
    $stmt = oci_parse($conn,$sql);
    
     // Assign a value to the input 
     $CustId = $_POST['customerId-createOrder'];
     echo $CustId, "<br>\n";

    // Bind the input parameter
    oci_bind_by_name($stmt,':CustId',$CustId,15);
    
    // Bind the output parameter
    oci_bind_by_name($stmt,':f',$v,10);

    // Execute the query
    if (oci_execute($stmt)){

    // $v is now populated with the output value
    print "Customer ID: ";
    echo $CustId, "<br>\n";
    print "Successfully create new order, this is your order ID: \n";
    echo $v, "<br>\n";

    oci_commit($conn);
    }
    OCILogoff($conn);
}


function createOrderLineItem(){
    $conn=oci_connect("c##123", "123", "//localhost/xe", "UTF8");
    if(!$conn) {
            print "<br> connection failed:";       
        exit;
    }		

    // $sql = 'BEGIN :f := "gb_pin_answer"."f_exists"(:p_pidm, :p_num); END;';
    $sql = "call createOrderLineItem(:custOrderId, :storeitems_id,
    :customerId, SYSDATE, :numberOrdered, to_char(SYSDATE+1, 'dd-MON-yy'))";
    $stmt = oci_parse($conn,$sql);
    
     // Assign a value to the input 
     $CustOrderId = $_POST['customerOrderId-createOrderLine'];
     $storeitems_id = $_POST['storeItemsID-createOrderLine'];
     $customerId = $_POST['customerId-createOrderLine'];
    //  $dateOrdered = date('d-M-Y', strtotime($_POST['OrderDate-createOrderLine']));
     $numberOrdered = $_POST['numberOrdered-createOrderLine'];


    // Bind the input parameter
    oci_bind_by_name($stmt,':custOrderId',$CustOrderId,15);
    oci_bind_by_name($stmt,':storeitems_id',$storeitems_id,15);
    oci_bind_by_name($stmt,':customerId',$customerId,15);
    // oci_bind_by_name($stmt,':dateOrdered',$dateOrdered,15);
    oci_bind_by_name($stmt,':numberOrdered',$numberOrdered,15);
    // oci_bind_by_name($stmt,':shippedDate',$shippedDate,15);
    
    // check if the number ordered is larger than stock
    $query = oci_parse($conn, "SELECT NumberOfCopies FROM StoreItems WHERE StoreItemsId = $storeitems_id");
    oci_execute($query);
    $row = oci_fetch_array($query, OCI_BOTH);
    if ($row[0] < $numberOrdered){
        print "Number of item Ordered is larger than stock, bookstore only has ";
        echo $row[0], "\ncopy/copies<br>";
    } else if (oci_execute($stmt)){
    // output order information
    echo "<table id='createNewOrderLineItem-table' border='1'
        style='align:center; margin:auto;'
    >";
        echo "<tr>";
            echo "<td>Customer Order ID</td>";
            echo "<td>StoreItems ID</td>";
            echo "<td>Number</td>";
            echo "<td>Customer ID</td>";
        echo "</tr>";	
        echo "<tr>";
            echo "<td>$CustOrderId</td>";
            echo "<td>$storeitems_id</td>";
            echo "<td>$numberOrdered</td>";
            echo "<td>$customerId</td>";
            echo "</tr>";
    echo "</table>";
    print "Successfully create new order line item! \n";

    oci_commit($conn);
    }
    OCILogoff($conn);
}

function setShippingDate(){
    $conn=oci_connect("c##123", "123", "//localhost/xe", "UTF8");
    if(!$conn) {
            print "<br> connection failed:";       
        exit;
    }		

    // Declare two dates
    $start_date = strtotime(date("m/d/Y"));
    $end_date = strtotime($_POST['ShippedDate']);
    // Get the difference and divide into total no. seconds 60/60/24 to get
    // number of days
    $diff = ($end_date - $start_date)/60/60/24;
    
    // echo "Difference between two dates: "
    //     . $diff, "\n<br>";

    $sql = "call setShippingDate(:id, SYSDATE + $diff)";
    $stmt = oci_parse($conn,$sql);
    
     // Assign a value to the input 
     $OrderId = $_POST['orderId-setShippingDate'];
     $date = date('d-M-y', strtotime($_POST['ShippedDate']));
    //  echo $date;
    //  $sdate = date('d-M-y', strtotime($_POST['ShippedDate']));
     
    // Bind the input parameter
    oci_bind_by_name($stmt,':id',$OrderId,15);
    
    if (oci_execute($stmt)){
    // output order information
    echo "<table id='createNewOrderLineItem-table' border='1' style='text-align: center; margin: auto'>";
        echo "<tr>";
            echo "<td>Order ID</td>";
            echo "<td>Shipping Date</td>";
        echo "</tr>";	
        echo "<tr>";
            echo "<td>$OrderId</td>";
            echo "<td>$date</td>";
            echo "</tr>";
    echo "</table>";
    print "Successfully set Shipping Date! \n";

    oci_commit($conn);
    }
    OCILogoff($conn);
}

?>