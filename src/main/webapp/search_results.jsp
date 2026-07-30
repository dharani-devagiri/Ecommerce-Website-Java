<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Search Results</title>


<style>


body{

font-family:Arial;
background:#f5f5f5;

}


h1{

text-align:center;

}



.products{

display:flex;
flex-wrap:wrap;
justify-content:center;
gap:30px;

}



.card{

width:280px;
background:white;
padding:20px;
border-radius:15px;
box-shadow:0px 5px 15px gray;
text-align:center;

}



.card img{

width:200px;
height:200px;
object-fit:cover;

}



.card h2 a{

text-decoration:none;
color:black;

}



.price{

font-size:22px;
font-weight:bold;
color:#ff5722;

}



button{

background:black;
color:white;
padding:10px 20px;
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



<h1>
Search Results
</h1>



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




<p>

Category:

<%=product.get("category")%>

</p>



<p class="price">

&#8377; <%=product.get("price")%>

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


<button type="submit">

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


<h2 style="text-align:center">

No Products Found

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