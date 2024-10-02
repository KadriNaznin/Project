
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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

                string query = "SELECT reg_no,first_name, last_name, email,gender,dob,phone,address,bloodgroup,birth_place,birth_district,pincode,password FROM student WHERE email = @Email AND password = @Password";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", txtemail.Text);
                cmd.Parameters.AddWithValue("@Password", txtpassword.Text);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {

                    Session["Email"] = txtemail.Text;
                    Session["RegNo"] = reader["reg_no"].ToString();
                    Session["FirstName"] = reader["first_name"].ToString();
                    Session["LastName"] = reader["last_name"].ToString();
                    Session["Gender"] = reader["gender"].ToString();
                    Session["DOB"] = reader["dob"].ToString();
                    Session["Phone"] = reader["phone"].ToString();
                    Session["Address"] = reader["address"].ToString();
                    Session["BloodGroup"] = reader["bloodgroup"].ToString();
                    Session["BirthPlace"] = reader["birth_place"].ToString();
                    Session["BirthDistrict"] = reader["birth_district"].ToString();
                    Session["Pincode"] = reader["pincode"].ToString();







                    Response.Redirect("student_dashboard.aspx");
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
