package com.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AdminLoginServlet extends HttpServlet {


protected void doPost(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {


String email = request.getParameter("email");

String password = request.getParameter("password");


try {


Connection con = DBConnection.getConnection();


String query =
"select * from admin where email=? and password=?";


PreparedStatement ps =
con.prepareStatement(query);


ps.setString(1,email);

ps.setString(2,password);


ResultSet rs = ps.executeQuery();



if(rs.next())
{

    HttpSession session = request.getSession();

    session.setAttribute("admin", email);


    response.sendRedirect("admin_dashboard.jsp");

}
else
{

    response.sendRedirect("admin_login.jsp");

}


}
catch(Exception e)
{

e.printStackTrace();

}


}

}