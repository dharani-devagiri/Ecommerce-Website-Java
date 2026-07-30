<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Orders</title>


<style>


body{

font-family:Arial;
background:#f5f5f5;
margin:0;

}


.container{

width:85%;
margin:40px auto;

}


h1{

text-align:center;

}



.order-card{

background:white;
padding:25px;
margin:20px;
border-radius:15px;
box-shadow:0px 5px 15px gray;

}



.order-card h2{

color:#333;

}



.details{

font-size:18px;
line-height:1.8;

}



.status{

font-weight:bold;
padding:8px 15px;
border-radius:10px;
display:inline-block;

}



.placed{

background:#ffe0b2;
color:#e65100;

}



.shipped{

background:#bbdefb;
color:#0d47a1;

}



.delivered{

background:#c8e6c9;
color:#1b5e20;

}



button{

background:#ff5722;
color:white;
padding:12px 25px;
border:none;
border-radius:8px;
cursor:pointer;

}



.back{

text-align:center;
margin-top:30px;

}


</style>


</head>


<body>



<div class="container">


<h1>
My Orders
</h1>



<%


ArrayList<HashMap<String,String>> orders =
(ArrayList<HashMap<String,String>>)request.getAttribute("orders");



if(orders != null && !orders.isEmpty())

{


for(HashMap<String,String> order : orders)

{


String status = order.get("status");

String statusClass="";



if(status != null)
{

if(status.equals("Order Placed"))
{
statusClass="placed";
}

else if(status.equals("Shipped"))
{
statusClass="shipped";
}

else if(status.equals("Delivered"))
{
statusClass="delivered";
}

}


%>




<div class="order-card">


<h2>

Order ID:
<%=order.get("order_id")%>

</h2>



<div class="details">


<p>

Amount:
&#8377; <%=order.get("amount")%>

</p>

<p>

<b>Products:</b>

<br>

<%=order.get("items")%>

</p>


<p>

Order Date:
<%=order.get("date")%>

</p>



<p>

Customer Name:
<%=order.get("name")%>

</p>


<p>

Phone:
<%=order.get("phone")%>

</p>



<p>

Address:
<%=order.get("address")%>

</p>



<p>

Status:

<span class="status <%=statusClass%>">

<%=status%>

</span>


</p>



</div>



</div>



<%

}

}

else

{

%>


<h2 style="text-align:center">

No Orders Found

</h2>


<%

}

%>




<div class="back">


<a href="home.jsp">

<button>

Continue Shopping

</button>

</a>


</div>




</div>



</body>

</html>