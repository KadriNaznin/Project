using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace newres
{
    public partial class upd_student_profile : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudentProfile();
            }
        }

        private void LoadStudentProfile()
        {
            string regNo = Session["RegNo"]?.ToString();
            if (string.IsNullOrEmpty(regNo))
            {
                Response.Redirect("student_login.aspx");
            }

            {
                fn_ConnectDB();
                SqlCommand cmd = new SqlCommand("SELECT * FROM student WHERE reg_no = @RegNo", conn);
                cmd.Parameters.AddWithValue("@RegNo", regNo);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtFirstName.Text = reader["first_name"].ToString();
                    txtLastName.Text = reader["last_name"].ToString();
                    txtGender.Text = reader["gender"].ToString();
                    txtDOB.Text = Convert.ToDateTime(reader["dob"]).ToString("yyyy-MM-dd");
                    txtEmail.Text = reader["email"].ToString();
                    txtPhone.Text = reader["phone"].ToString();
                    txtAddress.Text = reader["address"].ToString();
                    txtBloodGroup.Text = reader["bloodgroup"].ToString();
                    txtBirthPlace.Text = reader["birth_place"].ToString();
                    txtBirthDistrict.Text = reader["birth_district"].ToString();
                    txtPincode.Text = reader["pincode"].ToString();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string regNo = Session["RegNo"]?.ToString();
            if (string.IsNullOrEmpty(regNo))
            {
                Response.Redirect("student_login.aspx");
                return;
            }

            {
                fn_ConnectDB();
                SqlCommand cmd = new SqlCommand("UPDATE student SET first_name = @FirstName, last_name = @LastName, gender = @Gender, dob = @DOB, email = @Email, phone = @Phone, address = @Address, bloodgroup = @BloodGroup, birth_place = @BirthPlace, birth_district = @BirthDistrict, pincode = @Pincode WHERE reg_no = @RegNo", conn);

                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@Gender", txtGender.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@BloodGroup", txtBloodGroup.Text);
                cmd.Parameters.AddWithValue("@BirthPlace", txtBirthPlace.Text);
                cmd.Parameters.AddWithValue("@BirthDistrict", txtBirthDistrict.Text);
                cmd.Parameters.AddWithValue("@Pincode", txtPincode.Text);
                cmd.Parameters.AddWithValue("@RegNo", regNo);

                int result = cmd.ExecuteNonQuery();
                lblMessage.Visible = true;
                lblMessage.Text = result > 0 ? "Profile updated successfully." : "Error updating profile.";
            }

        }
        protected void fn_ConnectDB()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connectionString);
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
    }
}
