<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QueryEmp.aspx.cs" Inherits="QueryEmp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MIS_3 %>" SelectCommand="SELECT 
   ltrim(str( [emp001])) +'_'+ [emp002] as DataView,
   emp001 
   FROM [Employee]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MIS_3 %>" SelectCommand="SELECT [emp001], [emp002], [emp003], [emp004], [emp005], [emp006], [emp008], [emp009] FROM [Employee] WHERE ([emp001] = @emp001)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="emp001" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="DataView" DataValueField="emp001">
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="顥示照片" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="下傳照片" />
            <br />
            <asp:Image ID="Image1" runat="server" BorderColor="#000066" BorderWidth="1px" Height="200px" Width="150px" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="emp001" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" PageSize="1">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="emp001" HeaderText="emp001" InsertVisible="False" ReadOnly="True" SortExpression="emp001" />
                    <asp:BoundField DataField="emp002" HeaderText="emp002" SortExpression="emp002" />
                    <asp:BoundField DataField="emp003" HeaderText="emp003" SortExpression="emp003" />
                    <asp:BoundField DataField="emp004" HeaderText="emp004" SortExpression="emp004" />
                    <asp:BoundField DataField="emp005" HeaderText="emp005" SortExpression="emp005" />
                    <asp:BoundField DataField="emp006" HeaderText="emp006" SortExpression="emp006" />
                    <asp:BoundField DataField="emp008" HeaderText="emp008" SortExpression="emp008" />
                    <asp:BoundField DataField="emp009" HeaderText="emp009" SortExpression="emp009" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
