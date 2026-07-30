<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>

body{
    font-family: Arial;
    background-color: #f2f2f2;
}

h1{
    text-align:center;
    margin-top:50px;
}

.login-box{
    width:350px;
    margin:50px auto;
    background:white;
    padding:30px;
    border-radius:10px;
}

input{
    width:100%;
    padding:12px;
    margin:10px 0;
    box-sizing:border-box;
}

button{
    width:100%;
    padding:12px;
    background:black;
    color:white;
    border:none;
    cursor:pointer;
}

button:hover{
    background:#333;
}

a{
    display:block;
    text-align:center;
    margin-top:15px;
}

</style>

</head>

<body>

<h1>Login</h1>

<div class="login-box">

<form action="LoginServlet" method="post">

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


<a href="register.jsp">
Create New Account
</a>


</form>

</div>

</body>
</html>