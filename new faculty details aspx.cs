using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace newres
{
    public partial class faculty_details : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserEmail"] == null)
            {

                Response.Redirect("faculty_login.aspx");
            }
            else
            {

                lblWelcome.Text = "Welcome, " + Session["UserEmail"].ToString() + "!";


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
                string query = "SELECT faculty_id, first_name, last_name, email, phone, address FROM faculty WHERE email = @Email";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString()); // Use the session email
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gridviewfaculty.DataSource = ds;
                gridviewfaculty.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}
