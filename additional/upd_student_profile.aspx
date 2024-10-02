<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upd_student_profile.aspx.cs" Inherits="newres.upd_student_profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Profile</title>
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
        .form-container {
            margin-left: 240px;
            padding: 40px;
            flex-grow: 1;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn {
            width: 100%;
            padding: 12px;
            background-color: #ffcc00;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
        }
        .btn:hover {
            background-color: #e0b800;
        }
        .success-message {
            color: green; 
            text-align: center;
            margin-top: 20px;
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
                    <label for="txtGender">Gender</label>
                    <asp:TextBox ID="txtGender" runat="server" />
                </div>
                <div class="form-group">
                    <label for="txtDOB">DOB</label>
                    <asp:TextBox ID="txtDOB" runat="server" />
                </div>
                <div class="form-group">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" />
                </div>
                <div class="form-group">
                    <label for="txtPhone">Phone</label>
                    <asp:TextBox ID="txtPhone" runat="server" />
                </div>
                <div class="form-group">
                    <label for="txtAddress">Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" />
                </div>
                <div class="form-group">
                    <label for="txtBloodGroup">Blood Group</label>
                    <asp:TextBox ID="txtBloodGroup" runat="server" />
                </div>
                <div class="form-group">
                    <label for="txtBirthPlace">Birth Place</label>
                    <asp:TextBox ID="txtBirthPlace" runat="server" />
                </div>
                <div class="form-group">
                    <label for="txtBirthDistrict">Birth District</label>
                    <asp:TextBox ID="txtBirthDistrict" runat="server" />
                </div>
                <div class="form-group">
                    <label for="txtPincode">Pincode</label>
                    <asp:TextBox ID="txtPincode" runat="server" />
                </div>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" OnClick="btnUpdate_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="success-message" Visible="false"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
