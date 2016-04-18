using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FMSC_Project2016
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                Label1.Text = string.Empty;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;

            SqlConnection dbConnection = new SqlConnection(conStr);
            SqlCommand sqlcommand;
            SqlDataReader reader;

            try
            {
                dbConnection.Open();
                string query = "select * from user_login_details where user_id='" + email_id.Text + "';";
                sqlcommand = new SqlCommand(query, dbConnection);
                reader = sqlcommand.ExecuteReader();

                if (reader.Read())
                {
                    
                    Session["sec_question1"] = reader["sec_question1"];
                    sec_ques1.Text = reader["sec_question1"].ToString();
                    sec_ques1.ReadOnly = true;
                    Session["answer1"] = reader["answer1"];

                    Session["sec_question2"] = reader["sec_question2"];
                    sec_ques2.Text = reader["sec_question2"].ToString();
                    Session["answer2"] = reader["answer2"];
                    sec_ques2.ReadOnly = true;

                    Session["sec_question3"] = reader["sec_question3"];
                    sec_ques3.Text = reader["sec_question3"].ToString();
                    Session["answer3"] = reader["answer3"];
                    sec_ques3.ReadOnly = true;

                    MultiView1.ActiveViewIndex = 1;
                }
                else
                {
                    Label1.Text = "The email id entered is not in the records, Please sign up.";
                }
            }
            catch(SqlException ex)
            {
                Label1.Text = "<p>Error Code" + ex.Number + ": " + ex.Message + "</p>";
            }
            finally
            {
                dbConnection.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int counter = 0;
            Label1.Text = string.Empty;

            while (counter < 4)
            {
                if (Answer1.Text.Equals((string)Session["answer1"]) && Answer2.Text.Equals((string)Session["answer2"]) && Answer3.Text.Equals((string)Session["answer3"]))
                {
                    MultiView1.ActiveViewIndex = 2;
                    break;
                }
                else
                {
                        Label1.Text = "The answers entered are wrong. Please try again";
                }
                counter++;
            }

            if (counter >= 4)
            {
                Label1.Text = "You have crossed the number of attempts";
            }
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label1.Text = string.Empty;
            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;

            SqlConnection dbconnection = new SqlConnection(conStr);
            SqlCommand sqlcommand;
            SqlDataReader reader;

            try
            {
                dbconnection.Open();
                string query = "UPDATE USER_LOGIN_DETAILS SET PASSWORD = '" + password.Text
                                + "' WHERE USER_ID = '" + email_id.Text + "';";
                sqlcommand = new SqlCommand(query, dbconnection);
                sqlcommand.ExecuteNonQuery();
                MultiView1.ActiveViewIndex = 3;
            }
            catch(SqlException ex)
            {
                Label1.Text = "<p>Error Code" + ex.Number + ": " + ex.Message + "</p>";
            }
            finally
            {
                dbconnection.Close();
            }
        }
    }
}