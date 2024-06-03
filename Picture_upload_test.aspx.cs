using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Picture_upload_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        String SQL_Updated;
        String PK_value;
        AlertMessage mymsg = new AlertMessage();
        //要查到資料才能上傳照片,且有選擇資料,才能上傳
        if ((this.GridView1.Rows.Count > 0) && (this.GridView1.SelectedValue != null))
        {
            SQL_Handle JPG_Upload = new SQL_Handle(this.Page, "MIS_3");
            PK_value = this.GridView1.SelectedValue.ToString().Trim();
            SQL_Updated = "update employee set emp007=@emp007 where emp001=" + PK_value;
            //mymsg.showMsg(this.Page, SQL_Updated);
            if (this.FileUpload1.FileName.ToString().Trim().Length > 3)
            {
                JPG_Upload.Insert_Image(SQL_Updated, this.FileUpload1, "emp007");
            }
            else
                mymsg.ShowMsg(this.Page, "沒有指定圖檔!");
        }
        else
        {
            mymsg.ShowMsg(this.Page, "查不到資料或者沒有選擇資料");
        }


    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        String SQL_Query;
        String PK_value;
        AlertMessage mymsg = new AlertMessage();
        //要查到資料才能上傳照片,且有選擇資料,才能上傳
        if ((this.GridView1.Rows.Count > 0) && (this.GridView1.SelectedValue != null))
        {
            SQL_Handle JPG_Download = new SQL_Handle(this.Page, "MIS_3");
            PK_value = this.GridView1.SelectedValue.ToString().Trim();
            SQL_Query = "select emp007 from employee where emp001=" + PK_value;
            JPG_Download.DownloadImageFile(SQL_Query, PK_value + ".jpg",1);
        }
        else
        {
            mymsg.ShowMsg(this.Page, "沒有查到資料或沒有選擇資料");
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        String PK_value = GridView1.SelectedValue.ToString().Trim();
        AlertMessage mymsg = new AlertMessage();
        //要查到資料才能上傳照片,且有選擇資料,才能上傳
        if ((this.GridView1.Rows.Count > 0) && (this.GridView1.SelectedValue != null))
        {
            Image1.ImageUrl = "Download_Sub1.aspx?pid=" + PK_value;

        }
        else
        {
            mymsg.ShowMsg(this.Page, "沒有查到資料或沒有選擇資料");
            this.Image1.ImageUrl = "";
        }

    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        if (this.GridView1.Rows.Count > 0)
        {
            this.GridView1.SelectedIndex = 0;
            String PK_value = GridView1.SelectedValue.ToString().Trim();
            AlertMessage mymsg = new AlertMessage();
            //要查到資料才能上傳照片,且有選擇資料,才能上傳
            if ((this.GridView1.Rows.Count > 0) && (this.GridView1.SelectedValue != null))
            {
                Image1.ImageUrl = "Download_Sub1.aspx?pid=" + PK_value;

            }
            else
            {
                this.Image1.ImageUrl = "";
            }
        }


    }
}