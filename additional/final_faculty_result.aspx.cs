



using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newres
{
    public partial class studentdetails : System.Web.UI.Page
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
                    Response.Redirect("~/newresult.aspx");
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

        // Button click event to handle viewing performance
        protected void btnViewPerformance_Click(object sender, EventArgs e)
        {
            if (Session["reg_no"] != null)
            {
                Response.Redirect("chart3.aspx");
            }
        }
    }
}
