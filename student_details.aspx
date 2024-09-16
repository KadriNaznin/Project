﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_details.aspx.cs" Inherits="newres.student_details" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        td {
            text-align: center;
        }

        .welcome-message {
            margin-bottom: 20px;
            text-align: center;
            font-size: 18px;
            color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Label ID="lblWelcome" runat="server" CssClass="welcome-message" />

            <h2>Your Details</h2>

            <asp:GridView ID="gridviewstudents" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="reg_no" HeaderText="Registration Number" />
                    <asp:BoundField DataField="first_name" HeaderText="First Name" />
                    <asp:BoundField DataField="last_name" HeaderText="Last Name" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="phone" HeaderText="Phone" />
                    <asp:BoundField DataField="programme_name" HeaderText="Programme Name" />
                    <asp:BoundField DataField="class_name" HeaderText="Class Name" />
                    <asp:BoundField DataField="joining_year" HeaderText="Joining Year" />
                </Columns>
            </asp:GridView>

            <asp:Button ID="btnlogout" runat="server" OnClick="btnlogout_Click" Text="LOG OUT" />
        </div>
    </form>
</body>
</html>
