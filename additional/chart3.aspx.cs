using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;
using System.Configuration;
using System.Web.UI;

namespace newres
{
    public partial class chart3 : Page
    {
        private string connectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = ConfigurationManager.ConnectionStrings["myconn"].ConnectionString;

            if (!IsPostBack)
            {
                DataTable overallPerformanceData = GetOverallPerformance();
                if (overallPerformanceData.Rows.Count > 0)
                {
                    BindChart(overallPerformanceData);
                }
                else
                {
                    chartPerformance.Series["Marks"].Points.Clear();
                    chartPerformance.Titles.Clear();
                    chartPerformance.Titles.Add("No Data Found");
                }
            }
        }

        private DataTable GetOverallPerformance()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                DataTable dt = new DataTable();
                // Summing up total marks for each exam type (First Internal, Second Internal, Final Exam) across all students
                string query = @"
                    SELECT 
                    ISNULL(SUM(fi.obtained_marks), 0) AS FirstInternalTotal,
                    ISNULL(SUM(si.obtained_marks), 0) AS SecondInternalTotal,
                    ISNULL(SUM(fm.obtained_marks), 0) AS FinalExamTotal
                    FROM student s
                    LEFT JOIN first_internal_marks fi ON s.reg_no = fi.reg_no
                    LEFT JOIN second_internal_marks si ON s.reg_no = si.reg_no
                    LEFT JOIN final_marks fm ON s.reg_no = fm.reg_no";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
                return dt;
            }
        }

        private void BindChart(DataTable performanceData)
        {
            chartPerformance.Series["Marks"].Points.Clear();
            chartPerformance.Titles.Clear();

            if (performanceData.Rows.Count > 0)
            {
                DataRow row = performanceData.Rows[0];

                // Get the overall total marks for each exam type
                double firstInternalTotal = row["FirstInternalTotal"] != DBNull.Value ? Convert.ToDouble(row["FirstInternalTotal"]) : 0;
                double secondInternalTotal = row["SecondInternalTotal"] != DBNull.Value ? Convert.ToDouble(row["SecondInternalTotal"]) : 0;
                double finalExamTotal = row["FinalExamTotal"] != DBNull.Value ? Convert.ToDouble(row["FinalExamTotal"]) : 0;

                // Add data points to the chart
                chartPerformance.Series["Marks"].Points.AddXY("First Internal (Total Marks from 70)", firstInternalTotal);
                chartPerformance.Series["Marks"].Points.AddXY("Second Internal (Total Marks from 70)", secondInternalTotal);
                chartPerformance.Series["Marks"].Points.AddXY("Final Exam (Total Marks from 100)", finalExamTotal);
            }

            chartPerformance.ChartAreas[0].AxisX.Title = "Exams";
            chartPerformance.ChartAreas[0].AxisY.Title = "Total Marks Obtained";
            chartPerformance.Titles.Add("Overall Performance in Each Exam");
        }
    }
}

