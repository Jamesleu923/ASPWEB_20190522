using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class QueryData2_DataSet : System.Web.UI.Page
{

    DataSet MemoryData = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlcmd1 = @"select emp001,emp002,emp003,emp004,emp006 from employee ";
        Get_DataSet LoadMyData1 = new Get_DataSet(sqlcmd1, "Employee");
        this.MemoryData=LoadMyData1.SelectDB();
        this.GridView1.DataSource =this.MemoryData;
        this.GridView1.DataBind();
        ShowData();
    }

    public void ShowData()
    {
    
        DataTable Employee = MemoryData.Tables["Employee"];


        for (int i = 0; i < Employee.Rows.Count; i++)
        {
            Literal DivS = new Literal();
            Literal DivE = new Literal();
            DivS.Text = "<DIV class>";
            DivE.Text = "</DIV>";
            Literal emp001 = new Literal();
            //TextBox emp001 = new TextBox();
            emp001.Text = Employee.Rows[i]["emp001"].ToString();
            this.Page.Form.Controls.Add(DivS);
            this.Page.Form.Controls.Add(emp001);
            this.Page.Form.Controls.Add(DivE);
            /*
            Response.Write(Employee.Rows[i]["emp001"].ToString());
            Response.Write(Employee.Rows[i]["emp002"].ToString());
            Response.Write(Employee.Rows[i]["emp003"].ToString());
            Response.Write(Employee.Rows[i]["emp004"].ToString());
            Response.Write(Employee.Rows[i]["emp006"].ToString());
            */
        }
    }
}