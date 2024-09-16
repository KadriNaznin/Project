using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace newres
{
    public partial class student_details : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {

                Response.Redirect("student_login.aspx");
            }
            else
            {

                lblWelcome.Text = "Welcome, " + Session["FirstName"].ToString() + " " + Session["LastName"].ToString();


                displaydata();
            }
        }

        protected void fn_ConnectDB()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connectionString);

                if (conn.State != System.Data.ConnectionState.Open)
                {
                    conn.Open();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        private void displaydata()
        {
            try
            {
                fn_ConnectDB();
                string query = "SELECT s.reg_no, s.first_name, s.last_name, s.email, s.phone,s.joining_year, p.programme_name, c.class_name FROM student s INNER JOIN programme p ON s.programme_id = p.programme_id INNER JOIN class c ON s.class_id = c.class_id WHERE s.email = @Email";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gridviewstudents.DataSource = ds;
                gridviewstudents.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/admin_login.aspx");
        }

        //SELECT reg_no, first_name, last_name, email, phone, programme_id FROM student WHERE email = @Email
    }
}