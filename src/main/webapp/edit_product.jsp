<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>

<title>Edit Product</title>


<style>

body{

font-family:Arial;
background:#f5f5f5;

}


.container{

width:50%;
margin:40px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0px 5px 15px gray;

}


input,textarea,select{

width:100%;
padding:12px;
margin:10px 0;

}


button{

background:black;
color:white;
padding:12px 25px;
border:none;
cursor:pointer;

}


</style>


</head>


<body>


<div class="container">


<h1>
Edit Product
</h1>


<form action="UpdateProductServlet" method="post">


<input type="hidden"
name="id"
value="<%=request.getAttribute("id")%>">



<label>
Product Name
</label>


<input type="text"
name="name"
value="<%=request.getAttribute("name")%>"
required>



<label>
Category
</label>


<input type="text"
name="category"
value="<%=request.getAttribute("category")%>"
required>



<label>
Price
</label>


<input type="text"
name="price"
value="<%=request.getAttribute("price")%>"
required>



<label>
Description
</label>


<textarea name="description">

<%=request.getAttribute("description")%>

</textarea>



<label>
Image Name
</label>


<input type="text"
name="image"
value="<%=request.getAttribute("image")%>">



<button type="submit">

Update Product

</button>



</form>


</div>


</body>

</html>