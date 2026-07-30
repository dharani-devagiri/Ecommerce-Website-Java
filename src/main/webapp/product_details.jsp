<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Product Details</title>


<style>


body{

font-family:Arial;
background:#f5f5f5;

}


.container{

width:70%;
margin:50px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0px 5px 15px gray;

display:flex;
gap:40px;

}



.image img{

width:300px;
height:300px;
object-fit:cover;

}



.details{

font-size:20px;

}


.details h1{

color:#333;

}



.price{

font-size:28px;
font-weight:bold;
color:#ff5722;

}



button{

background:black;
color:white;
padding:15px 30px;
border:none;
cursor:pointer;
border-radius:8px;
font-size:18px;

}



.back{

margin-top:20px;

}


a{

text-decoration:none;

}


</style>


</head>


<body>



<div class="container">



<div class="image">


<img src="images/<%=request.getAttribute("image")%>">


</div>




<div class="details">


<h1>

<%=request.getAttribute("name")%>

</h1>



<p>

Category:

<%=request.getAttribute("category")%>

</p>



<p class="price">

&#8377; <%=request.getAttribute("price")%>

</p>



<p>

<%=request.getAttribute("description")%>

</p>




<form action="CartServlet" method="post">


<input type="hidden"
name="product"
value="<%=request.getAttribute("name")%>">


<input type="hidden"
name="price"
value="<%=request.getAttribute("price")%>">


<input type="hidden"
name="image"
value="<%=request.getAttribute("image")%>">



<button type="submit">

Add To Cart

</button>


</form>




<div class="back">

<a href="ProductServlet">

<button>

Back To Products

</button>

</a>

</div>



</div>



</div>



</body>

</html>