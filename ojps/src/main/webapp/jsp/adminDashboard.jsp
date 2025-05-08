<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="../js/script.js"></script>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }

        h2, h3 {
            color: #004080;
        }

        .container {
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
		    margin: 0 0 20px 0;
    		font-size: 22px;
    		padding-bottom: 10px;
    		text-align: center;
    		color: #ffffff;
    		border-bottom: 2px solid #ffffff66;
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
            padding: 8px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .sidebar ul li a:hover {
            background-color: #0059b3;
        }

        .content {
            flex: 1;
            padding: 30px;
            background-color: #f0f8ff;
            box-sizing: border-box;
            overflow-y: auto;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                height: auto;
            }

            .sidebar {
                width: 100%;
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: space-around;
                padding: 15px;
            }

            .sidebar ul {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                padding: 0;
            }

            .sidebar ul li {
                margin: 5px;
            }

            .sidebar ul li a {
                font-size: 14px;
                padding: 6px 10px;
            }

            .content {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="header-row">
            <img src="../images/HirezyLogo.png" alt="Hirezy Logo" class="logo">
            <div class="menu-toggle" id="menu-toggle">&#9776;</div>
        </div>

        <form class="search-bar" action="" method="GET">
            <div class="search-field">
                <i class="fas fa-search"></i>
                <input type="text" name="keyword" placeholder="Search by Skills/Company/Job Title">
            </div>
            <div class="search-field">
                <i class="fas fa-map-marker-alt"></i>
                <input type="text" name="location" placeholder="Location">
            </div>
            <div class="search-field">
                <i class="fas fa-briefcase"></i>
                <input type="text" name="experience" placeholder="Experience">
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

    <!-- Dashboard Container -->
    <div class="container">
        <!-- Sidebar Menu -->
        <div class="sidebar">
            <h2>Admin Dashboard</h2>
            <ul>
                <li><a href="adminDashboard.jsp?view=recruiters">Recruiters</a></li>
                <li><a href="adminDashboard.jsp?view=jobseekers">Jobseekers</a></li>
                <li><a href="adminDashboard.jsp?view=availableJobs">Available Jobs</a></li>
                <li><a href="adminDashboard.jsp?view=closedJobs">Closed Jobs</a></li>
            </ul>
        </div>

        <!-- Content Area -->
        <div class="content">
            <%
                String view = request.getParameter("view");
                if (view != null) {
                    switch (view) {
                        case "recruiters": %>
                            <jsp:include page="admin/viewRecruiters.jsp" />
                        <% break;
                        case "jobseekers": %>
                            <jsp:include page="admin/viewJobseekers.jsp" />
                        <% break;
                        case "availableJobs": %>
                            <jsp:include page="admin/viewAvailableJobs.jsp" />
                        <% break;
                        case "closedJobs": %>
                            <jsp:include page="admin/viewClosedJobs.jsp" />
                        <% break;
                    }
                } else {
            %>
            <h2>Welcome to Admin Dashboard</h2>
            <p>Select an option from the sidebar to manage the portal.</p>
            <% } %>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; Hirezy. All rights reserved.</p>
    </footer>
</body>
</html>
