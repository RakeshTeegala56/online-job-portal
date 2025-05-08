<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    Integer recruiterId = (Integer) session.getAttribute("user_id");

    if (recruiterId == null) {
        response.sendRedirect("../html/login.html");
        return;
    }
%>

<style>
    #form-wrapper {
        padding-bottom: 60px; /* ensures space above footer */
    }

    #form-container {
        max-width: 700px;
        margin: auto;
        background: #fff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        font-family: Arial, sans-serif;
        border-radius: 5px;
    }

    #form-container h2 {
        text-align: center;
        color: #004080;
        margin-bottom: 20px;
    }

    #form-container label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #333;
    }

    #form-container input[type="text"],
    #form-container input[type="number"],
    #form-container input[type="date"],
    #form-container textarea,
    #form-container select {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }

    #form-container textarea {
        resize: vertical;
    }

    #form-container input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 12px;
        width: 100%;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
    }

    #form-container input[type="submit"]:hover {
        background-color: #0056b3;
    }

    @media (max-width: 600px) {
        #form-container {
            padding: 15px;
        }

        #form-container input,
        #form-container textarea,
        #form-container select {
            font-size: 13px;
        }
    }
</style>

<h2>Update Job Posting</h2>

<div id="form-container">
    <form method="post" action="/ojp/updateJob">
        <div id="form-wrapper">
            <label>Select Job to Update:</label><br>
            <select name="job_id" required>
                <%
                    try {
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ojps", "root");
                        PreparedStatement ps = con.prepareStatement("SELECT job_id, job_title FROM jobs WHERE recruiter_id = ?");
                        ps.setInt(1, recruiterId);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <option value="<%= rs.getInt("job_id") %>"><%= rs.getString("job_title") %></option>
                <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
                %>
            </select><br><br>

            <label>Job Title:</label><br>
            <input type="text" name="job_title" required><br><br>

            <label>Job Description:</label><br>
            <textarea name="job_description" rows="4" cols="50" required></textarea><br><br>

            <label>Location:</label><br>
            <input type="text" name="job_location" required><br><br>

            <label>Salary:</label><br>
            <input type="number" name="salary" step="any" required><br><br>

            <label>Job Type:</label><br>
            <input type="text" name="job_type" required><br><br>

            <label>Experience Required (years):</label><br>
            <input type="number" name="experience_required" required><br><br>

            <input type="submit" value="Update Job">
        </div>
    </form>
</div>
