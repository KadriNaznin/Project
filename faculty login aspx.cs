using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Result
{
    public partial class faculty_login : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void fn_ConnectDB()
        {
            try
            {
                String str = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(str);

                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                fn_ConnectDB();
                string qry = "select count(*) from faculty where faculty_username=@faculty_username" +
                    " and faculty_password=@faculty_password";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("faculty_username", txtUsername.Text);

                cmd.Parameters.AddWithValue("faculty_password", txtPassword.Text);
                int cnt = (int)cmd.ExecuteScalar();
                if (cnt > 0)
                {
                    Session["faculty_username"] = txtUsername.Text;
                    Response.Redirect("~/facultygrid.aspx");
                }
                else
                {
                    Response.Write("invalid credentials");
                    conn.Close();
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());

            }
        }
    }
}
