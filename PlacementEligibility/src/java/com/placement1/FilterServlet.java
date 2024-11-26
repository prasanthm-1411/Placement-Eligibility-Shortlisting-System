package com.placement1;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.sql.*;

public class FilterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get form data
        String cgpa = request.getParameter("cgpa");
        String class10 = request.getParameter("class10");
        String class12 = request.getParameter("class12");
        String arr = request.getParameter("arr");  // arrearsOption is either "yes" or "no"
        String batch = request.getParameter("batch");

        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Connect to the database
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/iwt_db", "root", "1234");

            // Prepare the base SQL query to filter students
            String query = "SELECT * FROM student_db WHERE CGPA >= ? AND Class10 >= ? AND Class12 >= ? AND Batch = ?";

            // Modify the query based on the arrears filter
            if ("No".equals(arr)) {
                query += " AND arr = 0"; // Select only students with no arrears
            } 
            // If "yes" is chosen, no additional condition is needed (select both arr = 0 and arr = 1)

            // Prepare the statement
            stmt = con.prepareStatement(query);
            stmt.setString(1, cgpa);
            stmt.setString(2, class10);
            stmt.setString(3, class12);
            stmt.setString(4, batch);

            // Execute the query
            rs = stmt.executeQuery();
            request.setAttribute("result", rs);

            // Forward the results to the JSP page for display
            request.getRequestDispatcher("/displayResult.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace to server logs for debugging
            request.setAttribute("errorMessage", "An error occurred while fetching data.");
            request.getRequestDispatcher("/error.jsp").forward(request, response); // Redirect to an error page
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
