package com.ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, 
                          HttpServletResponse response)
            throws ServletException, IOException {


        System.out.println("Register Servlet Started");


        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");


        try {

            Connection con = DBConnection.getConnection();

            System.out.println("Connection Object: " + con);


            if(con == null) {

                response.getWriter().println("Database Connection Failed");
                return;

            }


            String query = 
            "INSERT INTO users(name,email,password,phone,address,role) VALUES(?,?,?,?,?,?)";


            PreparedStatement ps = con.prepareStatement(query);


            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, "customer");


            int result = ps.executeUpdate();


            System.out.println("Rows inserted: " + result);


            if(result > 0) {

                response.sendRedirect("login.jsp");

            }
            else {

                response.getWriter().println("Registration Failed");

            }


            ps.close();
            con.close();


        } 
        catch(Exception e) {

            e.printStackTrace();
            response.getWriter().println(e);

        }

    }
}