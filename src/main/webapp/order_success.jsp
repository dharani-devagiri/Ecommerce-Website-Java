<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Order Success</title>


<style>

body{
    font-family:Arial;
    text-align:center;
    margin-top:100px;
}


.box{

    background:#f2f2f2;
    width:500px;
    margin:auto;
    padding:40px;
    border-radius:15px;

}


h1{
    color:green;
}


button{

    background:black;
    color:white;
    padding:12px 25px;
    border:none;

}

</style>


</head>


<body>


<div class="box">


<h1>Order Placed Successfully!</h1>


<p>
Thank you for shopping with us.
</p>


<form action="ProductServlet">

<button type="submit">
Continue Shopping
</button>

</form>


</div>


</body>

</html>