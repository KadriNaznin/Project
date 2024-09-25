<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="faculty_reg.aspx.cs" Inherits="newres.faculty_reg" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faculty Registration</title>
    <style type="text/css">
        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f7fc;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            width: 100%;
            overflow-x: hidden;
        }

        .container {
            width: 100%;
            max-width: 500px;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 20px;
            box-sizing: border-box;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
            font-weight: 700;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #555;
            font-size: 14px;
        }

        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group input[type="date"],
        .form-group input[type="number"],
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        .form-group input[type="text"]:focus,
        .form-group input[type="password"]:focus,
        .form-group input[type="date"]:focus,
        .form-group input[type="number"]:focus,
        .form-group select:focus {
            border-color: #0056b3;
            outline: none;
        }

        .form-group .text-danger {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
        }

        .form-group button {
            background-color: #007bff;
            border: none;
            color: #ffffff;
            padding: 12px;
            text-align: center;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }

        .form-group center {
            margin-top: 20px;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 10px;
            }

            h2 {
                font-size: 20px;
            }

            .form-group label {
                font-size: 12px;
            }

            .form-group input[type="text"],
            .form-group input[type="password"],
            .form-group input[type="date"],
            .form-group input[type="number"],
            .form-group select {
                font-size: 12px;
            }

            .form-group button {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2><strong>Faculty Registration</strong></h2>

            <div class="form-group">
                <label for="txtfirstname">First Name</label>
                <asp:TextBox ID="txtfirstname" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvfirstname" runat="server" ControlToValidate="txtfirstname" 
                                             ErrorMessage="First name is required." CssClass="text-danger" 
                                             Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="txtlastname">Last Name</label>
                <asp:TextBox ID="txtlastname" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvlastname" runat="server" ControlToValidate="txtlastname" 
                                             ErrorMessage="Last name is required." CssClass="text-danger" 
                                             Display="Dynamic"></asp:RequiredFieldValidator>
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
                                             InitialValue="" ErrorMessage="Gender is required." CssClass="text-danger" 
                                             Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="txtdob">Date of Birth</label>
                <asp:TextBox ID="txtdob" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvdob" runat="server" ControlToValidate="txtdob" 
                                             ErrorMessage="Date of Birth is required." CssClass="text-danger" 
                                             Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="txtemail">Email</label>
                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revemail" runat="server" ControlToValidate="txtemail"
                                                ErrorMessage="Please enter a valid email address."
                                                ValidationExpression="^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$"
                                                CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label for="txtphone">Phone</label>
                <asp:TextBox ID="txtphone" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvphone" runat="server" ControlToValidate="txtphone" 
                                             ErrorMessage="Phone number is required." CssClass="text-danger" 
                                             Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="txtaddress">Address</label>
                <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvaddress" runat="server" ControlToValidate="txtaddress" 
                                             ErrorMessage="Address is required." CssClass="text-danger" 
                                             Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="txtbloodgroup">Blood Group</label>
                <asp:TextBox ID="txtbloodgroup" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvbloodgroup" runat="server" ControlToValidate="txtbloodgroup" 
                                             ErrorMessage="Blood group is required." CssClass="text-danger" 
                                             Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="txtpass">Password</label>
                <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvpassword" runat="server" ControlToValidate="txtpass" 
                                             ErrorMessage="Password is required." CssClass="text-danger" 
                                             Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="txtconfirmpassword">Confirm Password</label>
                <asp:TextBox ID="txtconfirmpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="cvpassword" runat="server" ControlToValidate="txtconfirmpassword"
                                      ControlToCompare="txtpass" ErrorMessage="Passwords do not match."
                                      CssClass="text-danger" Display="Dynamic"></asp:CompareValidator>
            </div>

            <div class="form-group">
                <label for="ddlfaultystatus">Status</label>
                <asp:DropDownList ID="ddlfacultystatus" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Status" Value="" />
                    <asp:ListItem Text="Active" Value="Active" />
                    <asp:ListItem Text="Inactive" Value="Inactive" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvfacultystatus" runat="server" ControlToValidate="ddlfacultystatus" 
                                             InitialValue="" ErrorMessage="Staff status is required." CssClass="text-danger" 
                                             Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <center>
                <asp:Button ID="btn_reg" runat="server" CssClass="btn" Text="Register" OnClick="btn_reg_Click" />
                <br />
                <br />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </center>
            </div>
        </div>
    </form>
</body>
</html>

