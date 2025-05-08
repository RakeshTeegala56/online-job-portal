<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Jobseeker Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="../js/script.js"></script>
    <style>
        footer {
            bottom: 0;
            width: 100%;
            height: 60px;
        }

        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
        }

        footer {
            height: 60px;
            background-color: #007bff;
            color: white;
            text-align: center;
            line-height: 60px;
        }

        .dashboard-container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #004080;
            color: white;
            padding: 20px;
            box-sizing: border-box;
        }

        .sidebar h2 {
            margin-top: 0;
            font-size: 20px;
            border-bottom: 1px solid #ffffff66;
            padding-bottom: 10px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 15px 0;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            display: block;
            transition: background-color 0.3s;
            padding: 8px;
            border-radius: 4px;
        }

        .sidebar ul li a:hover {
            background-color: #0059b3;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            background-color: #f0f8ff;
            box-sizing: border-box;
        }

        .main-content h2 {
            color: #004080;
        }

        @media (max-width: 768px) {
            .dashboard-container {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: space-around;
            }
            .sidebar ul {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
            }
            .sidebar ul li {
                margin: 5px;
            }
            .sidebar ul li a {
                font-size: 14px;
                padding: 6px 10px;
            }
            .main-content {
                padding: 10px;
            }
        }
    </style>
</head>
<body>

<header>
    <div class="header-row">
        <img src="../images/HirezyLogo.png" alt="Hirezy Logo" class="logo">
        <div class="menu-toggle" id="menu-toggle">&#9776;</div>
    </div>

    <form class="search-bar" action="" method="GET">
        <div class="search-field">
            <i class="fas fa-search"></i> <input type="text" name="keyword" placeholder="Search by Skills/Company/Job Title">
        </div>
        <div class="search-field">
            <i class="fas fa-map-marker-alt"></i> <input type="text" name="location" placeholder="Location">
        </div>
        <div class="search-field">
            <i class="fas fa-briefcase"></i> <input type="text" name="experience" placeholder="Experience">
        </div>
        <button type="submit">Search</button>
    </form>

    <nav id="nav-menu">
        <a href="../html/index.html">Home</a>
        <a href="../html/about.html">About Us</a>
        <a href="../html/contact.html">Contact Us</a>
        <a href="../html/signup.html">Sign up</a>
        <a href="../html/login.html">Login</a>
    </nav>
</header>

<div class="dashboard-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Jobseeker Dashboard</h2>
        <ul>
            <li><a href="jobseekerDashboard.jsp?view=myJobs">My Jobs</a></li>
            <li><a href="jobseekerDashboard.jsp?view=jobs">Jobs</a></li>
            <li><a href="jobseekerDashboard.jsp?view=updateProfile">Update Profile</a></li>
            <li><a href="jobseekerDashboard.jsp?view=addProfile">Add Profile</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <%
            String msg = request.getParameter("msg");
            if (msg != null) {
        %>
            <div class="message-box">
                <%= msg %>
            </div>
        <%
            }
        
            String view = request.getParameter("view");
            if (view != null) {
                switch (view) {
                    case "myJobs":
        %>
<%--                         <jsp:include page="jobseeker/viewMyApplications.jsp" /> --%>
        <%
                        break;
                    case "jobs":
        %>
<%--                         <jsp:include page="jobseeker/viewAllJobs.jsp" /> --%>
        <%
                        break;
                    case "updateProfile":
        %>
<%--                         <jsp:include page="jobseeker/updateProfile.jsp" /> --%>
        <%
                        break;
                    case "addProfile":
        %>
<%--                         <jsp:include page="jobseeker/addProfile.jsp" /> --%>
        <%
                        break;
                }
            } else {
        %>
            <h2>Welcome to your Jobseeker Dashboard</h2>
            <p>Select an option from the sidebar to get started.</p>
        <%
            }
        %>
    </div>
</div>

<footer>
    <p>&copy; Hirezy. All rights reserved.</p>
</footer>

</body>
</html>
