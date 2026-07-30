<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>

<head>

<title>Manage Products</title>


<style>

body{

font-family:Arial;
background:#f5f5f5;

}


.container{

width:90%;
margin:40px auto;

}


h1{

text-align:center;

}


table{

width:100%;
background:white;
border-collapse:collapse;
box-shadow:0px 5px 15px gray;

}


th,td{

padding:15px;
text-align:center;
border-bottom:1px solid gray;

}


img{

width:80px;
height:80px;
object-fit:cover;

}


button{

padding:10px 20px;
background:black;
color:white;
border:none;
cursor:pointer;

}


.delete{

background:red;

}


</style>


</head>


<body>


<div class="container">


<h1>
Manage Products
</h1>



<table>


<tr>

<th>
Image
</th>

<th>
Name
</th>

<th>
Category
</th>

<th>
Price
</th>

<th>
Action
</th>

</tr>



<%

ArrayList<HashMap<String,String>> products =
(ArrayList<HashMap<String,String>>)request.getAttribute("products");



if(products != null)
{


for(HashMap<String,String> product : products)

{

%>



<tr>


<td>

<img src="images/<%=product.get("image")%>">

</td>


<td>
<%=product.get("name")%>
</td>


<td>
<%=product.get("category")%>
</td>


<td>
₹ <%=product.get("price")%>
</td>



<td>


<a href="EditProductServlet?id=<%=product.get("id")%>">

<button>
Edit
</button>

</a>



<a href="DeleteProductServlet?id=<%=product.get("id")%>">

<button class="delete">
Delete
</button>

</a>


</td>


</tr>



<%

}

}

%>


</table>



</div>


</body>

</html>