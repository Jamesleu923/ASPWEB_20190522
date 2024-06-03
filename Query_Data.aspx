<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Query_Data.aspx.cs" Inherits="Query_Data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript">
            function check_data() {
                var result = true;
                var txt_length = [100, 10, 10, 200]; //姓名100 身份證10, 生日10,地址200
                var txtbox_value = [
                    document.getElementById("<%= TextBox1.ClientID %>").value,
                    document.getElementById("<%= TextBox2.ClientID %>").value,
                    document.getElementById("<%= TextBox3.ClientID %>").value,
                    document.getElementById("<%= TextBox4.ClientID %>").value,
                ];
                var prompt = ['姓名', '身份證', '生日', '地址'];
                for (i = 0; i < txtbox_value.length; i++) {
                    if (txtbox_value[i].length == 0) {
                        result = false;
                        alert("字串值不可為空值:" + prompt[i]);
                        break;
                    }

                    if (i == 1 || i == 2) {
                        if (txtbox_value[i].length != 10) {
                            result = false;
                            alert("字串值大小不對:" + prompt[i]);
                            break;
                        }

                    }
                    if (txtbox_value[i].length > txt_length[i]) {
                        result = false;
                        alert("字串長度太長:" + prompt[i]);
                        break;
                    }
                }
                return result;
            }
        </script>

        <div>
            <br />
            員工編號 
            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="QueryIndex" DataValueField="EmpNo" Font-Size="14pt">
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" Font-Size="14pt" OnClick="Button2_Click" Text="調資料" />
            <br />
            <br />
            姓名：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            身份證字號：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            生日：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            性別：<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="emp004" DataValueField="emp004">
            </asp:DropDownList>
            <br />
            <br />
            職稱：<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="emptitle_002" DataValueField="emp006">
            </asp:DropDownList>
            <br />
            <br />
            地址：<asp:TextBox ID="TextBox4" runat="server" Width="790px"></asp:TextBox>
            <br />
            <br />
            上級主管：<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="ManagerName" DataValueField="ManagerNo">
            </asp:DropDownList>
            <br />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />
            <asp:Image ID="Image1" runat="server" Height="228px" Width="198px" />
            <br />
            <br />
            <asp:TextBox ID="TextBox5" runat="server" Height="93px" TextMode="MultiLine" Width="490px"></asp:TextBox>
            <br />
            <br />
            <input id="Text1" type="text" /><br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="存檔" Width="213px"
                        OnClientClick="if (check_data()==false) {return false;};" UseSubmitBehavior="False" CssClass="btn btn-primary btn-lg" />
                </div>
            </div>

            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MIS_3 %>" SelectCommand="SELECT emp001 as EmpNo, rtrim(str([emp001]))+'_'+rtrim([emp002]) as QueryIndex
  FROM [dbo].[Employee]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MIS_3 %>" SelectCommand="select trim(emp004) as emp004 from employee group by emp004"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MIS_3 %>" SelectCommand="select a.emp001 as  員編,
       a.emp002 as 姓名,
	   a.emp009 as ManagerNo,
	   b.emp002 as ManagerName 
  from Employee as a
    left join Employee as b on a.emp009=b.emp001"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MIS_3 %>" SelectCommand="select a.emp006,b.emptitle_002 from employee as a
   left join EmpTitle as b on a.emp006=b.emptitle_001
     group by emp006, emptitle_002"></asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
