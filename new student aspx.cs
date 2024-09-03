using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data;

namespace newres
{
    public partial class student_reg : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindprogrammedropdown();
                bindclassdropdown();
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


        public void bindprogrammedropdown()
        {
            try
            {
                fn_ConnectDB();
                string query = "SELECT programme_id, programme_name FROM programme"; // Assume programme_name exists
                cmd = new SqlCommand(query, conn);
                ddlprogrammeid.DataSource = cmd.ExecuteReader();
                ddlprogrammeid.DataTextField = "programme_name";
                ddlprogrammeid.DataValueField = "programme_id";
                ddlprogrammeid.DataBind();
                ddlprogrammeid.Items.Insert(0, new ListItem("Select Programme", ""));
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        public void bindclassdropdown()
        {
            try
            {
                fn_ConnectDB();
                string query = "SELECT class_id, class_name FROM class";
                cmd = new SqlCommand(query, conn);
                ddlclassid.DataSource = cmd.ExecuteReader();
                ddlclassid.DataTextField = "class_name";
                ddlclassid.DataValueField = "class_id";
                ddlclassid.DataBind();
                ddlclassid.Items.Insert(0, new ListItem("Select Class", ""));
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            try
            {
                fn_ConnectDB();
                string query = "INSERT INTO student (reg_no, first_name, last_name, gender, dob, email, phone, address, bloodgroup, birth_place, birth_district, pincode, password, programme_id, class_id, joining_year, semester, status) " +
                               "VALUES (@reg_no, @first_name, @last_name, @gender, @dob, @email, @phone, @address, @bloodgroup, @birth_place, @birth_district, @pincode, @password, @programme_id, @class_id, @joining_year, @semester, @status)";

                cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@reg_no", txtregno.Text);
                cmd.Parameters.AddWithValue("@first_name", txtfirstname.Text);
                cmd.Parameters.AddWithValue("@last_name", txtlastname.Text);
                cmd.Parameters.AddWithValue("@gender", ddlgender.SelectedValue);
                cmd.Parameters.AddWithValue("@dob", txtdob.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@phone", txtphone.Text);
                cmd.Parameters.AddWithValue("@address", txtaddress.Text);
                cmd.Parameters.AddWithValue("@bloodgroup", txtbloodgroup.Text);
                cmd.Parameters.AddWithValue("@birth_place", txtbirthplace.Text);
                cmd.Parameters.AddWithValue("@birth_district", txtbirthdistrict.Text);
                cmd.Parameters.AddWithValue("@pincode", txtpincode.Text);
                cmd.Parameters.AddWithValue("@password", txtpassword.Text);
                cmd.Parameters.AddWithValue("@programme_id", ddlprogrammeid.SelectedValue);
                cmd.Parameters.AddWithValue("@class_id", ddlclassid.SelectedValue);
                cmd.Parameters.AddWithValue("@joining_year", txtjoiningyear.Text);
                cmd.Parameters.AddWithValue("@semester", txtsemester.Text);
                cmd.Parameters.AddWithValue("@status", ddlstatus.SelectedValue);

                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    lblMessage.Text = "Inserted successfully";
                }
                else
                {
                    lblMessage.Text = "Insert operation failed";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

            }


        }
    }
}
