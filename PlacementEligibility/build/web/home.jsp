<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>

    <style>
        body {
            background-color: #e3f2fd; /* Light blue background for consistency */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 80px auto; /* Added margin at the top for spacing */
            background: #ffffff; /* White background for the container */
            padding: 30px; /* Increased padding for better spacing */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
            font-size: 28px; /* Increased font size for the title */
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #3498db; /* Consistent blue for the button */
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #2980b9; /* Darker blue on hover */
        }
        .error {
            color: red;
            text-align: center;
            margin-top: 10px; /* Added margin for spacing */
        }
    </style>
    
</head>
<body>
    <div class="container">
        <h2>Admin Login</h2>
        <form action="LoginServlet" method="post">
            <label for="dcode">Department Code:</label>
            <input type="text" id="dcode" name="dcode" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Login">
        </form>

        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <div class="error"><%= errorMessage %></div>
        <%
            }
        %>
    </div>
</body>
</html>
