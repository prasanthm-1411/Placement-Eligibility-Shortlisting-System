<!DOCTYPE html>
<html>
<head>
    <title>Student Insertion Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center; /* Center align items in the flex container */
        }
        h2 {
            color: #333;
        }
        .message {
            margin-top: 20px;
            font-size: 20px;
            color: green;
            border: 1px solid #d4edda;
            background-color: #d4edda;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            width: 100%; /* Make the message box responsive */
            max-width: 600px; /* Limit max width */
        }
        .nav-bar {
            display: flex;
            justify-content: center; /* Center the nav items */
            background-color: #007bff; /* Background color for the navbar */
            border-radius: 5px;
            margin-top: 20px;
            padding: 10px 20px;
            width: 100%;
            max-width: 600px; /* Limit max width of navbar */
        }
        .nav-item {
            margin: 0 15px;
            color: white;
            text-decoration: none;
            font-size: 16px;
        }
        .back-button {
            margin-top: 30px;
            padding: 10px 15px;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Student Insertion Status</h2>

    <!-- Display the success or failure message -->
    <p class="message">${message}</p>

    
    

    <!-- Button to go back to the form to insert another student -->
    <a class="back-button" href="index.jsp">Insert Another Student</a>
</body>
</html>
