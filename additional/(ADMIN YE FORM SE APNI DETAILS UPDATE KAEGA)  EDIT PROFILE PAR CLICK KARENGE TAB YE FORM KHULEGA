
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upd_admin_profile.aspx.cs" Inherits="newres.upd_admin_profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Profile</title>
    <style>
        /* Global Styles */
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #eef2f7;
            height: 100%;
            color: #333;
        }

        /* Layout - Sidebar and Content */
        .layout {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            background-color: #1a1f36;
            color: #fff;
            width: 220px;
            padding: 20px;
            position: fixed;
            height: 100%;
            font-size: 13px;
        }

        .sidebar h2 {
            color: #ffcc00;
            font-size: 1.5rem;
            margin-bottom: 30px;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            color: #d1d4da;
            text-decoration: none;
            font-size: 0.9rem;
            display: block;
            padding: 10px;
            border-radius: 8px;
            transition: background-color 0.3s ease, color 0.3s ease;
            background-color: #1a1f36;
        }

        .sidebar ul li a:hover, .sidebar ul li a.active {
            background-color: #ffcc00;
            color: #1a1f36;
        }

        /* Form Container Styles */
        .form-container {
            margin-left: 240px; /* Adjusted for sidebar */
            background: #fff;
            border-radius: 8px;
            padding: 40px; /* Increased padding */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            max-width: 600px; /* Increased max-width */
            margin: 50px auto; /* Centered with top margin */
            flex-grow: 1; /* Allows it to take up remaining space */
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 30px; /* Increased margin for better spacing */
        }

        .form-group {
            margin-bottom: 20px; /* Increased bottom margin */
        }

        .form-group label {
            display: block;
            margin-bottom: 10px; /* Increased bottom margin */
            font-weight: bold; /* Added bold for better visibility */
        }

        .form-group input {
            width: 100%;
            padding: 12px; /* Increased padding for better touch area */
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px; /* Increased font size */
        }

        .btn {
            width: 100%;
            padding: 12px; /* Increased padding */
            background-color: #ffcc00;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px; /* Increased font size */
            font-weight: bold; /* Made button text bold */
        }

        .btn:hover {
            background-color: #e0b800;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .sidebar {
                position: absolute;
                width: 100%;
                height: auto;
                padding: 10px;
            }

            .form-container {
                margin-left: 0;
                padding: 20px; /* Reduced padding for smaller screens */
            }
            .success-message {
    color: green; 
    text-align: center;
    margin-bottom: 20px;
}
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="layout">
            <div class="sidebar">
                <h2>Admin Panel</h2>
                <ul>
                    <li><a href="upd_admin_dash.aspx">Dashboard</a></li>
                    <li><a href="faculty_grid.aspx" class="active">Faculty</a></li>
                    <li><a href="courses.aspx">Courses & Subjects</a></li>
                    <li><a href="student_grid.aspx">Students</a></li>
                    <li><a href="Results.aspx">Results</a></li>
                    <li><a href="change_admin_pass.aspx">Change Password</a></li>
                    <li><a href="upd_admin_login.aspx">Logout</a></li>
                </ul>
            </div>

            <div class="form-container">
                <h2>Update Profile</h2>
                <div class="form-group">
                    <label for="txtFirstName">First Name</label>
                    <asp:TextBox ID="txtFirstName" runat="server" />
                </div>
                <div class="form-group">
                    <label for="txtLastName">Last Name</label>
                    <asp:TextBox ID="txtLastName" runat="server" />
                </div>
                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" />
                </div>
                <div class="form-group">
                    <label for="txtPhone">Phone</label>
                    <asp:TextBox ID="txtPhone" runat="server" />
                </div>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" OnClick="btnUpdate_Click" />
               <asp:Label ID="lblMessage" runat="server" CssClass="success-message" Visible="false"></asp:Label> <!-- Success message label -->

                </div>
        </div>
    </form>
</body>
</html>

