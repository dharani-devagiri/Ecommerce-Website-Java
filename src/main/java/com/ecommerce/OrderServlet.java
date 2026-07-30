package com.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class OrderServlet extends HttpServlet {


protected void doPost(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {


String name = request.getParameter("name");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String total = request.getParameter("total");


HttpSession session = request.getSession();


String email = (String)session.getAttribute("email");



ArrayList<HashMap<String,String>> cart =
(ArrayList<HashMap<String,String>>)session.getAttribute("cart");



try {


Connection con = DBConnection.getConnection();


con.setAutoCommit(false);


// Insert order

String orderQuery =
"insert into orders(user_email,total_amount,order_date,customer_name,phone,address,status) values(?,?,CURDATE(),?,?,?,'Order Placed')";



PreparedStatement ps =
con.prepareStatement(orderQuery, Statement.RETURN_GENERATED_KEYS);



ps.setString(1,email);

ps.setDouble(2,Double.parseDouble(total));

ps.setString(3,name);

ps.setString(4,phone);

ps.setString(5,address);



ps.executeUpdate();



// Get generated order id

ResultSet rs =
ps.getGeneratedKeys();


int orderId=0;


if(rs.next())
{
    orderId = rs.getInt(1);
}



// Insert order items


String itemQuery =
"insert into order_items(order_id,product_name,quantity,price) values(?,?,?,?)";



PreparedStatement itemPs =
con.prepareStatement(itemQuery);



if(cart != null)
{


for(HashMap<String,String> item : cart)

{


itemPs.setInt(1,orderId);

itemPs.setString(2,item.get("product"));

itemPs.setInt(3,Integer.parseInt(item.get("quantity")));

itemPs.setDouble(4,Double.parseDouble(item.get("price")));


itemPs.executeUpdate();


}


}



con.commit();



session.removeAttribute("cart");


response.sendRedirect("success.jsp");



}
catch(Exception e)

{

e.printStackTrace();

}



}

}