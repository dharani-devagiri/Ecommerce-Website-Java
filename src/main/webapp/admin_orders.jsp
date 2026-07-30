<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin - Orders</title>


<style>

*{
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    margin:0;
    background:#f5f5f5;
}


/* Header */

.header{

    background:black;
    color:white;
    padding:20px 40px;

    display:flex;
    justify-content:space-between;
    align-items:center;

}

.header h1{
    margin:0;
}


.dashboard-btn{

    background:#ff5722;
    color:white;

    padding:10px 20px;

    text-decoration:none;

    border-radius:8px;

}



/* Main container */

.container{

    width:90%;
    margin:40px auto;

}


.title{

    text-align:center;
    margin-bottom:30px;

}



/* Order card */

.order-card{

    background:white;

    padding:25px;

    margin-bottom:30px;

    border-radius:15px;

    box-shadow:0px 5px 15px rgba(0,0,0,0.15);

}


.order-header{

    display:flex;

    justify-content:space-between;

    align-items:center;

    border-bottom:1px solid #ddd;

    padding-bottom:15px;

}


.order-header h2{

    margin:0;

}


/* Order information */

.info{

    display:grid;

    grid-template-columns:repeat(2,1fr);

    gap:10px;

    margin-top:20px;

}


.info p{

    margin:5px 0;

}



/* Status */

.status{

    font-weight:bold;

    color:#ff5722;

}



/* Buttons */

button{

    background:black;

    color:white;

    border:none;

    padding:10px 20px;

    border-radius:7px;

    cursor:pointer;

}


button:hover{

    background:#333;

}



/* Status form */

.status-form{

    margin-top:20px;

    padding-top:20px;

    border-top:1px solid #ddd;

}


select{

    padding:10px;

    border-radius:7px;

    border:1px solid #aaa;

    margin-right:10px;

}


.view-btn{

    background:#1976d2;

    text-decoration:none;

    color:white;

    padding:10px 20px;

    border-radius:7px;

    display:inline-block;

    margin-top:15px;

}


.view-btn:hover{

    background:#125aa0;

}



/* No orders */

.no-orders{

    background:white;

    padding:40px;

    text-align:center;

    border-radius:15px;

    box-shadow:0px 5px 15px gray;

}



</style>


</head>


<body>



<!-- Header -->

<div class="header">

<h1>
Admin - Orders
</h1>


<a href="admin_dashboard.jsp"
class="dashboard-btn">

Dashboard

</a>

</div>




<div class="container">


<h1 class="title">

Customer Orders

</h1>



<%


ArrayList<HashMap<String,String>> orders =

(ArrayList<HashMap<String,String>>)
request.getAttribute("orders");



if(orders != null && !orders.isEmpty())

{


for(HashMap<String,String> order : orders)

{


%>



<!-- Order Card -->

<div class="order-card">



<div class="order-header">


<h2>

Order #<%=order.get("order_id")%>

</h2>


<span class="status">

<%=order.get("status")%>

</span>


</div>




<!-- Customer Information -->

<div class="info">


<p>

<b>Customer:</b>

<%=order.get("name")%>

</p>



<p>

<b>Phone:</b>

<%=order.get("phone")%>

</p>



<p>

<b>Order Date:</b>

<%=order.get("date")%>

</p>



<p>

<b>Total Amount:</b>

₹ <%=order.get("amount")%>

</p>



<p>

<b>Address:</b>

<%=order.get("address")%>

</p>


</div>




<!-- View Details -->

<a href="AdminOrderDetailsServlet?order_id=<%=order.get("order_id")%>"
class="view-btn">

View Order Details

</a>




<!-- Update Status -->

<div class="status-form">


<form action="UpdateOrderStatusServlet"
method="post">


<input type="hidden"

name="order_id"

value="<%=order.get("order_id")%>">



<select name="status">


<option value="Order Placed"
<%= "Order Placed".equals(order.get("status")) ? "selected" : "" %>>

Order Placed

</option>



<option value="Shipped"
<%= "Shipped".equals(order.get("status")) ? "selected" : "" %>>

Shipped

</option>



<option value="Out for Delivery"
<%= "Out for Delivery".equals(order.get("status")) ? "selected" : "" %>>

Out for Delivery

</option>



<option value="Delivered"
<%= "Delivered".equals(order.get("status")) ? "selected" : "" %>>

Delivered

</option>



</select>



<button type="submit">

Update Status

</button>


</form>


</div>



</div>



<%


}


}

else

{


%>



<div class="no-orders">


<h2>

No Orders Found

</h2>


<p>

There are currently no customer orders.

</p>


</div>



<%


}


%>



</div>



</body>

</html>