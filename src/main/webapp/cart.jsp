<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Shopping Cart</title>


<style>

body{

    font-family:Arial;
    background:#f5f5f5;

}


.container{

    width:80%;
    margin:40px auto;

}


h1{

    text-align:center;

}



.cart-item{

    background:white;
    display:flex;
    align-items:center;
    padding:25px;
    margin-bottom:20px;
    border-radius:15px;
    box-shadow:0px 5px 15px gray;

}



.cart-item img{

    width:160px;
    height:160px;
    object-fit:cover;
    border-radius:10px;
    margin-right:30px;

}



.details{

    font-size:18px;

}



.price{

    color:green;
    font-size:22px;
    font-weight:bold;

}



button{

    background:black;
    color:white;
    padding:10px 18px;
    border:none;
    border-radius:5px;
    cursor:pointer;

}



.remove{

    background:red;

}



.total{

    background:white;
    padding:25px;
    text-align:right;
    font-size:25px;
    font-weight:bold;
    border-radius:10px;

}


.checkout{

    background:#ff5722;

}


</style>


</head>


<body>


<div class="container">


<h1>
Your Shopping Cart
</h1>



<%

ArrayList<HashMap<String,String>> cart =
(ArrayList<HashMap<String,String>>)session.getAttribute("cart");


double total = 0;



if(cart != null && !cart.isEmpty())
{


for(int i=0;i<cart.size();i++)

{


HashMap<String,String> item = cart.get(i);



double price =
Double.parseDouble(item.get("price"));



int quantity =
Integer.parseInt(item.get("quantity"));



double itemTotal = price * quantity;


total = total + itemTotal;


%>



<div class="cart-item">



<img src="images/<%=item.get("image")%>"
onerror="this.src='images/default.jpg'">



<div class="details">


<h2>
<%=item.get("product")%>
</h2>


<p class="price">

₹ <%=item.get("price")%>

</p>


<p>

Quantity:

<a href="UpdateCartServlet?index=<%=i%>&action=decrease">

<button>
-
</button>

</a>


<b>
<%=quantity%>
</b>



<a href="UpdateCartServlet?index=<%=i%>&action=increase">

<button>
+
</button>

</a>


</p>



<p>

Total:
₹ <%=itemTotal%>

</p>



<a href="RemoveCartServlet?index=<%=i%>">

<button class="remove">
Remove
</button>

</a>


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



<div class="total">


Total Amount:

₹ <%=total%>


<br><br>


<a href="checkout.jsp">

<button class="checkout">

Proceed to Checkout

</button>

</a>


</div>



</div>


</body>

</html>