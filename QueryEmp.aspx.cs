using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QueryEmp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //顥示照片 code....
        SQL_Handle JPG_Upload = new SQL_Handle(this.Page, "MIS_3");
        String PK_value = this.DropDownList1.SelectedValue.ToString();
        Image1.ImageUrl = "Download_Sub1.aspx?pid=" + PK_value;

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //下傳照片  code...
        String SQL_Query;
        SQL_Handle JPG_Download = new SQL_Handle(this.Page, "MIS_3");
        String PK_value = this.GridView1.SelectedValue.ToString();
        AlertMessage sysmsg = new AlertMessage();
        //要查到資料才能上傳照片,且有選擇資料,才能上傳
        if (PK_value != null && PK_value != "")
        {
            SQL_Query = "select emp007 from employee where emp001=" + PK_value;
            JPG_Download.DownloadImageFile(SQL_Query,PK_value.ToString()+".jpg" ,1);
            this.Image1.Visible = true;
            Image1.ImageUrl = "Download_Sub1.aspx?pid=" + PK_value;

        }
        else
        {
            sysmsg.ShowMsg(this.Page, "沒有查到資料或沒有選擇資料");
            this.Image1.ImageUrl = "";
            this.Image1.Visible = false;
        }

    }
}