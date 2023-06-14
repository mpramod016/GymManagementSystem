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

public partial class Admin_demo_1_Trainer : System.Web.UI.Page
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
        string sql = "SELECT MAX(ID+1) FROM TrainerTable";
        cmd = new SqlCommand(sql);
        cmd.Connection = con;
        if (Convert.IsDBNull(cmd.ExecuteScalar()))
        {
            Num = 01;
            lblTrainerId.Text = Convert.ToString(Num);
            txtTrainerId.Text = Convert.ToString("TRN-" + Num);
        }
        else
        {
            Num = (int)(cmd.ExecuteScalar());
            lblTrainerId.Text = Convert.ToString(Num);
            txtTrainerId.Text = Convert.ToString("TRN-" + Num);
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
        txtAddress.Text = "";
        txtDateOfBirth.Text = "";
        txtEmail.Text = "";
        txtFullName.Text = "";
        txtMobileNo.Text = "";
        txtSalary.Text = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string gender = string.Empty;
        string filePath = FileUpload1.PostedFile.FileName;
        string filename = Path.GetFileName(filePath);
        string ext = Path.GetExtension(filename);
        string contenttype = String.Empty;
        if (rbMale.Checked)
        {
            gender = "M";
        }
        else if (rbFemale.Checked)
        {
            gender = "F";
        }
        switch (ext)
        {
            case ".jpg":
                contenttype = "image/jpg";
                break;
            case ".png":
                contenttype = "image/png";
                break;
        }
        if (contenttype != String.Empty)
        {
            String CS = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlConnection con1 = new SqlConnection(CS);
                con1.Open();
                str = "select count(*)from TrainerTable where Email='" + txtEmail.Text + "' And PhoneNumber='"+ txtMobileNo.Text +"'";
                com = new SqlCommand(str, con1);
                int count = Convert.ToInt32(com.ExecuteScalar());
                if (count > 0)
                {
                    string message = "Email Id or Phone Number already register";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    txtEmail.Text = "";
                    txtMobileNo.Text = "";
                    return;
                }
                else
                {
                    Stream fs = FileUpload1.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string strQuery = "insert into TrainerTable(TrainerId,TrainerName,Email,Gender,PhoneNumber,Address,Salary,DOB,DOJ,TImage,ContentType,EnterBy,EnterOn) values (@TrainerId,@TrainerName,@Email,@Gender,@PhoneNumber,@Address,@Salary,@DOB,@DOJ,@TImage,@ContentType,@EnterBy,@EnterOn)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.Add("@TrainerId", SqlDbType.VarChar).Value = txtTrainerId.Text;
                    cmd.Parameters.Add("@TrainerName", SqlDbType.NVarChar).Value =  txtFullName.Text;
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtEmail.Text;
                    cmd.Parameters.Add("@Gender", SqlDbType.Char).Value = gender;
                    cmd.Parameters.Add("@PhoneNumber", SqlDbType.NVarChar).Value = txtMobileNo.Text;
                    cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = txtAddress.Text;
                    cmd.Parameters.Add("@Salary", SqlDbType.NVarChar).Value = txtSalary.Text;
                    cmd.Parameters.Add("@DOB", SqlDbType.Date).Value = txtDateOfBirth.Text;
                    cmd.Parameters.Add("@DOJ", SqlDbType.Date).Value = txtDOJ.Text;
                    cmd.Parameters.Add("@TImage", SqlDbType.Binary).Value = bytes;
                    cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = contenttype;
                    cmd.Parameters.Add("@EnterBy", SqlDbType.VarChar).Value = "Raju";
                    cmd.Parameters.Add("@EnterOn", SqlDbType.DateTime).Value = System.DateTime.Now.ToString();
                    InsertUpdateData(cmd);
                    Clear();
                    auto();
                    string message = "New Trainer added successfully!!";
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
        string formatError = "File format not recognised. Upload Image formats";
        System.Text.StringBuilder sb1 = new System.Text.StringBuilder();
        sb1.Append("<script type = 'text/javascript'>");
        sb1.Append("window.onload=function(){");
        sb1.Append("alert('");
        sb1.Append(formatError);
        sb1.Append("')};");
        sb1.Append("</script>");
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb1.ToString());
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Clear();
    }
}