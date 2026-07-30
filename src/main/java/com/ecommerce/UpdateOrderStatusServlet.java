package com.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class UpdateOrderStatusServlet extends HttpServlet {


protected void doPost(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {


int orderId =
Integer.parseInt(request.getParameter("order_id"));


String status =
request.getParameter("status");



try {


Connection con = DBConnection.getConnection();



String query =
"update orders set status=? where order_id=?";



PreparedStatement ps =
con.prepareStatement(query);



ps.setString(1,status);

ps.setInt(2,orderId);



ps.executeUpdate();



response.sendRedirect("AdminOrdersServlet");



}
catch(Exception e)
{

e.printStackTrace();

}



}


}