

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="result.aspx.cs" Inherits="newres.result" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Result</title>
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
            margin-left: 240px; /* Adjusted for sidebar */
            padding: 40px;
            flex-grow: 1;
            background: linear-gradient(120deg, #f6f6f6 30%, #fff 70%);
        }

        .content h1 {
            font-size: 2rem;
            color: #333;
        }

        .dropdown-section, .courses-section {
            margin-top: 20px;
        }

        .dropdown-section select {
            padding: 10px;
            font-size: 1rem;
            width: 100%;
            max-width: 300px;
        }

        .courses-section table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .courses-section table th, .courses-section table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        .courses-section table th {
            background-color: #ffcc00;
            color: #1a1f36;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="layout">
            <div class="sidebar">
                <h2>Admin Panel</h2>
                <ul>
                    <li><a href="newprc.aspx" class="active">Dashboard</a></li>
                    <li><a href="faculty_grid.aspx">Faculty</a></li>
                    <li><a href="courses.aspx">Courses & Subjects</a></li>
                    <li><a href="student_grid.aspx">Students</a></li>
                    <li><a href="result.aspx">Results</a></li>
                    <li><a href="change_admin_pass.aspx">Change Password</a></li>
                    <li><a href="upd_admin_login.aspx">Logout</a></li>
                </ul>
            </div>

            <div class="content">
                <h1>Result</h1>

                <div class="dropdown-section">
                    <label for="ddlPrograms">Select Program:</label>
                    <asp:DropDownList ID="ddlPrograms" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPrograms_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <div class="dropdown-section">
                    <label for="ddlClasses">Select Class:</label>
                    <asp:DropDownList ID="ddlClasses" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlClasses_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <div class="dropdown-section">
                    <label for="ddlSemesters">Select Semester:</label>
                    <asp:DropDownList ID="ddlSemesters" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSemesters_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <div class="courses-section">
                    <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="false"  OnRowCommand="gvStudents_RowCommand">
                        <Columns>
                      <asp:BoundField DataField="reg_no" HeaderText="RegNo" />

                            <asp:BoundField DataField="first_name" HeaderText="First Name" />
                            <asp:BoundField DataField="last_name" HeaderText="Last Name" />
                            <asp:BoundField DataField="gender" HeaderText="Gender" />
                            <asp:BoundField DataField="joining_year" HeaderText="Joining Year" />
                            <asp:BoundField DataField="programme_id" HeaderText="Programme ID" />
                            <asp:BoundField DataField="class_id" HeaderText="Class ID" />

                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkViewResult" runat="server" Text="View Result" CommandName="ViewResult" CommandArgument='<%# Eval("reg_no") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
