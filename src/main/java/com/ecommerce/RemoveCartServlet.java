package com.ecommerce;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class RemoveCartServlet extends HttpServlet {


protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {


int index = Integer.parseInt(request.getParameter("index"));


HttpSession session = request.getSession();


ArrayList<HashMap<String,String>> cart =
(ArrayList<HashMap<String,String>>) session.getAttribute("cart");


if(cart != null)
{
    cart.remove(index);
}


session.setAttribute("cart", cart);


response.sendRedirect("cart.jsp");


}

}