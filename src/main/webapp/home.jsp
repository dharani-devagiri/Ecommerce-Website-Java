<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>E-Commerce Home</title>


<style>


*{
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}


body{

    margin:0;
    background:#f5f5f5;

}



/* Header */

.header{

    background:black;
    color:white;

    padding:25px;

    text-align:center;

}


.header h1{

    margin:0;

    font-size:40px;

}




.container{

    width:90%;

    margin:40px auto;

    text-align:center;

}



h2{

    font-size:32px;

}



/* Search */

.search-box{

    margin:30px auto;

}


.search-box input{

    width:45%;

    padding:15px;

    font-size:18px;

    border-radius:10px;

    border:2px solid #333;

}



.search-box button{

    padding:15px 35px;

    background:#ff5722;

    color:white;

    border:none;

    border-radius:10px;

    font-size:18px;

    cursor:pointer;

}





/* Categories */

.category{

    display:flex;

    justify-content:center;

    flex-wrap:wrap;

    gap:30px;

}



.card{

    width:280px;

    height:300px;

    background:white;

    border-radius:15px;

    box-shadow:0px 5px 15px gray;

    padding:20px;

    display:flex;

    flex-direction:column;

    justify-content:center;

    align-items:center;

}



.card img{

    width:150px;

    height:150px;

    object-fit:contain;

}



.card h3{

    font-size:25px;

}




.card a{

    text-decoration:none;

}



.view-btn{

    background:#ff5722;

    color:white;

    padding:12px 25px;

    border-radius:8px;

    margin-top:10px;

    display:inline-block;

}





/* Bottom buttons */


.bottom-buttons{

    margin-top:40px;

}



.bottom-buttons a{

    text-decoration:none;

}



.bottom-buttons button{

    padding:15px 35px;

    margin:15px;

    border:none;

    border-radius:10px;

    color:white;

    font-size:18px;

    cursor:pointer;

}



.orders{

    background:#1976d2;

}


.logout{

    background:#e53935;

}





</style>


</head>



<body>



<div class="header">


<h1>

Welcome to E-Commerce Website

</h1>


</div>




<div class="container">


<h2>

Shop By Category

</h2>





<div class="search-box">


<input type="text" placeholder="Search Products...">


<button>

Search

</button>


</div>





<div class="category">



<!-- Laptop -->

<div class="card">


<img src="images/laptop.png">


<h3>
Laptop
</h3>


<a href="CategoryServlet?category=Laptop"
class="view-btn">

View Products

</a>


</div>





<!-- Mobile -->

<div class="card">


<img src="images/mobile.png">


<h3>
Phone
</h3>


<a href="CategoryServlet?category=Mobile"
class="view-btn">

View Products

</a>


</div>






<!-- Headphones -->

<div class="card">


<img src="images/headphones.png">


<h3>
Headphones
</h3>


<a href="CategoryServlet?category=Headphones"
class="view-btn">

View Products

</a>


</div>






<!-- Clothing -->

<div class="card">


<img src="images/tshirt.png">


<h3>
Tshirt
</h3>


<a href="CategoryServlet?category=Clothing"
class="view-btn">

View Products

</a>


</div>






<!-- Footwear -->

<div class="card">


<img src="images/shoes.png">


<h3>
Shoes
</h3>


<a href="CategoryServlet?category=Footwear"
class="view-btn">

View Products

</a>


</div>



</div>





<div class="bottom-buttons">


<a href="MyOrdersServlet">

<button class="orders">

My Orders

</button>

</a>




<a href="login.jsp">

<button class="logout">

Logout

</button>

</a>



</div>




</div>




</body>

</html>