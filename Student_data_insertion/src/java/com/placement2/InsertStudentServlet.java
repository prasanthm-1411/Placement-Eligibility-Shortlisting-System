package com.placement2;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;  // Ensure this import
import java.io.IOException;
import java.sql.*;

@WebServlet("/InsertStudentServlet")
public class InsertStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html;charset=UTF-8");

        // Get form data
        String rollNo = request.getParameter("roll_no");
        String name = request.getParameter("name");
        String class10 = request.getParameter("class10");
        String class12 = request.getParameter("class12");
        String cgpa = request.getParameter("cgpa");
        String batch = request.getParameter("batch");
        String arr = request.getParameter("arr");  // arrearsOption is either "yes" or "no"

        Connection con = null;
        PreparedStatement stmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Connect to the database
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/iwt_db", "root", "1234");

            // Prepare SQL query for inserting student details
            String query = "INSERT INTO student_db (roll_no, name, Class10, Class12, CGPA, Batch, arr) "
                         + "VALUES (?, ?, ?, ?, ?, ?, ?)";

            // Prepare the statement
            stmt = con.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(rollNo));
            stmt.setString(2, name);
            stmt.setFloat(3, Float.parseFloat(class10));
            stmt.setFloat(4, Float.parseFloat(class12));
            stmt.setFloat(5, Float.parseFloat(cgpa));
            stmt.setInt(6, Integer.parseInt(batch));

            // Set arrears field based on input
            int arr1 = "yes".equalsIgnoreCase(arr) ? 1 : 0;
            stmt.setInt(7, arr1);

            // Execute the query
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                request.setAttribute("message", "Student details inserted successfully.");
            } else {
                request.setAttribute("message", "Failed to insert student details.");
            }

            // Forward to a success or result page
            request.getRequestDispatcher("/result.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace(); // Print stack trace to server logs for debugging
            request.setAttribute("errorMessage", "Invalid input data. Please check your entries.");
            //request.getRequestDispatcher("/error.jsp").forward(request, response); // Redirect to an error page
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace to server logs for debugging
            request.setAttribute("errorMessage", "An error occurred while inserting data.");
           // request.getRequestDispatcher("/error.jsp").forward(request, response); // Redirect to an error page
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
