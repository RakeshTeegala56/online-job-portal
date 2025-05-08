<%@ page import="javax.servlet.http.HttpSession" %>
<%
    Integer recruiterId = (Integer) session.getAttribute("user_id");
    if (recruiterId == null) {
        response.sendRedirect("../html/login.html");
        return;
    }
%>

<style>
    .form-wrapper {
        padding-bottom: 60px; /* ensures space above footer */
    }

    .form-container {
        max-width: 700px;
        margin: auto;
        background: #fff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        font-family: Arial, sans-serif;
        border-radius: 5px;
    }

    .form-container h2 {
        text-align: center;
        color: #004080;
        margin-bottom: 20px;
    }

    .form-container label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #333;
    }

    .form-container input[type="text"],
    .form-container input[type="number"],
    .form-container input[type="date"],
    .form-container textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }

    .form-container textarea {
        resize: vertical;
    }

    .form-container input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 12px;
        width: 100%;
        border-radius: 4px;
        font-size: 16px;
        cursor: pointer;
    }

    .form-container input[type="submit"]:hover {
        background-color: #0056b3;
    }

    @media (max-width: 600px) {
        .form-container {
            padding: 15px;
        }

        .form-container input,
        .form-container textarea {
            font-size: 13px;
        }
    }
</style>

<div class="form-container">
    <h2>Create New Job</h2>
<div class="form-wrapper">
    <form action="/ojp/createJob" method="post">
        <label>Job Title:</label>
        <input type="text" name="job_title" required>

        <label>Company:</label>
        <input type="text" name="company" required>

        <label>Industry:</label>
        <input type="text" name="industry" required>

        <label>Location:</label>
        <input type="text" name="job_location" required>

        <label>Salary:</label>
        <input type="number" step="0.01" name="salary" required>

        <label>Job Type:</label>
        <input type="text" name="job_type" required>

        <label>Experience Required (Years):</label>
        <input type="number" name="experience_required">

        <label>Last Date to Apply:</label>
        <input type="date" name="last_date_to_apply" required>

        <label>Job Role:</label>
        <input type="text" name="job_role" required>

        <label>Job Description:</label>
        <textarea name="job_description" rows="4" cols="50"></textarea>

        <input type="submit" value="Create Job">
    </form>
</div>
</div>
