<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Products</title>


<style>


body{

font-family:Arial;
background:#f5f5f5;
margin:0;

}


.header{

background:black;
color:white;
padding:20px;
text-align:center;

}


.products{

display:flex;
flex-wrap:wrap;
justify-content:center;
gap:30px;
margin:40px;

}



.card{

width:280px;
background:white;
border-radius:15px;
padding:20px;
text-align:center;
box-shadow:0px 5px 15px gray;

}



.card:hover{

transform:scale(1.05);

}



.card img{

width:220px;
height:220px;
object-fit:contain;

}



.card h2 a{

text-decoration:none;
color:black;

}



.category{

color:gray;
font-size:18px;

}



.price{

font-size:24px;
font-weight:bold;
color:#ff5722;

}



.description{

height:50px;
overflow:hidden;

}



button{

background:#ff5722;
color:white;
border:none;
padding:12px 25px;
border-radius:8px;
font-size:16px;
cursor:pointer;

}



.cart-btn{

margin-top:15px;

}



.back{

text-align:center;
margin-bottom:30px;

}



</style>


</head>


<body>



<div class="header">

<h1>

Available Products

</h1>

</div>





<div class="products">



<%


ArrayList<HashMap<String,String>> products =

(ArrayList<HashMap<String,String>>)request.getAttribute("products");



if(products != null && !products.isEmpty())

{


for(HashMap<String,String> product : products)

{


%>



<div class="card">



<img src="images/<%=product.get("image")%>">





<h2>

<a href="ProductDetailsServlet?id=<%=product.get("id")%>">

<%=product.get("name")%>

</a>

</h2>




<p class="category">

Category:

<%=product.get("category")%>

</p>



<p class="price">

₹ <%=product.get("price")%>

</p>




<p class="description">

<%=product.get("description")%>

</p>





<form action="CartServlet" method="post">


<input type="hidden"
name="product"
value="<%=product.get("name")%>">


<input type="hidden"
name="price"
value="<%=product.get("price")%>">


<input type="hidden"
name="image"
value="<%=product.get("image")%>">


<button class="cart-btn">

Add To Cart

</button>


</form>




</div>



<%


}


}

else

{


%>


<h2>

No Products Available

</h2>


<%


}


%>



</div>




<div class="back">


<a href="home.jsp">

<button>

Back To Home

</button>

</a>


</div>



</body>


</html>