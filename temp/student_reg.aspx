<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_reg.aspx.cs" Inherits="newres.student_reg" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            max-width: 600px;
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

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group .text-danger {
            color: red;
            font-size: 12px;
        }

        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <h2>Student Registration</h2>

            <div class="form-group">
                <label for="txtregno">Registration Number</label>
                <asp:TextBox ID="txtregno" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvregno" runat="server" ControlToValidate="txtregno"
                                             ErrorMessage="Registration number is required." CssClass="text-danger" Display="Dynamic"/>
                <asp:RegularExpressionValidator ID="revregno" runat="server" ControlToValidate="txtregno"
                                                 ErrorMessage="Invalid registration number format." ValidationExpression="^\d+$" CssClass="text-danger"/>
            </div>

            <div class="form-group">
                <label for="txtfirstname">First Name</label>
                <asp:TextBox ID="txtfirstname" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvfirstname" runat="server" ControlToValidate="txtfirstname"
                                             ErrorMessage="First name is required." CssClass="text-danger"/>
            </div>

            <div class="form-group">
                <label for="txtlastname">Last Name</label>
                <asp:TextBox ID="txtlastname" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvlastname" runat="server" ControlToValidate="txtlastname"
                                             ErrorMessage="Last name is required." CssClass="text-danger"/>
            </div>

            <div class="form-group">
            <label for="ddlprogrammeid">Programme</label>
            <asp:DropDownList ID="ddlprogrammeid" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlprogrammeid_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvprogrammeid" runat="server" ControlToValidate="ddlprogrammeid"
                                         InitialValue="" ErrorMessage="Programme is required." CssClass="text-danger"/>
            </div>

            <div class="form-group">
            <label for="ddlclassid">Class</label>
            <asp:DropDownList ID="ddlclassid" runat="server" CssClass="form-control">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvclassid" runat="server" ControlToValidate="ddlclassid"
                                 InitialValue="" ErrorMessage="Class is required." CssClass="text-danger"/>
            </div>

            <div class="form-group">
            <label for="txtemail">Email</label>
            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtemail"
                                 ErrorMessage="Email is required." CssClass="text-danger"/>
            <asp:RegularExpressionValidator ID="revemail" runat="server" ControlToValidate="txtemail"
                                     ErrorMessage="Invalid email format." ValidationExpression="^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$" CssClass="text-danger"/>
            </div>

            <div class="form-group">
            <label for="txtpassword">Password</label>
            <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ControlToValidate="txtpassword"
                                    ErrorMessage="Password is required." CssClass="text-danger"/>
            </div>

            <div class="form-group">
            <label for="txtphone">Phone</label>
            <asp:TextBox ID="txtphone" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvphone" runat="server" ControlToValidate="txtphone"
                                 ErrorMessage="Phone number is required." CssClass="text-danger"/>
            <asp:RegularExpressionValidator ID="revphone" runat="server" ControlToValidate="txtphone"
                                     ErrorMessage="Invalid phone number format." ValidationExpression="^\d{10,20}$" CssClass="text-danger"/>
            </div>

            <div class="form-group">
                <label for="ddlgender">Gender</label>
                <asp:DropDownList ID="ddlgender" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Gender" Value="" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                    <asp:ListItem Text="Other" Value="Other" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvgender" runat="server" ControlToValidate="ddlgender"
                                             InitialValue="" ErrorMessage="Gender is required." CssClass="text-danger"/>
            </div>

            <div class="form-group">
                <label for="txtdob">Date of Birth</label>
                <asp:TextBox ID="txtdob" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvdob" runat="server" ControlToValidate="txtdob"
                                             ErrorMessage="Date of Birth is required." CssClass="text-danger"/>
            </div>

            <div class="form-group">
            <label for="txtbloodgroup">Blood Group</label>
            <asp:TextBox ID="txtbloodgroup" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvbloodgroup" runat="server" ControlToValidate="txtbloodgroup"
                                 ErrorMessage="Blood group is required." CssClass="text-danger"/>
            </div>

            <div class="form-group">
                <label for="txtaddress">Address</label>
                <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvaddress" runat="server" ControlToValidate="txtaddress"
                                             ErrorMessage="Address is required." CssClass="text-danger"/>
            </div>

            <div class="form-group">
                <label for="txtbirthplace">Birth Place</label>
                <asp:TextBox ID="txtbirthplace" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvbirthplace" runat="server" ControlToValidate="txtbirthplace"
                                             ErrorMessage="Birth place is required." CssClass="text-danger"/>
            </div>

            <div class="form-group">
                <label for="txtbirthdistrict">Birth District</label>
                <asp:TextBox ID="txtbirthdistrict" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvbirthdistrict" runat="server" ControlToValidate="txtbirthdistrict"
                                             ErrorMessage="Birth district is required." CssClass="text-danger"/>
            </div>

            <div class="form-group">
                <label for="txtpincode">Pincode</label>
                <asp:TextBox ID="txtpincode" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvpincode" runat="server" ControlToValidate="txtpincode"
                                             ErrorMessage="Pincode is required." CssClass="text-danger"/>
                <asp:RegularExpressionValidator ID="revpincode" runat="server" ControlToValidate="txtpincode"
                                                 ErrorMessage="Invalid pincode format." ValidationExpression="^\d{6}$" CssClass="text-danger"/>
            </div>

            <div class="form-group">
                <label for="txtjoiningyear">Joining Year</label>
                <asp:TextBox ID="txtjoiningyear" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvjoiningyear" runat="server" ControlToValidate="txtjoiningyear"
                                             ErrorMessage="Joining year is required." CssClass="text-danger"/>
                <asp:RegularExpressionValidator ID="revjoiningyear" runat="server" ControlToValidate="txtjoiningyear"
                                                 ErrorMessage="Invalid year format." ValidationExpression="^\d{4}$" CssClass="text-danger"/>
            </div>

            <div class="form-group">
                <label for="txtsemester">Semester</label>
                <asp:TextBox ID="txtsemester" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvsemester" runat="server" ControlToValidate="txtsemester"
                                             ErrorMessage="Semester is required." CssClass="text-danger"/>
                <asp:RegularExpressionValidator ID="revsemester" runat="server" ControlToValidate="txtsemester"
                                                 ErrorMessage="Invalid semester format." ValidationExpression="^\d{1,3}$" CssClass="text-danger"/>
            </div>

            <div class="form-group">
                <asp:Button ID="btnRegister" runat="server" CssClass="btn" Text="Register" OnClick="btnRegister_Click"/>
            </div>

            <div class="form-group">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>