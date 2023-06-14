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


public partial class Admin_demo_1_Equipment : System.Web.UI.Page
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
        string sql = "SELECT MAX(ID+1) FROM EquipmentTable";
        cmd = new SqlCommand(sql);
        cmd.Connection = con;
        if (Convert.IsDBNull(cmd.ExecuteScalar()))
        {
            Num = 01;
            lblTrainerId.Text = Convert.ToString(Num);
            txtEquipmentId.Text = Convert.ToString("Equi" + Num);
        }
        else
        {
            Num = (int)(cmd.ExecuteScalar());
            lblTrainerId.Text = Convert.ToString(Num);
            txtEquipmentId.Text = Convert.ToString("Equi" + Num);
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
        txtEquipmentName.Text = "";
        txtEquipmentPrice.Text = "";
        DropDownList1.Text = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string gender = string.Empty;
        string filePath = FileUpload1.PostedFile.FileName;
        string filename = Path.GetFileName(filePath);
        string ext = Path.GetExtension(filename);
        string contenttype = String.Empty;
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
                str = "select count(*)from EquipmentTable where EquipmentName='" + txtEquipmentName.Text + "' And Price='" + txtEquipmentPrice.Text + "'";
                com = new SqlCommand(str, con1);
                int count = Convert.ToInt32(com.ExecuteScalar());
                if (count > 0)
                {
                    string message = "Equipment Name or Price already Enter";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");
                    sb.Append(message);
                    sb.Append("')};");
                    sb.Append("</script>");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                    txtEquipmentName.Text = "";
                    txtEquipmentPrice.Text = "";
                    return;
                }
                else
                {
                    Stream fs = FileUpload1.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string strQuery = "insert into EquipmentTable(EquipmentId,EquipmentName,Details,Price,UOM,Eimage,ContentType,EnterBy,EnterOn) values (@EquipmentId,@EquipmentName,@Details,@Price,@UOM,@Eimage,@ContentType,@EnterBy,@EnterOn)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.Add("@EquipmentId", SqlDbType.VarChar).Value = txtEquipmentId.Text;
                    cmd.Parameters.Add("@EquipmentName", SqlDbType.NVarChar).Value = txtEquipmentName.Text;
                    cmd.Parameters.Add("@Details", SqlDbType.NVarChar).Value = txtDetails.Text;
                    cmd.Parameters.Add("@Price", SqlDbType.Char).Value = txtEquipmentPrice.Text;
                    cmd.Parameters.Add("@UOM", SqlDbType.NVarChar).Value = DropDownList1.Text;
                    cmd.Parameters.Add("@Eimage", SqlDbType.Binary).Value = bytes;
                    cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = contenttype;
                    cmd.Parameters.Add("@EnterBy", SqlDbType.VarChar).Value = "Raju";
                    cmd.Parameters.Add("@EnterOn", SqlDbType.DateTime).Value = System.DateTime.Now.ToString();
                    InsertUpdateData(cmd);
                    Clear();
                    auto();
                    string message = "New Equipment added successfully!!";
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