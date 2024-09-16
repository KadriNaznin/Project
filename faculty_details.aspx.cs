﻿using System;
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
    public partial class faculty_details : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("faculty_login.aspx");
            }
            else
            {
                lblWelcome.Text = "Welcome, " + Session["FirstName"].ToString() + " " + Session["LastName"].ToString();
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

        private void displaydata()
        {
            try
            {
                fn_ConnectDB();
                string query = "SELECT faculty_id, first_name, last_name, email, phone, address FROM faculty WHERE email = @Email";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString()); 
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gridviewfaculty.DataSource = ds;
                gridviewfaculty.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        private void displayStudents()
        {
            try
            {
                fn_ConnectDB();
                string query = "SELECT s.reg_no, s.first_name, s.last_name, s.email, s.phone, c.class_name FROM student s INNER JOIN programme p ON s.programme_id = p.programme_id INNER JOIN class c ON s.class_id = c.class_id";
                cmd = new SqlCommand(query, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gridviewstudents.DataSource = ds;
                gridviewstudents.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void btn_Details_Click(object sender, EventArgs e)
        {
            displaydata();
        }

        protected void btn_StudDetails_Click(object sender, EventArgs e)
        {
            displayStudents();
        }

        protected void gridviewstudents_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridviewstudents.EditIndex = e.NewEditIndex;
            displayStudents();
        }

        protected void gridviewstudents_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gridviewstudents.Rows[e.RowIndex];
            string reg_no = (row.FindControl("txtRegNo") as TextBox).Text;
            string first_name = (row.FindControl("txtFirstName") as TextBox).Text;
            string last_name = (row.FindControl("txtLastName") as TextBox).Text;
            string email = (row.FindControl("txtEmail") as TextBox).Text;
            string phone = (row.FindControl("txtPhone") as TextBox).Text;

            try
            {
                fn_ConnectDB();
                string query = "UPDATE student SET first_name=@FirstName, last_name=@LastName, email=@Email, phone=@Phone WHERE reg_no=@RegNo";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@RegNo", reg_no);
                cmd.Parameters.AddWithValue("@FirstName", first_name);
                cmd.Parameters.AddWithValue("@LastName", last_name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Phone", phone);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }

            gridviewstudents.EditIndex = -1;
            displayStudents();
        }

        protected void gridviewstudents_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridviewstudents.EditIndex = -1;
            displayStudents();
        }

        protected void gridviewstudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string reg_no = gridviewstudents.DataKeys[e.RowIndex].Value.ToString();

            try
            {
                fn_ConnectDB();
                string query = "DELETE FROM student WHERE reg_no=@RegNo";
                cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@RegNo", reg_no);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }

            displayStudents();
        }


        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/admin_login.aspx");
        }


    }
}