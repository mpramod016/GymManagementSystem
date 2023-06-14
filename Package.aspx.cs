using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;

public partial class Admin_demo_1_Package : System.Web.UI.Page
{
    SqlCommand com;
    string str;
    SqlCommand cmd;
    SqlConnection con;
    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
    SqlDataReader rdr;
    protected void Page_Load(object sender, EventArgs e)
    {
        auto();
    }

    private void auto()
    {
        int Num = 0;
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString);
        con.Open();
        string sql = "SELECT MAX(ID+1) FROM PackageTable";
        cmd = new SqlCommand(sql);
        cmd.Connection = con;
        if (Convert.IsDBNull(cmd.ExecuteScalar()))
        {
            Num = 01;
            lblTrainerId.Text = Convert.ToString(Num);
            txtPackageId.Text = Convert.ToString("PACK-" + Num);
        }
        else
        {
            Num = (int)(cmd.ExecuteScalar());
            lblTrainerId.Text = Convert.ToString(Num);
            txtPackageId.Text = Convert.ToString("PACK-" + Num);
        }
        cmd.Dispose();
        con.Close();
        con.Dispose();
    }

    private Boolean InsertUpdateData(SqlCommand cmd)
    {
        String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            return false;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
    private void Clear()
    {
        txtDetails.Text = "";
        txtPackageName.Text = "";
        txtPackagePrice.Text ="";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlConnection con1 = new SqlConnection(CS);
                con1.Open();
                str = "select count(*)from PackageTable where PackageName='" + txtPackageName.Text + "'";
                com = new SqlCommand(str, con1);
                int count = Convert.ToInt32(com.ExecuteScalar());
                if (count > 0)
                {
                    string message = "Package Name already Enter";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    txtPackageName.Text = "";
                    return;
                }
                else
                {
                    string strQuery = "insert into PackageTable(PackageId,PackageName,Details,PackagePrice,EnterBy,EnterOn) values (@PackageId,@PackageName,@Details,@PackagePrice,@EnterBy,@EnterOn)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.Add("@PackageId", SqlDbType.VarChar).Value = txtPackageId.Text;
                    cmd.Parameters.Add("@PackageName", SqlDbType.NVarChar).Value = txtPackageName.Text;
                    cmd.Parameters.Add("@Details", SqlDbType.NVarChar).Value = txtDetails.Text;
                    cmd.Parameters.Add("@PackagePrice", SqlDbType.Char).Value = txtPackagePrice.Text;
                    cmd.Parameters.Add("@EnterBy", SqlDbType.VarChar).Value = "Raju";
                    cmd.Parameters.Add("@EnterOn", SqlDbType.DateTime).Value = System.DateTime.Now.ToString();
                    InsertUpdateData(cmd);
                    Clear();
                    auto();
                    string message = "New Package added successfully!!";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                }
            }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Clear();
    }
}