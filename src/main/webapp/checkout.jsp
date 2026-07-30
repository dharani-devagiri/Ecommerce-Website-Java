<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>

<head>

<title>Checkout</title>


<style>

body{

font-family:Arial;
background:#f5f5f5;

}


.container{

width:70%;
margin:40px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0px 5px 15px gray;

}


input,textarea{

width:100%;
padding:12px;
margin:10px 0;

}


button{

background:#ff5722;
color:white;
padding:12px 30px;
border:none;
cursor:pointer;
border-radius:8px;

}


.product{

display:flex;
align-items:center;
border-bottom:1px solid gray;
padding:15px;

}


.product img{

width:80px;
height:80px;
object-fit:cover;
margin-right:20px;

}


.total{

font-size:25px;
font-weight:bold;

}

</style>


</head>


<body>


<div class="container">


<h1>
Checkout
</h1>


<form action="OrderServlet" method="post">



<h2>
Customer Details
</h2>


<input type="text"
name="name"
placeholder="Enter Name"
required>



<input type="text"
name="phone"
placeholder="Enter Phone Number"
required>



<textarea name="address"
placeholder="Enter Address"
required></textarea>



<h2>
Order Summary
</h2>



<%

ArrayList<HashMap<String,String>> cart =
(ArrayList<HashMap<String,String>>)session.getAttribute("cart");


double total=0;



if(cart != null && !cart.isEmpty())
{


for(HashMap<String,String> item : cart)
{


double price =
Double.parseDouble(item.get("price"));


int quantity =
Integer.parseInt(item.get("quantity"));


double itemTotal = price * quantity;


total += itemTotal;


%>



<div class="product">


<img src="images/<%=item.get("image")%>">



<div>


<h3>
<%=item.get("product")%>
</h3>


<p>
Quantity:
<%=quantity%>
</p>


<p>
Price:
₹ <%=itemTotal%>
</p>


</div>


</div>



<%

}

}

else

{

%>


<h2>
Your Cart is Empty
</h2>


<%

}

%>



<h2 class="total">

Total Amount:
₹ <%=total%>

</h2>



<input type="hidden"
name="total"
value="<%=total%>">



<button type="submit">

Place Order

</button>



</form>



</div>


</body>

</html>