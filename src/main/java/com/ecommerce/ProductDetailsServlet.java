package com.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ProductDetailsServlet extends HttpServlet {


protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {


int id = Integer.parseInt(request.getParameter("id"));


try
{


Connection con = DBConnection.getConnection();


String query =
"select * from products where id=?";


PreparedStatement ps =
con.prepareStatement(query);


ps.setInt(1,id);


ResultSet rs = ps.executeQuery();



if(rs.next())
{

request.setAttribute("id",rs.getString("id"));

request.setAttribute("name",rs.getString("name"));

request.setAttribute("category",rs.getString("category"));

request.setAttribute("price",rs.getString("price"));

request.setAttribute("description",rs.getString("description"));

request.setAttribute("image",rs.getString("image"));

}



request.getRequestDispatcher("product_details.jsp")
.forward(request,response);



}
catch(Exception e)
{

e.printStackTrace();

}



}

}