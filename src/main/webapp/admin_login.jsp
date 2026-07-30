<html>

<head>

<title>Admin Login</title>

<style>

body{
    font-family:Arial;
    background:#f5f5f5;
}

.box{

    width:350px;
    margin:100px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0px 5px 15px gray;

}


input{

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

}

</style>

</head>


<body>


<div class="box">


<h2>Admin Login</h2>


<form action="AdminLoginServlet" method="post">


<input type="email"
name="email"
placeholder="Enter Email"
required>


<input type="password"
name="password"
placeholder="Enter Password"
required>


<button type="submit">
Login
</button>


</form>


</div>


</body>

</html>