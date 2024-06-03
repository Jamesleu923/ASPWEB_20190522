using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class Query_Data : System.Web.UI.Page
{
    private string PK_Key;
    DataView dv = new DataView();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)  //存檔
    {
        this.SaveData();
    }

    private bool SaveData()
    {
        String OLD_PK = this.DropDownList4.SelectedValue.ToString().Trim();
        SysDb db = new SysDb();
        db.UpdateCommand = @"UPDATE [dbo].[Employee] SET [emp002] =@emp002,[emp003] =@emp003, "
              + "[emp004] =@emp004,[emp005] =@emp005,[emp006] =@emp006,[emp008] =@emp008,[emp009] =@emp009 "
              + " WHERE [emp001]=@emp001";
        db.UpdateParameters.Add("emp001", OLD_PK);
        db.UpdateParameters.Add("emp002", this.TextBox1.Text.ToString().Trim());
        db.UpdateParameters.Add("emp003", this.TextBox2.Text.ToString().Trim());
        db.UpdateParameters.Add("emp004", this.DropDownList1.SelectedValue.ToString().Trim());
        db.UpdateParameters.Add("emp005", this.TextBox3.Text.ToString().Trim());
        db.UpdateParameters.Add("emp006", this.DropDownList2.SelectedValue.ToString().Trim());
        db.UpdateParameters.Add("emp008", this.TextBox4.Text.ToString().Trim());
        db.UpdateParameters.Add("emp009", this.DropDownList3.SelectedValue.ToString().Trim());
        try
        {
            if (db.Update() > 0){
                this.DropDownList4.DataBind();
                return true;}
            else{
                new AlertMessage().ShowMsg(this.Page, db.UpdateCommand.ToString());
                return false;}             
        }
        catch (Exception)
        {
            new AlertMessage().ShowMsg(this.Page, "System Error!");
            return false;
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        this.PK_Key = this.DropDownList4.SelectedValue.ToString().Trim();
        if (!get_data(this.PK_Key))
            new AlertMessage().ShowMsg(this.Page, "抓不到資料，請連絡系統開發人員！");
        else
        {
            ShowData(this.PK_Key);
        }

    }
    protected bool get_data(String pk_key) //取出資料
    {
        SysDb db = new SysDb();
        db.SelectCommand = "SELECT [emp002],[emp003],convert(varchar, emp005, 111) as emp005,[emp008], ";
        db.SelectCommand += " [emp004],[emp006], [emp009]  FROM[dbo].[Employee] where [emp001]=@emp001 ";
        db.SelectParameters.Add("emp001", pk_key);
        DataSourceSelectArguments para = new DataSourceSelectArguments();
        try
        {
            this.dv = (DataView)db.Select(para);
        }
        catch (Exception)
        {
            new AlertMessage().ShowMsg(this.Page, "System Error!");
        }
        if (this.dv.Count > 0)
            return true;
        else
            return false;
    }
    protected void ShowData(String OLD_PK) //顥示資料
    {
        /*  傳統寫法
        this.TextBox1.Text = this.dv[0][0].ToString();         //姓名
        this.TextBox2.Text = this.dv[0][1].ToString();         //身份證字號
        this.TextBox3.Text = this.dv[0][2].ToString();         //生日
        this.TextBox4.Text = this.dv[0][3].ToString();         //地址
        this.DropDownList1.SelectedValue = this.dv[0][4].ToString().Trim();
        this.DropDownList2.SelectedValue = this.dv[0][5].ToString().Trim();
        this.DropDownList3.SelectedValue = this.dv[0][6].ToString().Trim();
        */

        //給人看不懂的寫法
        TextBox[] UserTB = { this.TextBox1, this.TextBox2, this.TextBox3, this.TextBox4 };
        DropDownList[] UserDD = { this.DropDownList1, this.DropDownList2, this.DropDownList3 };
        for (int i = 0; i < 7; i++)
        {
            if (i<=3)
                UserTB[i].Text = this.dv[0][i].ToString();
            else
               UserDD[i-4].SelectedValue=this.dv[0][i].ToString().Trim();

        }



    }

}