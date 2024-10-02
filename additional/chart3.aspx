<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chart3.aspx.cs" Inherits="newres.chart3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Overall Performance of Students</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center; padding: 20px;">
            <h2>Overall Performance of Students</h2>

            <asp:Chart ID="chartPerformance" runat="server" Width="800px" Height="500px">
                <Series>
                    <asp:Series Name="Marks" ChartType="Column" XValueMember="student_name" YValueMembers="OverallMarks">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1">
                    </asp:Legend>
                </Legends>
            </asp:Chart>
        </div>
    </form>
</body>
</html>
