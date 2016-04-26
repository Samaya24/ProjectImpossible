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
    public partial class Unsubscribe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string user_id = Request.QueryString[0].ToString();

                string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
                SqlConnection dbConnection = new SqlConnection(conStr);
                SqlCommand command;

                string query = "update user_details set subscription='No' where user_id = '"+user_id+"'";
                try
                {
                    dbConnection.Open();
                    command = new SqlCommand(query, dbConnection);
                    command.ExecuteNonQuery();
                    Label1.Text = "Your subscription to mail updates ahs been canceled." + "<br /><br />" + "Please check the home page for further updates.";
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
}