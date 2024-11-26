<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home - Placement Eligibility Filter System</title>
    <style>
        body {
            background-color: #e3f2fd; /* Light blue background for the entire page */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #3498db; /* Navbar color */
            overflow: hidden;
            padding: 10px;
        }
        .navbar a {
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            float: left;
        }
        .navbar a:hover {
            background-color: #2980b9;
        }
        .hero {
            background-color: #3498db; /* Consistent blue for the hero section */
            color: white;
            padding: 50px 0;
            text-align: center;
        }
        .hero h1 {
            font-size: 36px; /* Reduced font size for title */
            margin: 0; /* Remove default margin */
        }
        .hero p {
            font-size: 18px; /* Font size for subtitle */
        }
        .flash-news {
            background-color: #fff; /* White background for flash news */
            color: #333; /* Dark text color for contrast */
            padding: 10px;
            overflow: hidden;
            position: relative;
            white-space: nowrap;
            animation: news-ticker 15s linear infinite; /* Animation for the ticker */
        }
        @keyframes news-ticker {
            0% { transform: translateX(70%); }
            100% { transform: translateX(-70%); }
        }
        .content {
            padding: 20px;
            max-width: 800px;
            margin: 20px auto; /* Added margin to separate from other content */
            background: white; /* White background for content box */
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center; /* Centered text for the content */
        }
        .admin-login-button {
            width: 100%;
            padding: 15px;
            background-color: #3498db; /* Consistent blue for button */
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 20px; /* Increased font size */
            cursor: pointer;
            margin-top: 20px; /* Space above the button */
        }
        .admin-login-button:hover {
            background-color: #2980b9; /* Darker blue on hover */
        }
        .image-container {
            text-align: center;
            margin: 20px 0;
        }
        .image-container img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .footer {
            text-align: center;
            padding: 20px;
            background-color: #3498db; /* Consistent blue for footer */
            color: white;
            position: relative;
            bottom: 0;
            width: 100%;
        }
        .top-image {
            text-align: center;
            margin: 20px 0;
        }
        .top-image img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
    </style>
</head>
<body>

    <div class="top-image">
        <img src="nec_name.jpg" alt="Top Image"> <!-- Top Image -->
    </div>

    <div class="hero">
        <h1>Welcome to the Campus Recruitment Eligibility Portal</h1>
        <p>Your gateway to find eligible students for placement opportunities.</p>
    </div>

    <div class="flash-news">
        <p>Flash News: New placement opportunities available for 2026 batch! Click to see the Accenture Innovation Challenge |</p>
    </div>

    <div class="content">
        <form action="home.jsp"> <!-- Directly links to login.jsp -->
            <input type="submit" value="Admin Login" class="admin-login-button"> <!-- Admin Login Button -->
        </form>
    </div>

    <div class="image-container">
        <img src="nec_place_statis.png" alt="Placement System Image"> <!-- Placement System Image -->
    </div>

    <div class="footer">
        <p>Contact Us:</p>
    </div>

</body>
</html>
