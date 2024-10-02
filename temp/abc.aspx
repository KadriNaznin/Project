<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="result2.aspx.cs" Inherits="newres.result2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddlProgram" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged">
</asp:DropDownList>

<asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
</asp:DropDownList>

<asp:DropDownList ID="ddlSemester" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged">
</asp:DropDownList>

            <asp:GridView ID="gvStudentDetails" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="reg_no" HeaderText="Reg No" />
        <asp:BoundField DataField="first_name" HeaderText="First Name" />
        <asp:BoundField DataField="last_name" HeaderText="Last Name" />
        <asp:BoundField DataField="email" HeaderText="Email" />
        <asp:HyperLinkField DataNavigateUrlFields="reg_no" DataNavigateUrlFormatString="ViewResult.aspx?reg_no={0}" Text="View Result" HeaderText="View Result" />
    </Columns>
</asp:GridView>



        </div>
    </form>
</body>
</html>
