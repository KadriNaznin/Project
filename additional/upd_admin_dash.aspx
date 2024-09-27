<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upd_admin_dash.aspx.cs" Inherits="newres.upd_admin_dash" %>


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

        /* Updated personal-details section */
        .personal-details {
            margin-left: 240px;
            padding: 40px;
            flex-grow: 1;
            background: linear-gradient(120deg, #f6f6f6 30%, #fff 70%);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .personal-card {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            padding: 30px;
            max-width: 500px;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: transform 0.3s ease-in-out;
        }

        .personal-card:hover {
            transform: scale(1.02);
        }

        .personal-card img {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            object-fit: cover;
            margin-bottom: 15px;
            border: 3px solid #ffcc00;
        }

        .personal-card h2 {
            font-size: 1.8rem;
            margin-bottom: 20px;
            color: #333;
            font-weight: 600;
        }

        .personal-card p.role {
            background-color: #1a1f36;
            color: #ffcc00;
            display: inline-block;
            padding: 5px;
            border-radius: 20px;
            font-size: 0.9rem;
            text-align: center;
            margin-bottom: 20px;
        }

        .info-item {
            font-size: 1rem;
            margin: 10px 0;
            text-align: left;
            width: 100%;
            padding: 5px;
            background-color: #f7f8fa;
            border-radius: 8px;
        }

        .info-item strong {
            color: #1a1f36;
            font-weight: bold;
        }

        .info-item .data {
            color: #7a7f87;
            display: inline-block;
        }

        .update-profile {
    margin-top: 20px;
    text-align: center;
}

.update-profile a {
    background-color: #ffcc00;
    color: #1a1f36;
    padding: 10px 20px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.update-profile a:hover {
    background-color: #e0b800;
}


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="layout">
            <div class="sidebar">
                <h2>Admin Panel</h2>
                <ul>
                    <li><a href="#" class="active">Dashboard</a></li>
                    <li><a href="faculty_grid.aspx">Faculty</a></li>

                    <li><a href="courses.aspx">Courses & Subjects</a></li>
                    <li><a href="student_grid.aspx">Students</a></li>
                    <li><a href="Results.aspx">Results</a></li>
                    <li><a href="change_admin_pass.aspx">Change Password</a></li>
                    <li><a href="upd_admin_login.aspx">Logout</a></li>

                </ul>
            </div>

            <div class="personal-details">
                <div class="personal-card">
                    <h2>Profile</h2>
                    <img src="https://photos.peopleimages.com/picture/202309/2925757-portrait-of-professional-muslim-woman-office-backdrop.-wearing-hijab.-religion-concept-fit_400_400.jpg" alt="Profile Picture" />
                    
                    <p class="role">Role : Administrator</p>
    <div class="info-item">
        <strong>Id:</strong>
        <span class="data"><%= Session["AdminId"] %> </span>
        </div>

    <div class="info-item">
        <strong>Name:</strong>
    <span class="data"><%= Session["FirstName"] %> <%= Session["LastName"] %></span>
        </div>
    
        <div class="info-item">
            <strong>Email:</strong>
            <span class="data"><%= Session["UserEmail"] %></span>
                </div>

    <div class="info-item">
        <strong>Phone:</strong> 
        <span class="data"><%= Session["PhoneNumber"] %></span>
            </div> 

                    <div class="update-profile">
        <a href="upd_admin_profile.aspx" style="color: black; text-decoration: none; font-weight: bold;">Update Profile</a>
    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>





