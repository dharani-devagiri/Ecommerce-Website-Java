package com.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AdminOrderDetailsServlet extends HttpServlet {


protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {



int orderId =
Integer.parseInt(request.getParameter("order_id"));



HashMap<String,String> order =
new HashMap<>();


ArrayList<HashMap<String,String>> items =
new ArrayList<>();



try {


Connection con = DBConnection.getConnection();


// Order details

String orderQuery =
"select * from orders where order_id=?";


PreparedStatement ps =
con.prepareStatement(orderQuery);


ps.setInt(1,orderId);


ResultSet rs =
ps.executeQuery();



if(rs.next())
{


order.put("order_id",
rs.getString("order_id"));

order.put("name",
rs.getString("customer_name"));

order.put("phone",
rs.getString("phone"));

order.put("address",
rs.getString("address"));

order.put("amount",
rs.getString("total_amount"));

order.put("status",
rs.getString("status"));

order.put("date",
rs.getString("order_date"));


}



// Order items

String itemQuery =
"select * from order_items where order_id=?";


PreparedStatement itemPs =
con.prepareStatement(itemQuery);


itemPs.setInt(1,orderId);


ResultSet itemRs =
itemPs.executeQuery();



while(itemRs.next())
{


HashMap<String,String> item =
new HashMap<>();


item.put("product",
itemRs.getString("product_name"));


item.put("quantity",
itemRs.getString("quantity"));


item.put("price",
itemRs.getString("price"));


items.add(item);


}



request.setAttribute("order",order);

request.setAttribute("items",items);



request.getRequestDispatcher("admin_order_details.jsp")
.forward(request,response);



}
catch(Exception e)
{

e.printStackTrace();

}



}


}