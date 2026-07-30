package com.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class MyOrdersServlet extends HttpServlet {


protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {



HttpSession session = request.getSession();


String email = (String)session.getAttribute("email");


ArrayList<HashMap<String,String>> orders =
new ArrayList<>();



try {


Connection con = DBConnection.getConnection();



String query =
"select * from orders where user_email=?";



PreparedStatement ps =
con.prepareStatement(query);


ps.setString(1,email);



ResultSet rs = ps.executeQuery();



while(rs.next())

{


HashMap<String,String> order =
new HashMap<>();



int orderId =
rs.getInt("order_id");



order.put("order_id",
String.valueOf(orderId));


order.put("amount",
rs.getString("total_amount"));


order.put("date",
rs.getString("order_date"));


order.put("status",
rs.getString("status"));


order.put("name",
rs.getString("customer_name"));


order.put("phone",
rs.getString("phone"));


order.put("address",
rs.getString("address"));




// Fetch order items

String itemQuery =
"select * from order_items where order_id=?";


PreparedStatement itemPs =
con.prepareStatement(itemQuery);


itemPs.setInt(1,orderId);



ResultSet itemRs =
itemPs.executeQuery();



String items="";



while(itemRs.next())

{


items += itemRs.getString("product_name")
+ " (Qty: "
+ itemRs.getString("quantity")
+ ") - ₹"
+ itemRs.getString("price")
+ "<br>";



}



order.put("items",items);



orders.add(order);



}



request.setAttribute("orders",orders);



request.getRequestDispatcher("myorders.jsp")
.forward(request,response);



}
catch(Exception e)

{

e.printStackTrace();

}



}


}