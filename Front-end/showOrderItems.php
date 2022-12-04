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
        <h2 style="color: aliceblue"><?php echo "Order ID: ".$_POST['orderId-input'];?></h2>
        <h2 style="color: aliceblue">Order Items</h2>
        <div style="background-color: rgb(222, 184, 135); opacity: 0.9; margin-top: auto;">
            
            <?php
                ShowOrderedItems();
            ?>
        </div>
        <p></p>
        <div>
            <button class="glow" onclick="location.href='data_Transmission.php'"
             style="background-color: lightgrey;
                    border: none;
                    color: black;
                    padding: 6px 12px;
                    text-decoration: none;
                    margin: 4px 2px;
                    cursor: pointer;
                    border-radius: 10px;">
                Back
            </button>
        </div>
   </body>
</html>

   <?php 
    function showOrderedItems(){
        //connect to your database. Type in your username, password and the DB path
        $conn=oci_connect("c##123", "123", "//localhost/xe", "UTF8");
        if(!$conn) {
                print "<br> connection failed:";       
            exit;
        }		
    
        if (isset($_POST['orderId-input']) && !empty($_POST['orderId-input'])){
            $sql = oci_parse($conn, "call showItemOrders(:order_id)");
            $OrderId = $_POST['orderId-input'];
            oci_bind_by_name($sql,':order_id',$OrderId,15);
            oci_execute($sql);
            $query = oci_parse($conn, "SELECT * FROM fullDetailTable order by Order_date");
        
            // Execute the query
            oci_execute($query);
            
            echo "<table border='1' style='align:center; margin:auto;'>";
                echo "<tr>";
                    echo "<td>Customer ID</td>";
                    echo "<td>Customer Name</td>";
                    echo "<td>Customer Email</td>";
                    echo "<td>Customer Address</td>";
                    echo "<td>Order ID</td>";
                    echo "<td>Order Date</td>";
                    echo "<td>Order Shipped Date</td>";
                    echo "<td>StoreItem ID</td>";
                    echo "<td>Title</td>";
                    echo "<td>Quantity</td>";
                    echo "<td>Type</td>";
                    echo "<td>Price</td>";
                    echo "<td>Item Total</td>";
                    echo "<td>Payment Raw</td>";
                    echo "<td>Payment Tax</td>";
                    echo "<td>Shipping Fee</td>";
                    echo "<td>Payment Discount</td>";
                    echo "<td>Payment Total</td>";
                echo "</tr>";
                
            while (($row = oci_fetch_array($query, OCI_BOTH)) != false) {		
                echo "<tr>";
                    echo "<td>$row[0]</td>";
                    echo "<td>$row[1]</td>";
                    echo "<td>$row[2]</td>";
                    echo "<td>$row[3]</td>";
                    echo "<td>$row[4]</td>";
                    echo "<td>$row[5]</td>";
                    echo "<td>$row[6]</td>";
                    echo "<td>$row[7]</td>";
                    echo "<td>$row[8]</td>";
                    echo "<td>$row[9]</td>";
                    echo "<td>$row[10]</td>";
                    echo "<td>$row[11]</td>";
                    echo "<td>$row[12]</td>";
                    echo "<td>$row[13]</td>";
                    echo "<td>$row[14]</td>";
                    echo "<td>$row[15]</td>";
                    echo "<td>$row[16]</td>";
                    echo "<td>$row[17]</td>";
                    echo "</tr>";
            }
            echo "</table>";
        } 
        OCILogoff($conn);	
    }
   ?>