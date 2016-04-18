using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FMSC_Project2016
{
    public partial class Dashboard : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            SqlCommand sqlcommand;
            SqlDataReader reader;

            try
            {
                con.Open();
                string query = "select b.state_address as states,sum(a.END_PIXEL) as pixel from PURCHASE_USER a join user_details b on a.user_id = b.user_id group by a.user_id,state_address;";
                DisplayRecord(query);
                //sqlcommand = new SqlCommand(query, dbConnection);
                //reader = sqlcommand.ExecuteReader();
                //if (reader.Read())
                //{
                //    string state = reader["state"].ToString();
                //    int pixel_count = (int)reader["pixel_count"];
                //}
            }
            catch
            {
                Response.Write("Some error");
            }
            finally
            {
                con.Close();
            }
        }

        public DataTable DisplayRecord(string query)
        {
            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter Adp = new SqlDataAdapter(query, con);
            DataTable Dt = new DataTable();
            Adp.Fill(Dt);
            GridView1.DataSource = Dt;
            GridView1.DataBind();
            con.Close();
            return Dt;
        }
    }
}