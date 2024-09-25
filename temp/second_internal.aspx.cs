using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newres
{
    public partial class second_internal : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //bindclassdropdown();
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
        //public void bindprogrammedropdown()
        //{
        //    try
        //    {
        //        fn_ConnectDB();
        //        string query = "SELECT programme_id,class_id,";
        //        cmd = new SqlCommand(query, conn);
        //        ddlProgrammeID.DataSource = cmd.ExecuteReader();
        //        ddlProgrammeID.DataTextField = "programme_name";
        //        ddlProgrammeID.DataValueField = "programme_id";
        //        ddlProgrammeID.DataBind();
        //        ddlProgrammeID.Items.Insert(0, new ListItem("Select Programme", ""));
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write(ex.Message);
        //    }
        //}
        //public void bindclassdropdown()
        //{
        //    try
        //    {
        //        fn_ConnectDB();
        //        string query = "SELECT class_id, class_name FROM class WHERE programme_id = @programmeId";
        //        cmd = new SqlCommand(query, conn);
        //        cmd.Parameters.AddWithValue("@programmeId", ddlProgrammeID.SelectedValue);
        //        sda = new SqlDataAdapter(cmd);
        //        DataSet ds = new DataSet();
        //        sda.Fill(ds);
        //        ddlClassID.DataSource = ds;
        //        ddlClassID.DataTextField = "class_name";
        //        ddlClassID.DataValueField = "class_id";
        //        ddlClassID.DataBind();
        //        ddlClassID.Items.Insert(0, new ListItem("Select Class", ""));
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write(ex.Message);
        //    }
        //}
        public void fndisdetails()
        {
            fn_ConnectDB();
            string query = "SELECT programme_id,class_id FROM student WHERE reg_no=@reg_no";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@reg_no", txtRegNo.Text);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                txtproid.Text = reader["programme_id"].ToString();
                txtclassid.Text = reader["class_id"].ToString();
                lblMessage.Text = ""; // Clear any previous messages
            }
        }


        public void fn_subcode()
        {
            fn_ConnectDB();
            try
            {
                fn_ConnectDB();
                string query = "SELECT subject_code,subject_name FROM subject WHERE subject_sem=@sem and class_id=@class_id";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@sem", txtsem.Text);
                cmd.Parameters.AddWithValue("@class_id", txtclassid.Text);
                ddlSubjectCode.DataSource = cmd.ExecuteReader();
                ddlSubjectCode.DataTextField = "subject_name";
                ddlSubjectCode.DataValueField = "subject_code";
                ddlSubjectCode.DataBind();
                ddlSubjectCode.Items.Insert(0, new ListItem("Select subject", ""));
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }




        protected void txtObtainedMarks_TextChanged(object sender, EventArgs e)
        {
            int obtainedMarks;
            try
            {
                obtainedMarks = Convert.ToInt32(txtObtainedMarks.Text);

                if (obtainedMarks >= 24)
                {
                    if (obtainedMarks >= 60)
                    {
                        txtGrade.Text = "A";
                    }
                    else if (obtainedMarks >= 45 && obtainedMarks <= 60)
                    {
                        txtGrade.Text = "B";
                    }
                    else
                    {
                        txtGrade.Text = "C";
                    }
                    txtResult.Text = "Pass";

                }
                else
                {
                    txtGrade.Text = "D";

                    txtResult.Text = "Fail";
                }

            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                fn_ConnectDB();
                string query = "INSERT INTO first_internal_marks(reg_no,semester,subject_code,programme_id,max_marks,min_marks,obtained_marks,grade,result,class_id) Values(@reg_no,@semester,@subject_code,@programme_id,@max_marks,@min_marks,@obttained_marks,@grade,@result,@class_id) ";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@reg_no", txtRegNo.Text);
                cmd.Parameters.AddWithValue("@semester", txtsem.Text);
                cmd.Parameters.AddWithValue("@subject_code", ddlSubjectCode.SelectedValue);
                cmd.Parameters.AddWithValue("@programme_id", txtproid.Text);
                cmd.Parameters.AddWithValue("@max_marks", txtMaxMarks.Text);
                cmd.Parameters.AddWithValue("@min_marks", txtMinMarks.Text);
                cmd.Parameters.AddWithValue("@obttained_marks", txtObtainedMarks.Text);
                cmd.Parameters.AddWithValue("@grade", txtGrade.Text);
                cmd.Parameters.AddWithValue("@result", txtResult.Text);
                cmd.Parameters.AddWithValue("@class_id", txtclassid.Text);
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
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void txtRegNo_TextChanged(object sender, EventArgs e)
        {
            fndisdetails();
        }

        protected void txtsem_TextChanged(object sender, EventArgs e)
        {
            fn_subcode();
        }
    }
}
