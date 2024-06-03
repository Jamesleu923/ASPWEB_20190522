<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manual_Emp_Append.aspx.cs" Inherits="Manual_Emp_Append" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Panel ID="Panel1" runat="server" BackColor="#FF9933" Height="203px">
                <br />
                姓名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </asp:Panel>
            <br />
            <br />
            身份證字號：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            生日：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            性別：<asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>男</asp:ListItem>
                <asp:ListItem>女</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            職稱：<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="emptitle_002" DataValueField="emptitle_001">
            </asp:DropDownList>
            <br />
            <br />
            地址：<asp:TextBox ID="TextBox4" runat="server" Width="790px"></asp:TextBox>
            <br />
            <br />
            上級主管：<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="emp002" DataValueField="emp001">
            </asp:DropDownList>
            <br />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="確定上傳" />
            <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="顯示照片" />
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="下傳照片" />
            <br />
            <br />
            <asp:Image ID="Image1" runat="server" Height="228px" Width="198px" />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="存檔" Width="213px" />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MIS_3 %>" SelectCommand="SELECT * FROM [EmpTitle]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MIS_3 %>" SelectCommand="SELECT [emp002], [emp001] FROM [Employee]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
