using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newres
{
    public partial class faculty_result : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static String id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["reg_no"] != null)
                {
                    id = Session["reg_no"].ToString();
                    fnbindgrid();
                    CalculateSGPAAndCGPA();
                }
                else
                {
                    Response.Redirect("~/result.aspx");
                }
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

        public void fnbindgrid()
        {
            try
            {
                fn_ConnectDB();
                //string qry = "SELECT f.*,s.subject_name FROM final_marks f,subject s WHERE f.reg_no=@reg_no";
                //string qry = "SELECT DISTINCT f.*, s.subject_name FROM final_marks f INNER JOIN subject s ON f.subject_id = s.subject_id WHERE f.reg_no=@reg_no";
                string qry = "SELECT f.*, s.subject_name FROM final_marks f INNER JOIN subject s ON f.subject_code = s.subject_code WHERE f.reg_no=@reg_no";

                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@reg_no", id);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gvStudents.DataSource = ds;
                gvStudents.DataBind();
                conn.Close();


            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
        public void CalculateSGPAAndCGPA()
        {
            try
            {
                fn_ConnectDB();
                string qry = "SELECT credit, grade_point_weightage FROM final_marks WHERE reg_no=@reg_no";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("reg_no", id);

                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                double totalGradePoints = 0;
                double totalCredits = 0;
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    double credit = Convert.ToDouble(row["credit"]);
                    double gradePoint = Convert.ToDouble(row["grade_point_weightage"]);
                    totalGradePoints += credit * gradePoint;
                    totalCredits += credit;
                }
                double sgpa = totalGradePoints / totalCredits;


                lblSGPA.Text = sgpa.ToString("0.00");


                lblCGPA.Text = sgpa.ToString("0.00");

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewResult")
            {
                string reg_no = e.CommandArgument.ToString();
                Session["reg_no"] = reg_no;
                Response.Redirect("chart.aspx");


                //// Get the data source of the GridView
                //DataTable dt = (DataTable)gvStudents.DataSource;

                //// Find the row with the matching reg_no
                //DataRow[] rows = dt.Select("reg_no = '" + reg_no + "'");

                //// Use the existing data that is already bound to the GridView
                //if (rows.Length > 0)
                //{
                //    lblResult.Text = "Result for " + reg_no + ": " + rows[0]["subject_name"].ToString();
                //}
            }
        }
    }
}
