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

public partial class Admin_Admin : System.Web.UI.Page
{
    SqlCommand com;
    string str;
    SqlCommand cmd;
    SqlConnection con;
    String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
    SqlDataReader rdr;
    protected void Page_Load(object sender, EventArgs e)
    {
        BindUserData();
        Member();
        Trainer();
        Package();
        Equipment();
        Orders();
    }
    private void Member()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from UserTable Where UserLevel='U'";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblMember.Text = rdr.GetValue(0).ToString();
        else
            lblMember.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }
    private void Trainer()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from TrainerTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblTrainer.Text = rdr.GetValue(0).ToString();
        else
            lblTrainer.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void Package()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from PackageTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblPackage.Text = rdr.GetValue(0).ToString();
        else
            lblPackage.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }

    private void Equipment()
    {
        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from EquipmentTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblEquipment.Text = rdr.GetValue(0).ToString();
        else
            lblEquipment.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    
    }
   

    private void Orders()
    {

        con = new SqlConnection(CS);
        con.Open();
        cmd = con.CreateCommand();
        cmd.CommandText = "Select Count(*) from PurchaseTable";
        rdr = cmd.ExecuteReader();
        if (rdr.Read())
            lblOrders.Text = rdr.GetValue(0).ToString();
        else
            lblOrders.Text = "0";
        if ((rdr != null))
            rdr.Close();
        if (con.State == ConnectionState.Open)
            con.Close();
    }
    private void BindUserData()
    {
        String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from PurchaseTable order By Id asc", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {

                    DataTable dtBrands = new DataTable();
                    sda.Fill(dtBrands);
                    RepeaterTeacher.DataSource = dtBrands;
                    RepeaterTeacher.DataBind();
                }

            }
        }
    }
}