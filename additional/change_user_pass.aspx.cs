using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace newres
{
    public partial class change_user_pass : Page
    {
        SqlConnection conn;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("student_login.aspx");
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
                lblMessage.Text = "Database Connection Error: " + ex.Message;
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtCurrentPassword.Text) ||
                string.IsNullOrEmpty(txtNewPassword.Text) ||
                string.IsNullOrEmpty(txtConfirmPassword.Text))
            {
                lblMessage.Text = "All fields are required!";
                return;
            }

            if (txtNewPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "New Password and Confirm Password do not match!";
                return;
            }

            try
            {
                fn_ConnectDB();

                string query = "SELECT password FROM student WHERE email = @Email AND password = @CurrentPassword";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", Session["Email"].ToString());
                cmd.Parameters.AddWithValue("@CurrentPassword", txtCurrentPassword.Text);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    reader.Close();

                    query = "UPDATE student SET password = @NewPassword WHERE email = @Email";
                    cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@NewPassword", txtNewPassword.Text);
                    cmd.Parameters.AddWithValue("@Email", Session["Email"].ToString());

                    cmd.ExecuteNonQuery();

                    lblMessage.CssClass = "success-message";
                    lblMessage.Text = "Password changed successfully!";
                }
                else
                {
                    lblMessage.Text = "Current password is incorrect!";
                }

                reader.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
