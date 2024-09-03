using System;
using System.Configuration;
using System.Data.SqlClient;

namespace newres
{
    public partial class student_login : System.Web.UI.Page
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

                string query = "SELECT COUNT(*) FROM student WHERE email = @Email AND password = @Password";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", txtemail.Text);
                cmd.Parameters.AddWithValue("@Password", txtpassword.Text);

                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    
                    Session["UserEmail"] = txtemail.Text;

                    lblMessage.Text = "Login successful!";

                   
                    Response.Redirect("student_details.aspx"); 
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
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
