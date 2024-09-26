<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upd_admin_dash.aspx.cs" Inherits="newres.update_admin_dash" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #eef2f7;
            color: #333;
            height: 100%;
            font-size: 14px;
        }

        .layout {
            display: flex;
            min-height: 100vh;
        }

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

        .personal-details {
            margin-left: 240px;
            padding: 20px;
            flex-grow: 1;
            background-color: #f9fafe;
            display: flex;
            justify-content: center;
        }

        .personal-card {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 450px;
            width: 100%;
            text-align: center;
            border: 1px solid #e6e9ec;
        }

        .personal-card img {
            border-radius: 50%;
            width: 140px;
            height: 140px;
            object-fit: cover;
            margin-bottom: 15px;
        }

        .personal-card h2 {
            font-size: 1.4rem;
            margin-bottom: 10px;
            color: #333;
        }

        .personal-card p {
            font-size: 0.95rem;
            margin-bottom: 8px;
            color: #7a7f87;
        }

        .personal-card .info-item {
            font-size: 0.95rem;
            margin: 5px 0;
            text-align: left;
        }

        .info-item strong {
            color: #1a1f36;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="layout">
            <div class="sidebar">
                <h2>Admin Panel</h2>
                <ul>
                    <li><a href="Dashboard.aspx" class="active">Dashboard</a></li>
                    <li><a href="Courses.aspx">Courses</a></li>
                    <li><a href="Subjects.aspx">Subjects</a></li>
                    <li><a href="Students.aspx">Students</a></li>
                    <li><a href="Results.aspx">Results</a></li>
                    <li><a href="ChangePassword.aspx">Change Password</a></li>
                    <li><a href="Logout.aspx">Logout</a></li>

                </ul>
            </div>

            <div class="personal-details">
                <div class="personal-card">
                    <h2>Profile</h2>
                    <img src="https://photos.peopleimages.com/picture/202309/2925757-portrait-of-professional-muslim-woman-office-backdrop.-wearing-hijab.-religion-concept-fit_400_400.jpg" alt="Profile Picture" />
                    
                     <p>Role: Administrator</p>
    <div class="info-item"><strong>Id:</strong> <%= Session["AdminId"] %></div> <!-- Displaying Admin ID -->
    <div class="info-item"><strong>Name:</strong> <%= Session["FirstName"] %> <%= Session["LastName"] %></div>
    <div class="info-item"><strong>Email:</strong> <%= Session["UserEmail"] %></div>
    <div class="info-item"><strong>Phone:</strong> <%= Session["PhoneNumber"] %></div> <!-- Displaying Phone Number -->
                </div>
            </div>
        </div>
    </form>
</body>
</html>

