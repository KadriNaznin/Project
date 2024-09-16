<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="first_internal.aspx.cs" Inherits="newres.first_internal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Internal Marks Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .form-container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group input[type="number"] {
            -moz-appearance: textfield;
        }

        .form-group input[type="number"]::-webkit-inner-spin-button,
        .form-group input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .form-group .error-message {
            color: #d9534f;
            font-size: 0.875em;
        }

        .form-group .info-message {
            color: #5bc0de;
            font-size: 0.875em;
        }

        .form-group button {
            background-color: #0275d8;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .form-group button:hover {
            background-color: #025aa5;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <div class="form-group">
                <asp:Label ID="lblRegNo" runat="server" Text="Registration Number:" AssociatedControlID="txtRegNo"></asp:Label>
                <asp:TextBox ID="txtRegNo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvRegNo" runat="server" ControlToValidate="txtRegNo" CssClass="error-message" ErrorMessage="Registration Number is required." />
            </div>

            <div class="form-group">
                <asp:Label ID="lblSubjectCode" runat="server" Text="Subject Code:" AssociatedControlID="ddlSubjectCode"></asp:Label>
                <asp:DropDownList ID="ddlSubjectCode" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvSubjectCode" runat="server" ControlToValidate="ddlSubjectCode" CssClass="error-message" InitialValue="" ErrorMessage="Subject Code is required." />
            </div>

            <div class="form-group">
                <asp:Label ID="lblProgrammeID" runat="server" Text="Programme ID:" AssociatedControlID="ddlProgrammeID"></asp:Label>
                <asp:DropDownList ID="ddlProgrammeID" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvProgrammeID" runat="server" ControlToValidate="ddlProgrammeID" CssClass="error-message" InitialValue="" ErrorMessage="Programme ID is required." />
            </div>

            <div class="form-group">
                <asp:Label ID="lblClassID" runat="server" Text="Class ID:" AssociatedControlID="ddlClassID"></asp:Label>
                <asp:DropDownList ID="ddlClassID" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvClassID" runat="server" ControlToValidate="ddlClassID" CssClass="error-message" InitialValue="" ErrorMessage="Class ID is required." />
            </div>

<%--            <div class="form-group">
                <asp:Label ID="lblMaxMarks" runat="server" Text="Maximum Marks:" AssociatedControlID="txtMaxMarks"></asp:Label>
                <asp:TextBox ID="txtMaxMarks" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMaxMarks" runat="server" ControlToValidate="txtMaxMarks" CssClass="error-message" ErrorMessage="Maximum Marks is required." />
                <asp:RangeValidator ID="rvMaxMarks" runat="server" ControlToValidate="txtMaxMarks" MinimumValue="0" Type="Integer" CssClass="error-message" ErrorMessage="Please enter a valid number." />
            </div>--%>

            
            <div class="form-group">
                <asp:Label ID="lblMaxMarks" runat="server" Text="Maximum Marks:" AssociatedControlID="txtMaxMarks"></asp:Label>
                <asp:TextBox ID="txtMaxMarks" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMaxMarks" runat="server" ControlToValidate="txtMaxMarks" CssClass="error-message" ErrorMessage="Maximum Marks is required." />
                
            </div>

            <div class="form-group">
                <asp:Label ID="lblMinMarks" runat="server" Text="Minimum Marks:" AssociatedControlID="txtMinMarks"></asp:Label>
                <asp:TextBox ID="txtMinMarks" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMinMarks" runat="server" ControlToValidate="txtMinMarks" CssClass="error-message" ErrorMessage="Minimum Marks is required." />
  
            </div>

            <div class="form-group">
                <asp:Label ID="lblObtainedMarks" runat="server" Text="Obtained Marks:" AssociatedControlID="txtObtainedMarks"></asp:Label>
                <asp:TextBox ID="txtObtainedMarks" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvObtainedMarks" runat="server" ControlToValidate="txtObtainedMarks" CssClass="error-message" ErrorMessage="Obtained Marks is required." />
                
            </div>

            <div class="form-group">
                <asp:Label ID="lblGrade" runat="server" Text="Grade:" AssociatedControlID="txtGrade"></asp:Label>
                <asp:TextBox ID="txtGrade" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblResult" runat="server" Text="Result:" AssociatedControlID="txtResult"></asp:Label>
                <asp:TextBox ID="txtResult" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
            </div>
        </div>
    </form>
</body>
</html>
