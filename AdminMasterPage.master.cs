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

public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    SqlCommand com;
    string str;
    SqlCommand cmd;
    SqlConnection con;
    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
    SqlDataReader rdr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERID"] != null)
        {
            lblUserName.Text = Session["USERNAME"].ToString();
            lblUserName1.Text = Session["USERNAME"].ToString();
            lblMail.Text = Session["USEREMAIL"].ToString();
            lblMail1.Text = Session["USEREMAIL"].ToString();
            BindRoleRptr();
        }
        else
        {
            Response.Redirect("~/User/SignIn.aspx");
        }
    }

    private void BindRoleRptr()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from UserTable Where Id='" + Session["USERID"].ToString() + "' And UserLevel='A' order By Id asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {

                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    Repeater1.DataSource = dtBrands;
                    Repeater1.DataBind();
                    Repeater2.DataSource = dtBrands;
                    Repeater2.DataBind();
                    Repeater3.DataSource = dtBrands;
                    Repeater3.DataBind();
                }

            }
        }
    }
}
