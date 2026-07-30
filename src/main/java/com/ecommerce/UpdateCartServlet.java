package com.ecommerce;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class UpdateCartServlet extends HttpServlet {


protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {


int index = Integer.parseInt(request.getParameter("index"));

String action = request.getParameter("action");


HttpSession session = request.getSession();


ArrayList<HashMap<String,String>> cart =
(ArrayList<HashMap<String,String>>) session.getAttribute("cart");



if(cart != null)
{


HashMap<String,String> item = cart.get(index);


int quantity =
Integer.parseInt(item.get("quantity"));



if(action.equals("increase"))
{

    quantity++;

}


else if(action.equals("decrease"))
{

    if(quantity > 1)
    {
        quantity--;
    }

}



item.put("quantity", String.valueOf(quantity));


}



session.setAttribute("cart", cart);


response.sendRedirect("cart.jsp");


}

}