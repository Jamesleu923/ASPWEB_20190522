<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Picture_upload_test.aspx.cs" Inherits="Picture_upload_test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="請輸入員工編號"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查詢"  />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="emp001" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None" ondatabound="GridView1_DataBound" 
            >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="emp001" HeaderText="emp001" InsertVisible="False" 
                    ReadOnly="True" SortExpression="emp001" />
                <asp:BoundField DataField="emp002" HeaderText="emp002" 
                    SortExpression="emp002" />
                <asp:BoundField DataField="emp003" HeaderText="emp003" 
                    SortExpression="emp003" />
                <asp:BoundField DataField="emp004" HeaderText="emp004" 
                    SortExpression="emp004" />
                <asp:BoundField DataField="emp006" HeaderText="emp006" 
                    SortExpression="emp006" />
                <asp:BoundField DataField="emp005" HeaderText="emp005" 
                    SortExpression="emp005" />
                <asp:BoundField DataField="emp008" HeaderText="emp008" 
                    SortExpression="emp008" />
                <asp:BoundField DataField="emp009" HeaderText="emp009" 
                    SortExpression="emp009" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#003399" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
    
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MIS_3 %>" 
        SelectCommand="SELECT [emp001], [emp002], [emp003], [emp004], [emp006], [emp005], [emp008], [emp009] FROM [Employee] WHERE ([emp001] = @emp001)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="emp001" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label2" runat="server" Text="上傳員工照片"></asp:Label>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="確定上傳" />
    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="下傳照片" />
    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="顯示照片" />
    <br />
    <asp:Image ID="Image1" runat="server" Height="320px" Width="180px" 
        EnableViewState="False" />
    </form>
</body>
</html>
