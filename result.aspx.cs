
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newres
{
    public partial class result : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPrograms();
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

        protected void LoadPrograms()
        {
            fn_ConnectDB();
            string qry = "SELECT programme_id, programme_name FROM programme";
            cmd = new SqlCommand(qry, conn);
            dr = cmd.ExecuteReader();
            ddlPrograms.DataSource = dr;
            ddlPrograms.DataTextField = "programme_name";
            ddlPrograms.DataValueField = "programme_id";
            ddlPrograms.DataBind();
            ddlPrograms.Items.Insert(0, new ListItem("Select Program", "0"));
            dr.Close();
            conn.Close();
        }

        protected void ddlPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadClasses();
            gvStudents.DataSource = null;
            gvStudents.DataBind();
        }

        protected void LoadClasses()
        {
            fn_ConnectDB();
            int programmeId = Convert.ToInt32(ddlPrograms.SelectedValue);
            string qry = "SELECT class_id, class_name FROM class WHERE programme_id = @ProgrammeId";
            cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@ProgrammeId", programmeId);
            dr = cmd.ExecuteReader();
            ddlClasses.DataSource = dr;
            ddlClasses.DataTextField = "class_name";
            ddlClasses.DataValueField = "class_id";
            ddlClasses.DataBind();
            ddlClasses.Items.Insert(0, new ListItem("Select Class", "0"));
            dr.Close();
            conn.Close();
        }

        protected void ddlClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            fn_ConnectDB();
            int classId = Convert.ToInt32(ddlClasses.SelectedValue);

            String query = "SELECT DISTINCT subject_sem FROM subject WHERE class_id = @classId";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@classId", classId);
            dr = cmd.ExecuteReader();
            ddlSemesters.DataSource = dr;
            ddlSemesters.DataTextField = "subject_sem";
            ddlSemesters.DataValueField = "subject_sem";
            ddlSemesters.DataBind();
            ddlSemesters.Items.Insert(0, new ListItem("--Select Semester--", "0"));
        }

        protected void LoadSemesters()
        {
            ddlSemesters.Items.Clear();
            ddlSemesters.Items.Add(new ListItem("Select Semester", "0"));

            int programmeId = Convert.ToInt32(ddlPrograms.SelectedValue);
            string qry = "SELECT programme_name FROM programme WHERE programme_id = @ProgrammeId";
            fn_ConnectDB();
            cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@ProgrammeId", programmeId);
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                string programmeName = dr["programme_name"].ToString();
                int semesterCount = programmeName.Contains("Bachelor") ? 6 : 4;

                for (int i = 1; i <= semesterCount; i++)
                {
                    ddlSemesters.Items.Add(new ListItem(i.ToString()));
                }
            }
            dr.Close();
            conn.Close();
        }

        protected void ddlSemesters_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadStudents();
        }

        protected void LoadStudents()
        {
            fn_ConnectDB();
            String qry = "SELECT reg_no, first_name, last_name, gender, joining_year, programme_id, class_id FROM student WHERE class_id=@class_id AND programme_id=@programme_id AND semester=@semester";

            cmd = new SqlCommand(@qry, conn);
            cmd.Parameters.AddWithValue("@class_id", ddlClasses.SelectedValue);
            cmd.Parameters.AddWithValue("@programme_id", ddlPrograms.SelectedValue);
            cmd.Parameters.AddWithValue("@semester", ddlSemesters.SelectedValue);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvStudents.DataSource = dt;
            gvStudents.DataBind();
        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewResult")
            {
                string reg_no = e.CommandArgument.ToString();
                Session["reg_no"] = reg_no;
                Response.Redirect("faculty_result.aspx");
            }
        }
    }
}
