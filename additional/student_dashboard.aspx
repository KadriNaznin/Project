<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_dashboard.aspx.cs" Inherits="newres.student_dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>

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
                <h2>Student Panel</h2>
                <ul>
                    <li><a href="#" class="active">Dashboard</a></li>
                    <li><a href="Results.aspx">Results</a></li>
                    <li><a href="change_user_pass.aspx">Change Password</a></li>
                    <li><a href="student_login.aspx">Logout</a></li>
                </ul>
            </div>

            <div class="personal-details">
                <div class="personal-card">
                    <h2>Student Profile</h2>
                    <img src="https://www.shutterstock.com/image-photo/portrait-young-confident-attractive-indian-260nw-1443534119.jpg" alt="Profile Picture" />
                    
                    <div class="info-item">
                        <strong>Reg No:</strong>
                        <span class="data"><%= Session["RegNo"] %></span>
                    </div>

                    <div class="info-item">
                        <strong>Name:</strong>
                        <span class="data"><%= Session["FirstName"] %> <%= Session["LastName"] %></span>
                    </div>

                    <div class="info-item">
                        <strong>Gender:</strong>
                        <span class="data"><%= Session["Gender"] %></span>
                    </div>

                    <div class="info-item">
                        <strong>DOB:</strong>
                        <span class="data"><%= Session["DOB"] %></span>
                    </div>

                    <div class="info-item">
                        <strong>Email:</strong>
                        <span class="data"><%= Session["Email"] %></span>
                    </div>

                    <div class="info-item">
                        <strong>Phone:</strong> 
                        <span class="data"><%= Session["Phone"] %></span>
                    </div>

                    <div class="info-item">
                        <strong>Address:</strong> 
                        <span class="data"><%= Session["Address"] %></span>
                    </div>

                    <div class="info-item">
                        <strong>Blood Group:</strong> 
                        <span class="data"><%= Session["BloodGroup"] %></span>
                    </div>

                    <div class="info-item">
                        <strong>Birth Place:</strong> 
                        <span class="data"><%= Session["BirthPlace"] %></span>
                    </div>

                    <div class="info-item">
                        <strong>Birth District:</strong> 
                        <span class="data"><%= Session["BirthDistrict"] %></span>
                    </div>

                    <div class="info-item">
                        <strong>Pincode:</strong> 
                        <span class="data"><%= Session["Pincode"] %></span>
                    </div>

                    <div class="update-profile">
                        <a href="upd_student_profile.aspx" style="color: black; text-decoration: none; font-weight: bold;">Update Profile</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
