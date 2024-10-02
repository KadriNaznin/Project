using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
namespace newres
{
    public partial class result2 : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPrograms();
            }
        }

        // Load Programs into ddlProgram
        private void LoadPrograms()
        {
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myconn"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT programme_id, programme_name FROM programme", conn);
                SqlDataReader reader = cmd.ExecuteReader();
                ddlProgram.DataSource = reader;
                ddlProgram.DataTextField = "programme_name";
                ddlProgram.DataValueField = "programme_id";
                ddlProgram.DataBind();
                ddlProgram.Items.Insert(0, new ListItem("--Select Program--", "0"));
            }
        }

        // When Program is selected, load related Classes into ddlClass
        protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            int programmeId = Convert.ToInt32(ddlProgram.SelectedValue);
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myconn"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT class_id, class_name FROM class WHERE programme_id = @programmeId", conn);
                cmd.Parameters.AddWithValue("@programmeId", programmeId);
                SqlDataReader reader = cmd.ExecuteReader();
                ddlClass.DataSource = reader;
                ddlClass.DataTextField = "class_name";
                ddlClass.DataValueField = "class_id";
                ddlClass.DataBind();
                ddlClass.Items.Insert(0, new ListItem("--Select Class--", "0"));
            }
        }

        // When Class is selected, load Semesters into ddlSemester
        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            int classId = Convert.ToInt32(ddlClass.SelectedValue);
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myconn"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT subject_sem FROM subject WHERE class_id = @classId", conn);
                cmd.Parameters.AddWithValue("@classId", classId);
                SqlDataReader reader = cmd.ExecuteReader();
                ddlSemester.DataSource = reader;
                ddlSemester.DataTextField = "subject_sem";
                ddlSemester.DataValueField = "subject_sem";
                ddlSemester.DataBind();
                ddlSemester.Items.Insert(0, new ListItem("--Select Semester--", "0"));
            }
        }

        // When Semester is selected, load Student Details into GridView
        protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            int semester = Convert.ToInt32(ddlSemester.SelectedValue);
            LoadStudents(semester);
        }

      

        private void LoadStudents(int semester)
        {
            using (conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myconn"].ConnectionString))
            {
                conn.Open();

                // Modify query to ensure we are filtering students based on the selected semester
                SqlCommand cmd = new SqlCommand(@"
            SELECT s.reg_no, s.first_name, s.last_name, s.email
            FROM student s
            INNER JOIN subject sub ON s.class_id = sub.class_id
            WHERE sub.subject_sem = @semester AND s.semester = @semester", conn);  // Added s.semester = @semester to filter by semester

                cmd.Parameters.AddWithValue("@semester", semester);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvStudentDetails.DataSource = dt;
                gvStudentDetails.DataBind();
            }
        }


    }
    
}
