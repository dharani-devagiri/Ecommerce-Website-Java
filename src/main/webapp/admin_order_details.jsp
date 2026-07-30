<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Order Details</title>


<style>


body{

font-family:Arial;
background:#f5f5f5;

}


.container{

width:80%;
margin:40px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0px 5px 15px gray;

}


h1{

text-align:center;
background:black;
color:white;
padding:20px;
border-radius:10px;

}



.section{

margin:25px 0;
padding:20px;
border-radius:10px;
background:#fafafa;
border:1px solid #ddd;

}



table{

width:100%;
border-collapse:collapse;

}



th,td{

padding:15px;
border-bottom:1px solid #ddd;
text-align:center;

}



th{

background:black;
color:white;

}



.total{

font-size:25px;
font-weight:bold;
color:#ff5722;
text-align:right;

}



button{

background:black;
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

Order Details

</h1>




<%

HashMap<String,String> order =

(HashMap<String,String>)request.getAttribute("order");



ArrayList<HashMap<String,String>> items =

(ArrayList<HashMap<String,String>>)request.getAttribute("items");


%>





<div class="section">


<h2>

Customer Details

</h2>


<p>

<b>Order ID:</b>

<%=order.get("order_id")%>

</p>


<p>

<b>Name:</b>

<%=order.get("name")%>

</p>


<p>

<b>Phone:</b>

<%=order.get("phone")%>

</p>


<p>

<b>Address:</b>

<%=order.get("address")%>

</p>


<p>

<b>Order Date:</b>

<%=order.get("date")%>

</p>


<p>

<b>Status:</b>

<%=order.get("status")%>

</p>


</div>





<div class="section">


<h2>

Products

</h2>




<table>


<tr>

<th>
Product
</th>


<th>
Quantity
</th>


<th>
Price
</th>

</tr>



<%


for(HashMap<String,String> item : items)

{


%>


<tr>


<td>

<%=item.get("product")%>

</td>


<td>

<%=item.get("quantity")%>

</td>


<td>

₹ <%=item.get("price")%>

</td>


</tr>



<%


}


%>



</table>


</div>





<div class="total">


Total Amount:

₹ <%=order.get("amount")%>


</div>





<div class="back">


<a href="AdminOrdersServlet">


<button>

Back To Orders

</button>


</a>


</div>




</div>



</body>


</html>