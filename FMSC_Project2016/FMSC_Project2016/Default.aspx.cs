using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FMSC_Project2016
{
    public partial class Default : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            int start_pixel;
            int end_pixel;
            string registered_name;
            int visible_pixel;

            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;

            SqlConnection dbConnection = new SqlConnection(conStr);
            SqlCommand sqlcommand;
            SqlDataReader reader;

            try
            {
                dbConnection.Open();
                string query = "Select top 1 * from purchase_user order by end_pixel desc;";
                sqlcommand = new SqlCommand(query, dbConnection);
                reader = sqlcommand.ExecuteReader();
                if (reader.Read())
                {
                    start_pixel = (int)reader["START_PIXEL"];
                    end_pixel = (int)reader["END_PIXEL"];
                    registered_name = reader["REGISTERED_NAME"].ToString();
                    visible_pixel = (int)reader["END_PIXEL"];
                }
            }
            catch
            {
                Response.Write("Some error");
            }
            finally
            {
                dbConnection.Close();
            }
        }



    }
}