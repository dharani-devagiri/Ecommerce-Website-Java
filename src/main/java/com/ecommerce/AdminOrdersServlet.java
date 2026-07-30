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

public class AdminOrdersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<HashMap<String, String>> orders =
                new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT * FROM orders ORDER BY order_id DESC";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                HashMap<String, String> order =
                        new HashMap<>();

                // Order ID
                order.put(
                        "order_id",
                        rs.getString("order_id")
                );

                // Email
                order.put(
                        "email",
                        rs.getString("user_email")
                );

                // Total Amount
                order.put(
                        "amount",
                        rs.getString("total_amount")
                );

                // Order Date
                order.put(
                        "date",
                        rs.getString("order_date")
                );

                // Customer Name
                order.put(
                        "name",
                        rs.getString("customer_name")
                );

                // Phone
                order.put(
                        "phone",
                        rs.getString("phone")
                );

                // Address
                order.put(
                        "address",
                        rs.getString("address")
                );

                // Status
                order.put(
                        "status",
                        rs.getString("status")
                );

                orders.add(order);
            }

            request.setAttribute("orders", orders);

            request.getRequestDispatcher("admin_orders.jsp")
                    .forward(request, response);

        }
        catch (Exception e) {

            e.printStackTrace();

        }

    }

}