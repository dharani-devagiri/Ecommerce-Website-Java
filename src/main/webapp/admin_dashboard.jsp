<html>

<head>

<title>Admin Dashboard</title>


<style>

body{

font-family:Arial;
background:#f5f5f5;

}


.container{

width:80%;
margin:50px auto;
text-align:center;

}


.card{

display:inline-block;
width:220px;
padding:30px;
margin:20px;
background:white;
border-radius:15px;
box-shadow:0px 5px 15px gray;

}


button{

padding:12px 25px;
background:black;
color:white;
border:none;
cursor:pointer;
border-radius:8px;

}


button:hover{

background:#ff5722;

}


</style>

</head>


<body>


<div class="container">


<h1>
Admin Dashboard
</h1>


<h2>
Welcome Admin
</h2>



<div class="card">

<h3>
View Orders
</h3>

<a href="AdminOrdersServlet">

<button>
View
</button>

</a>

</div>




<div class="card">

<h3>
Add Product
</h3>

<a href="add_product.jsp">

<button>
Add
</button>

</a>

</div>




<div class="card">

<h3>
Manage Products
</h3>

<a href="AdminProductServlet">

<button>
View Products
</button>

</a>

</div>




<div class="card">

<h3>
Update Product
</h3>

<a href="AdminProductServlet">

<button>
Update
</button>

</a>

</div>




<div class="card">

<h3>
Delete Product
</h3>

<a href="AdminProductServlet">

<button>
Delete
</button>

</a>

</div>




</div>


</body>

</html>