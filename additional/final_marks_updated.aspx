<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="final_marks.aspx.cs" Inherits="A_169.final_marks" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Final Result Entry Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef2f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #form1 {
            max-width: 700px;
            width: 100%;
            background-color: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            margin: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: 600;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
            font-size: 14px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .form-control:focus {
            border-color: #0056b3;
            outline: none;
            box-shadow: 0 0 6px rgba(0, 123, 255, 0.3);
        }

        button {
            background-color: #007BFF;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
            transition: background-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        button:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
        }

        .form-footer {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .required:after {
            content: " *";
            color: red;
        }

        @media (max-width: 600px) {
            #form1 {
                padding: 15px;
                box-shadow: none;
            }

            button {
                width: 100%;
                margin: 10px 0;
            }

            .form-footer {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Final Result Entry Form</h2>

            <label for="reg_no" class="required">Registration Number:</label>
            <asp:TextBox ID="txtreg_no" runat="server" CssClass="form-control" placeholder="Enter Registration Number" required="required"></asp:TextBox>
                        <label for="Programme_id" class="required">Programme ID:</label>
            <asp:TextBox ID="txtprogramme_id" runat="server" CssClass="form-control" required="required">
            </asp:TextBox>
                                    <label for="Semester" class="required">Semester:</label>

            <asp:TextBox ID="txtsem" runat="server" CssClass="form-control" required="required" AutoPostBack="True" OnTextChanged="txtsem_TextChanged"></asp:TextBox>
            <label for="subject_code" class="required">Subject Code:</label>
            <asp:DropDownList ID="ddlsubject_code" runat="server" CssClass="form-control" required="required" AutoPostBack="True" OnSelectedIndexChanged="ddlsubject_code_SelectedIndexChanged">
                <asp:ListItem Text="Select Subject Code" Value="" />
            </asp:DropDownList>



            <label for="obtained_marks" class="required">Obtained Marks:</label>
            <asp:TextBox ID="txtobtained_marks" runat="server" CssClass="form-control" placeholder="Enter Obtained Marks" required="required" TextMode="Number" AutoPostBack="True" OnTextChanged="txtobtained_marks_TextChanged"></asp:TextBox>

            <label for="ia_marks" class="required">IA Marks:</label>
            <asp:TextBox ID="txtia_marks" runat="server" CssClass="form-control" placeholder="Enter Internal Assessment Marks" required="required" TextMode="Number"></asp:TextBox>

            <label for="total_marks" class="required">Total Marks:</label>
            <asp:TextBox ID="txttotal_marks" runat="server" CssClass="form-control" placeholder="Enter Total Marks" required="required" TextMode="Number" AutoPostBack="True" OnTextChanged="txttotal_marks_TextChanged"></asp:TextBox>

            <label for="grade" class="required">Grade:</label>
            <asp:TextBox ID="txtgrade" runat="server" CssClass="form-control" placeholder="Enter Grade" required="required"></asp:TextBox>

            <label for="credit" class="required">Credit:</label>
            <asp:TextBox ID="txtcredit" runat="server" CssClass="form-control" placeholder="Enter Credit Value" required="required" TextMode="Number"></asp:TextBox>

            <label for="grade_point" class="required">Grade Point:</label>
            <asp:TextBox ID="txtgrade_point" runat="server" CssClass="form-control" placeholder="Enter Grade Point" required="required" TextMode="Number"></asp:TextBox>

            <label for="grade_point_weightage" class="required">Grade Point Weightage:</label>
            <asp:TextBox ID="txtgrade_point_weightage" runat="server" CssClass="form-control" placeholder="Enter Grade Point Weightage" required="required" TextMode="Number"></asp:TextBox>
            <label for="result" class="required">Result:</label>
            <asp:TextBox ID="txtreult" runat="server" CssClass="form-control" placeholder="Enter result" required="required" TextMode="Number"></asp:TextBox>


            <div class="form-footer">
                <asp:Button ID="SubmitForm" runat="server" Text="Submit" CssClass="button" OnClick="SubmitForm_Click"  />
                <asp:Button ID="ResetForm" runat="server" Text="Reset Form" CssClass="button"  />
            </div>
             <div class="form-group">
<asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
</div>
        </div>
    </form>
</body>
</html>
