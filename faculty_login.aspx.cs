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
    public partial class faculty_login : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                fn_ConnectDB();

                string query = "SELECT first_name, last_name, email, password FROM faculty WHERE email = @Email AND password = @Password";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", txtemail.Text);
                cmd.Parameters.AddWithValue("@Password", txtpassword.Text);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {

                    Session["UserEmail"] = txtemail.Text;
                    Session["FirstName"] = reader["first_name"].ToString();
                    Session["LastName"] = reader["last_name"].ToString();
                    Response.Redirect("faculty_details.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                    reader.Close();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}