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
        private int start_pixel;
        private int end_pixel;
        private string registered_name;
        private int visible_pixel;
        private int no_Of_Donations;
        protected void Page_Load(object sender, EventArgs e)
        {

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

                reader.Close();

                string queryTotalUser = "Select count(*) num from purchase_user";
                sqlcommand = new SqlCommand(queryTotalUser, dbConnection);
                reader = sqlcommand.ExecuteReader();
                if (reader.Read())
                {
                    no_Of_Donations = (int)reader["num"];
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

        public int Start_pixel { get { return start_pixel; } }
        public int End_pixel { get { return end_pixel; } }
        public string Registered_name { get { return registered_name; } }
        public int Visible_pixel { get { return visible_pixel; } }
        public int No_Of_Donations { get { return no_Of_Donations; } }

    }
}