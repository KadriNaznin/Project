<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chart.aspx.cs" Inherits="newres.chart" %>
<%@ Register Assembly="System.Web.DataVisualization" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Performance Analysis</title>
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

        .content {
            margin-left: 240px;
            padding: 40px;
            flex-grow: 1;
            background-color: #f6f6f6;
            display: flex;
            justify-content: center;
            align-items: center;
            width: calc(100% - 240px);
        }

        .chart-container {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            padding: 30px;
            width: 100%;
            max-width: 700px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .chart-container h2 {
            font-size: 1.5rem;
            margin-bottom: 20px;
            color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="layout">
            <div class="sidebar">
                <h2>Admin Panel</h2>
                <ul>
                    <li><a href="newprc.aspx">Dashboard</a></li>
                    <li><a href="faculty_grid.aspx">Faculty</a></li>
                    <li><a href="courses.aspx">Courses & Subjects</a></li>
                    <li><a href="student_grid.aspx">Students</a></li>
                    <li><a href="result.aspx">Results</a></li>
                    <li><a href="change_admin_pass.aspx">Change Password</a></li>
                    <li><a href="upd_admin_login.aspx">Logout</a></li>
                </ul>
            </div>

            <div class="content">
                <div class="chart-container">
                    <h2>Performance Analysis</h2>
                    <asp:Chart ID="chartPerformance" runat="server" Width="600px" Height="400px">
                        <Series>
                            <asp:Series Name="Marks" ChartType="Column" XValueMember="ExamType" YValueMembers="MarksObtained">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
