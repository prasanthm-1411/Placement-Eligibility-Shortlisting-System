package com.placement1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dcode = request.getParameter("dcode");
        String password = request.getParameter("password");

        // Replace with your database credentials
        String dbURL = "jdbc:mysql://localhost:3306/iwt_db"; // database URL
        String dbUser = "root"; // database username
        String dbPassword = "1234"; // database password

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC Driver
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String sql = "SELECT * FROM login WHERE dcode = ? AND password = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, dcode);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Successful login, redirect to index.jsp
                response.sendRedirect("form.jsp");
            } else {
                // Login failed, show error message
                request.setAttribute("errorMessage", "Login failed. Please try again.");
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
