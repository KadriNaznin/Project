

using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;
using System.Configuration;
using System.Web.UI;

namespace newres
{
    public partial class chart : Page
    {
        private string connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;

            if (!IsPostBack)
            {
                // Retrieve the reg_no from the session and load chart on page load
                if (Session["RegNo"] != null)
                {
                    int regNo;
                    if (int.TryParse(Session["RegNo"].ToString(), out regNo))
                    {
                        // Fetch and display the performance chart based on the session value
                        DataTable performanceData = GetStudentPerformance(regNo);
                        if (performanceData.Rows.Count > 0)
                        {
                            BindChart(performanceData);
                        }
                        else
                        {
                            chartPerformance.Series["Marks"].Points.Clear();
                        }
                    }
                }
                else
                {
                    // If no session data is found, clear the chart
                    chartPerformance.Series["Marks"].Points.Clear();
                }
            }
        }

        // Fetch the student performance data from the database
        private DataTable GetStudentPerformance(int regNo)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                DataTable dt = new DataTable();
                string query = @"
                    SELECT 'First Internal' AS ExamType, obtained_marks FROM dbo.first_internal_marks WHERE reg_no = @regNo
                    UNION ALL
                    SELECT 'Second Internal' AS ExamType, obtained_marks FROM dbo.second_internal_marks WHERE reg_no = @regNo
                    UNION ALL
                    SELECT 'Final Exam' AS ExamType, obtained_marks FROM dbo.final_marks WHERE reg_no = @regNo";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@regNo", regNo);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
                return dt;
            }
        }

        // Bind the performance data to the chart
        private void BindChart(DataTable performanceData)
        {
            chartPerformance.Series["Marks"].Points.Clear();
            foreach (DataRow row in performanceData.Rows)
            {
                string examType = row["ExamType"].ToString();
                int obtainedMarks = Convert.ToInt32(row["obtained_marks"]);
                chartPerformance.Series["Marks"].Points.AddXY(examType, obtainedMarks);
            }

            chartPerformance.ChartAreas[0].AxisX.Title = "Exams";
            chartPerformance.ChartAreas[0].AxisY.Title = "Marks Obtained";
            chartPerformance.Titles.Add("Student Performance Analysis");
        }
    }
}

