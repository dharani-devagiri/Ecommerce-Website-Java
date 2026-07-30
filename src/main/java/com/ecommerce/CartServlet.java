package com.ecommerce;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class CartServlet extends HttpServlet {


protected void doPost(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {


String product = request.getParameter("product");
String price = request.getParameter("price");
String image = request.getParameter("image");


HttpSession session = request.getSession();


ArrayList<HashMap<String,String>> cart =
(ArrayList<HashMap<String,String>>) session.getAttribute("cart");


if(cart == null)
{
    cart = new ArrayList<>();
}



boolean found = false;



for(HashMap<String,String> item : cart)
{

    if(item.get("product").equals(product))
    {

        int quantity =
        Integer.parseInt(item.get("quantity"));

        quantity++;

        item.put("quantity",
        String.valueOf(quantity));

        found = true;

        break;

    }

}




if(!found)
{


HashMap<String,String> item =
new HashMap<>();


item.put("product", product);

item.put("price", price);

item.put("image", image);

item.put("quantity", "1");


cart.add(item);


}



session.setAttribute("cart", cart);



response.sendRedirect("cart.jsp");



}

}