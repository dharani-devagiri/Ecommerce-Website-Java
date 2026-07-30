package com.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateProductServlet extends HttpServlet {


protected void doPost(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {



int id = Integer.parseInt(request.getParameter("id"));

String name = request.getParameter("name");

String category = request.getParameter("category");

double price = Double.parseDouble(request.getParameter("price"));

String description = request.getParameter("description");

String image = request.getParameter("image");



try
{


Connection con = DBConnection.getConnection();



String query =
"UPDATE products SET name=?, category=?, price=?, description=?, image=? WHERE id=?";



PreparedStatement ps =
con.prepareStatement(query);



ps.setString(1,name);

ps.setString(2,category);

ps.setDouble(3,price);

ps.setString(4,description);

ps.setString(5,image);

ps.setInt(6,id);



int result = ps.executeUpdate();



if(result > 0)
{

    response.sendRedirect("AdminProductServlet");

}
else
{

    response.getWriter().println("Product Update Failed");

}



}
catch(Exception e)
{

e.printStackTrace();

}



}

}