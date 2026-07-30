package com.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AddProductServlet extends HttpServlet {


protected void doPost(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {



String name = request.getParameter("name");

String category = request.getParameter("category");

String price = request.getParameter("price");

String description = request.getParameter("description");

String image = request.getParameter("image");



try
{


double productPrice = Double.parseDouble(price);



Connection con = DBConnection.getConnection();



String query =
"INSERT INTO products(name,category,price,description,image) VALUES(?,?,?,?,?)";



PreparedStatement ps =
con.prepareStatement(query);



ps.setString(1, name);

ps.setString(2, category);

ps.setDouble(3, productPrice);

ps.setString(4, description);

ps.setString(5, image);



int result = ps.executeUpdate();



if(result > 0)
{

    response.sendRedirect("admin_dashboard.jsp");

}
else
{

    response.getWriter().println("Product not added");

}



ps.close();

con.close();



}
catch(Exception e)
{

e.printStackTrace();

response.getWriter().println("Error: " + e.getMessage());

}


}

}