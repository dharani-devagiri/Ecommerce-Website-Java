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
    padding:20px;
    text-align:center;
    border-radius:15px;
    box-shadow:0px 5px 15px gray;

}


.card:hover{

    transform:scale(1.05);

}



.card img{

    width:200px;
    height:200px;
    object-fit:cover;
    border-radius:10px;

}



.price{

    font-size:20px;
    font-weight:bold;
    color:green;

}



button{

    background:#ff5722;
    color:white;
    padding:12px 20px;
    border:none;
    border-radius:8px;
    cursor:pointer;
    margin:5px;

}



.details{

    background:black;

}


a{

    text-decoration:none;

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



<img src="images/<%=product.get("image")%>"
     onerror="this.src='images/default.jpg'">



<h2>
<%=product.get("name")%>
</h2>



<p>
Category:
<%=product.get("category")%>
</p>



<p class="price">

₹ <%=product.get("price")%>

</p>



<p>
<%=product.get("description")%>
</p>



<a href="ProductDetailsServlet?id=<%=product.get("id")%>">

<button class="details">

View Details

</button>

</a>




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

Add to Cart

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



<center>

<a href="home.jsp">

<button>
Back To Home
</button>

</a>

</center>



</body>

</html>