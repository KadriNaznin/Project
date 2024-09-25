<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_dash.aspx.cs" Inherits="newres.admin_dash" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
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

        .button-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .button-container input {
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            color: white;
            background-color: #007bff;
        }

        .button-container input:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Label ID="lblWelcome" runat="server" CssClass="welcome-message" />

            <div class="button-container">
                <asp:Button ID="btn_Details" runat="server" Text="View Admin Details" OnClick="btn_Details_Click" />
                <asp:Button ID="btn_StudDetails" runat="server" Text="View Students" OnClick="btn_StudDetails_Click" />
                <asp:Button ID="btn_FacultyDetails" runat="server" Text="View Faculty" OnClick="btn_FacultyDetails_Click" />
            </div>

            <h2>Admin Details</h2>
            <asp:GridView ID="gridviewadmin" runat="server" AutoGenerateColumns="False" DataKeyNames="admin_id"
                OnRowEditing="gridviewadmin_RowEditing"
                OnRowUpdating="gridviewadmin_RowUpdating"
                OnRowCancelingEdit="gridviewadmin_RowCancelingEdit"
                OnRowDeleting="gridviewadmin_RowDeleting">
                <Columns>
                    <asp:TemplateField HeaderText="Admin ID">
                        <ItemTemplate>
                            <asp:Label ID="lblAdminID" runat="server" Text='<%# Eval("admin_id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblAdminID" runat="server" Text='<%# Eval("admin_id") %>'></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("first_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Eval("first_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("last_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" runat="server" Text='<%# Eval("last_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("phone") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPhone" runat="server" Text='<%# Eval("phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <h2>Student Details</h2>
            <asp:GridView ID="gridviewstudents" runat="server" AutoGenerateColumns="False" DataKeyNames="reg_no"
                OnRowEditing="gridviewstudents_RowEditing"
                OnRowUpdating="gridviewstudents_RowUpdating"
                OnRowCancelingEdit="gridviewstudents_RowCancelingEdit"
                OnRowDeleting="gridviewstudents_RowDeleting">
                <Columns>
                    <asp:TemplateField HeaderText="Reg No">
                        <ItemTemplate>
                            <asp:Label ID="lblRegNo" runat="server" Text='<%# Eval("reg_no") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRegNo" runat="server" Text='<%# Eval("reg_no") %>' ReadOnly="True"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("first_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Eval("first_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("last_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" runat="server" Text='<%# Eval("last_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("phone") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPhone" runat="server" Text='<%# Eval("phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course">
                        <ItemTemplate>
                            <asp:Label ID="lblCourse" runat="server" Text='<%# Eval("class_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txtCourse" runat="server" Text='<%# Eval("class_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <h2>Faculty Details</h2>
            <asp:GridView ID="gridviewfaculty" runat="server" AutoGenerateColumns="False" DataKeyNames="faculty_id"
                OnRowEditing="gridviewfaculty_RowEditing"
                OnRowUpdating="gridviewfaculty_RowUpdating"
                OnRowCancelingEdit="gridviewfaculty_RowCancelingEdit"
                OnRowDeleting="gridviewfaculty_RowDeleting">
                <Columns>
                    <asp:TemplateField HeaderText="Faculty ID">
                        <ItemTemplate>
                            <asp:Label ID="lblFacultyID" runat="server" Text='<%# Eval("faculty_id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblFacultyID" runat="server" Text='<%# Eval("faculty_id") %>'></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("first_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Eval("first_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("last_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLastName" runat="server" Text='<%# Eval("last_name") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("phone") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPhone" runat="server" Text='<%# Eval("phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("faculty_status") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID="txtStatus" runat="server" Text='<%# Eval("faculty_status") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <asp:Button ID="btnlogout" runat="server" OnClick="btnlogout_Click" Text="LOG OUT" />
        </div>
    </form>
</body>
</html>


          

