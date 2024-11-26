<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Student Details</title>
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

        .form-container {
            background-color: white; /* White background for the form */
            padding: 30px; /* Increased padding */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            width: 70%; /* Use more width of the page */
            max-width: 800px; /* Maximum width for larger screens */
            margin: 20px; /* Margin around form */
        }

        h2 {
            text-align: center; /* Centered title */
            color: #333; /* Darker color for the title */
            font-size: 28px; /* Larger font size for the title */
        }

        label {
            display: block; /* Block display for labels */
            margin: 10px 0 5px; /* Spacing around labels */
            font-size: 18px; /* Larger font size for labels */
        }

        input[type="text"], select {
            width: 100%; /* Full width inputs */
            padding: 15px; /* Increased padding inside inputs */
            border: 1px solid #ccc; /* Border styling */
            border-radius: 4px; /* Rounded corners for inputs */
            box-sizing: border-box; /* Include padding in width */
            font-size: 16px; /* Larger font size for inputs */
            margin-bottom: 15px; /* Spacing between inputs */
            transition: border-color 0.3s; /* Smooth transition for border color */
        }

        input[type="text"]:focus, select:focus {
            border-color: #007BFF; /* Change border color on focus */
            outline: none; /* Remove outline */
        }

        button {
            width: 100%; /* Full width button */
            padding: 15px; /* Increased padding inside button */
            background-color: #007BFF; /* Blue background */
            color: white; /* White text color */
            border: none; /* No border */
            border-radius: 4px; /* Rounded corners for button */
            cursor: pointer; /* Pointer cursor on hover */
            font-size: 18px; /* Larger font size for button */
            margin-top: 10px; /* Spacing above button */
            transition: background-color 0.3s; /* Smooth transition for button */
        }

        button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        /* Message Display Style */
        .message {
            text-align: center; /* Centered message */
            color: #007BFF; /* Blue color for messages */
            margin-top: 20px; /* Spacing above message */
        }
    </style>
    <script>
        function validateForm() {
            const rollNo = document.forms["studentForm"]["roll_no"].value;
            const batch = document.forms["studentForm"]["batch"].value;
            const class12 = document.forms["studentForm"]["class12"].value;
            const class10 = document.forms["studentForm"]["class10"].value;
            const cgpa = document.forms["studentForm"]["cgpa"].value;
            const arr = document.forms["studentForm"]["arr"].value;

            if (!rollNo || !batch || !class12 || !class10 || !cgpa || !arr) {
                alert("Please fill in all fields.");
                return false;
            }

            if (isNaN(class10) || isNaN(class12) || isNaN(cgpa)) {
                alert("10th Percentage, 12th Percentage, and CGPA must be numbers.");
                return false;
            }

            return true; // Form is valid
        }
    </script>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <span>Student Insertion Form</span>
    </div>

    <!-- Main Content Area -->
    <div class="content">
        <div class="form-container">
            <h2>Enter Student Details</h2>
            <form name="studentForm" action="InsertStudentServlet" method="POST" onsubmit="return validateForm()">
                <label for="roll_no">Roll Number:</label>
                <input type="text" id="roll_no" name="roll_no" required>

                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="class10">Class 10 Marks:</label>
                <input type="text" id="class10" name="class10" required>

                <label for="class12">Class 12 Marks:</label>
                <input type="text" id="class12" name="class12" required>

                <label for="cgpa">CGPA:</label>
                <input type="text" id="cgpa" name="cgpa" required>

                <label for="batch">Batch:</label>
                <select id="batch" name="batch" required>
                    <option value="">Select Batch</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                </select>

                <label for="arr">History of Arrears:</label>
                <select id="arr" name="arr" required>
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select>

                <button type="submit">Submit</button>
            </form>

            <!-- Display the message if available -->
            <c:if test="${not empty message}">
                <p class="message">${message}</p>
            </c:if>
        </div>
    </div>
</body>
</html>
