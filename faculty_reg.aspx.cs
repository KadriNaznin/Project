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
    public partial class faculty_reg : System.Web.UI.Page
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

        protected void btn_reg_Click(object sender, EventArgs e)
        {

            try
            {
                fn_ConnectDB();

                string query = "INSERT INTO faculty (first_name, last_name, gender, dob, email, password, phone, address, bloodgroup, faculty_status) " +
                                   "VALUES (@first_name, @last_name, @gender, @dob, @email, @password, @phone, @address, @bloodgroup, @faculty_status)";

                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@first_name", txtfirstname.Text);
                cmd.Parameters.AddWithValue("@last_name", txtlastname.Text);
                cmd.Parameters.AddWithValue("@gender", ddlgender.SelectedValue);
                cmd.Parameters.AddWithValue("@dob", txtdob.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@phone", txtphone.Text);
                cmd.Parameters.AddWithValue("@address", txtaddress.Text);
                cmd.Parameters.AddWithValue("@bloodgroup", txtbloodgroup.Text);
                cmd.Parameters.AddWithValue("@password", txtpass.Text);
                cmd.Parameters.AddWithValue("@faculty_status", ddlfacultystatus.SelectedValue);


                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    lblMsg.Text = "Inserted successfully";
                }
                else
                {
                    lblMsg.Text = "Insert operation failed";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

    }
}