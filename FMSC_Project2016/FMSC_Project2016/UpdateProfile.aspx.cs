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
    public partial class UpdateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;

                SqlConnection dbConnection = new SqlConnection(conStr);
                SqlCommand sqlcommand;
                SqlDataReader reader;
                string username = User.Identity.Name;

                try
                {
                    dbConnection.Open();
                    string query = "SELECT * FROM USER_DETAILS WHERE USER_ID = '"+username+"';";
                    sqlcommand = new SqlCommand(query, dbConnection);
                    reader = sqlcommand.ExecuteReader();

                    if (reader.Read())
                    {
                        frst_name.Text = reader["first_name"].ToString();
                        last_name.Text = reader["last_name"].ToString();
                        street_address.Text = reader["street_address"].ToString();
                        city_address.Text = reader["city"].ToString();
                        state_address.Text = reader["state_address"].ToString();
                        email_id.Text = reader["user_id"].ToString();
                        email_id.ReadOnly = true;
                        country_address.Text = reader["country"].ToString();
                        phone_num.Text = reader["phone_no"].ToString();
                        pin_address.Text = reader["pin"].ToString();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;

            SqlConnection dbConnection = new SqlConnection(conStr);
            SqlCommand sqlcommand;
            SqlDataReader sqlreader;

            try
            {
                dbConnection.Open();
                string query = "UPDATE USER_DETAILS SET FIRST_NAME = '"+frst_name.Text+"', LAST_NAME='"+last_name.Text
                                +"',STREET_ADDRESS='"+street_address.Text+"',CITY='"+city_address.Text
                                +"',STATE_ADDRESS='"+state_address.Text+"',COUNTRY='"+country_address.Text
                                +"',PIN='"+pin_address.Text+"',PHONE_NO='"+phone_num.Text
                                +"' WHERE USER_ID='"+email_id.Text+"'";
                sqlcommand = new SqlCommand(query, dbConnection);
                sqlcommand.ExecuteNonQuery();

                //Activating the password and security question view
                Label1.Text = "Your records have been updated";
            }
            catch (SqlException ex)
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