<html>

<head>

<title>Add Product</title>

<style>

body{
    font-family:Arial;
    background:#f5f5f5;
}


.container{

    width:400px;
    margin:50px auto;
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

    width:100%;
    padding:12px;
    background:black;
    color:white;
    border:none;
    cursor:pointer;

}

</style>

</head>


<body>


<div class="container">


<h2>Add New Product</h2>


<form action="AddProductServlet" method="post">


<input type="text"
name="name"
placeholder="Product Name"
required>



<select name="category">


<option value="Laptop">
Laptop
</option>


<option value="Phone">
Phone
</option>


<option value="Headphones">
Headphones
</option>


<option value="Tshirt">
Tshirt
</option>


<option value="Shoes">
Shoes
</option>


</select>



<input type="number"
name="price"
placeholder="Price"
required>



<textarea name="description"
placeholder="Product Description">
</textarea>



<input type="text"
name="image"
placeholder="Image Name (example: iphone.jpg)"
required>



<button type="submit">

Add Product

</button>



</form>


</div>


</body>

</html>