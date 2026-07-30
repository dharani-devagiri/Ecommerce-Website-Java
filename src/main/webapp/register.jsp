<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>User Registration</title>

<style>

body{
    font-family: Arial, sans-serif;
    background:#f2f2f2;
    text-align:center;
}

h1{
    color:#333;
}

form{

    background:white;
    width:350px;
    margin:50px auto;
    padding:25px;
    border-radius:10px;
    box-shadow:0px 0px 10px gray;

}


input{

    width:90%;
    padding:10px;
    margin:10px;
    border:1px solid #ccc;
    border-radius:5px;

}


button{

    width:150px;
    padding:12px;
    margin-top:15px;
    background:#000;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;

}


button:hover{

    background:#333;

}


</style>

</head>


<body>


<h1>Create Account</h1>


<form action="RegisterServlet" method="post">


    <input type="text" 
           name="name" 
           placeholder="Enter Name"
           required>


    <input type="email" 
           name="email" 
           placeholder="Enter Email"
           required>


    <input type="password" 
           name="password" 
           placeholder="Enter Password"
           required>


    <input type="text" 
           name="phone" 
           placeholder="Enter Phone Number"
           required>


    <input type="text" 
           name="address" 
           placeholder="Enter Address"
           required>


    <button type="submit">
        Register
    </button>


</form>


</body>

</html>