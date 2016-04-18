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
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                Label1.Text = string.Empty;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;

            SqlConnection dbConnection = new SqlConnection(conStr);
            SqlCommand sqlcommand;
            SqlDataReader sqlreader;

            try
            {
                dbConnection.Open();

                string query = "INSERT INTO USER_DETAILS VALuES ('" + email_id.Text + "','" +
                    frst_name.Text + "','" + last_name.Text + "','" + street_address.Text + "','" +
                    city_address.Text + "','" + state_address.Text.ToUpper() + "','" + country_address.Text +
                    "','" + pin_address.Text + "','" + phone_num.Text + "','" + "Yes" + "');";
                sqlcommand = new SqlCommand(query, dbConnection);
                sqlcommand.ExecuteNonQuery();

                //Activating the password and security question view
                MultiView1.ActiveViewIndex = 1;
                Label1.Text = string.Empty;
            }
            catch(SqlException ex)
            {
                Label1.Text="<p>Error Code" + ex.Number + ": " + ex.Message + "</p>";
            }
            finally
            {
                dbConnection.Close();
            }

            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;

            SqlConnection dbConnection = new SqlConnection(conStr);
            SqlCommand sqlcommand;
            SqlDataReader sqlreader;

            try
            {
                dbConnection.Open();
                if(!(sec_ques1.SelectedItem.Text.Equals(null) && sec_ques2.SelectedItem.Text.Equals(null) && sec_ques3.SelectedItem.Text.Equals(null)))
                { 

                    string query = "INSERT INTO USER_LOGIN_DETAILS VALUES('" + email_id.Text + "','" +
                                    password.Text + "','" + sec_ques1.SelectedItem.Text + "','" + Answer1.Text + "','" +
                                    sec_ques2.SelectedItem.Text + "','" + Answer2.Text + "','" + sec_ques3.SelectedItem.Text + "','" +
                                    Answer3.Text + "');";
                    sqlcommand = new SqlCommand(query, dbConnection);
                    sqlcommand.ExecuteNonQuery();
                    MultiView1.ActiveViewIndex = 2;
                }
                else
                {
                    Label1.Text = "Please select a proper security question";
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
    }
}