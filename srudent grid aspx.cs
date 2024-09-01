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
    public partial class studgrid : System.Web.UI.Page
    {
        public static string stud_username;
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["stud_username"]!=null)
            {
                stud_username = Session["stud_username"].ToString();
                lbluser.Text = stud_username;
            }
            else
            {
                Response.Redirect("~/student_login.aspx");
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
                string qry = "select * from student where stud_username=@stud_username";
                cmd=new SqlCommand(qry,conn);
               // cmd.Parameters.AddWithValue("@stud_username",txtusername.Text);
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.Read())
                {
                    lblfirstname.Text = dr["stud_firstname"].ToString();
                    lbllastname.Text = dr["stud_lastname"].ToString();

                }
                dr.Close();
;            }



            catch(Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }


    }
}
