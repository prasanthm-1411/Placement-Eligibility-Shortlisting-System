<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filtered Students</title>
    <style>
        body {
            background-color: #f0f8ff; /* Light background color */
            font-family: Arial, sans-serif; /* Font styling */
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }

        /* Navigation Bar Style */
        .navbar {
            background-color: #007BFF; /* Blue background for navbar */
            padding: 15px; /* Padding for navbar */
            text-align: center; /* Center align text in navbar */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Subtle shadow for navbar */
            position: relative; /* Position for fixed navbar */
            z-index: 1000; /* Ensure navbar is above other elements */
        }

        .navbar span {
            color: white; /* White text color */
            font-size: 24px; /* Larger font size */
            font-weight: bold; /* Bold text */
        }

        /* Main Content Area */
        .content {
            display: flex;
            justify-content: center; /* Center the content */
            align-items: flex-start; /* Align items to start */
            padding: 20px; /* Padding around content */
            height: calc(100vh - 60px); /* Full viewport height minus navbar height */
        }

        .table-container {
            background-color: white; /* White background for the table */
            padding: 30px; /* Increased padding */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            width: 70%; /* Use more width of the page */
            max-width: 800px; /* Maximum width for larger screens */
            margin: 20px; /* Margin around table */
        }

        h2 {
            text-align: center; /* Centered title */
            color: #333; /* Darker color for the title */
            font-size: 28px; /* Larger font size for the title */
        }

        table {
            width: 100%;
            border-collapse: collapse; /* Merge borders */
        }

        table, th, td {
            border: 1px solid black; /* Border for table */
        }

        th, td {
            padding: 12px; /* Padding for table cells */
            text-align: left; /* Left align text */
        }

        th {
            background-color: #f2f2f2; /* Light gray background for headers */
        }

        /* Footer Styling */
        footer {
            background-color: #007BFF; /* Footer color */
            color: white; /* Footer text color */
            text-align: center; /* Centered text */
            padding: 10px 0; /* Padding for footer */
            position: relative; /* Relative positioning */
            bottom: 0; /* Stick to bottom */
            width: 100%; /* Full width */
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <span>Placement Filter System</span>
    </div>

    <!-- Main Content Area -->
    <div class="content">
        <div class="table-container">
            <h2>Eligible Students</h2>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>CGPA</th>
                        <th>Batch</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet rs = (ResultSet) request.getAttribute("result");
                        if (rs != null) {
                            boolean hasResults = false; // Flag to check if there are any results
                            while (rs.next()) {
                                hasResults = true; // We have results to show
                    %>
                    <tr>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("CGPA") %></td>
                        <td><%= rs.getString("Batch") %></td>
                    </tr>
                    <%
                            }
                            if (!hasResults) {
                    %>
                    <tr>
                        <td colspan="3">No eligible students found.</td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="3">No results returned.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
