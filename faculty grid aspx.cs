using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Result
{
    public partial class facultygrid : System.Web.UI.Page
    {
        public static string faculty_username;
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["faculty_username"] != null)
            {
                faculty_username = Session["faculty_username"].ToString();
                lbluser.Text = faculty_username;
            }
            else
            {
                Response.Redirect("~/faculty_login.aspx");
            }
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

        public void fnfetchuser()
        {


            try
            {
                fn_ConnectDB();
                string qry = "select * from faculty where faculty_username=@faculty_username";
                cmd = new SqlCommand(qry, conn);
                // cmd.Parameters.AddWithValue("@stud_username",txtusername.Text);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblfirstname.Text = dr["faculty_firstname"].ToString();
                    lbllastname.Text = dr["faculty_lastname"].ToString();

                }
                dr.Close();
                ;
            }



            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }


    }
}
