package com.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ProductServlet extends HttpServlet {


protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {



ArrayList<HashMap<String,String>> products = new ArrayList<>();


try
{


Connection con = DBConnection.getConnection();



String category = request.getParameter("category");


PreparedStatement ps;



if(category != null && !category.equals(""))
{

    String query =
    "select * from products where category=?";

    ps = con.prepareStatement(query);

    ps.setString(1, category);

}
else
{

    String query =
    "select * from products";

    ps = con.prepareStatement(query);

}



ResultSet rs = ps.executeQuery();



while(rs.next())
{


HashMap<String,String> product =
new HashMap<>();


product.put("id",
rs.getString("id"));


product.put("name",
rs.getString("name"));


product.put("category",
rs.getString("category"));


product.put("price",
rs.getString("price"));


product.put("image",
rs.getString("image"));


product.put("description",
rs.getString("description"));



products.add(product);


}



request.setAttribute("products", products);



request.getRequestDispatcher("products.jsp")
.forward(request,response);



}
catch(Exception e)
{

e.printStackTrace();

}


}

}