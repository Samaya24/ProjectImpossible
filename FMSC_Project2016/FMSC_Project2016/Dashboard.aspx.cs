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
            getPieChartStateStatus();

            try
            {
                con.Open();
                string query = "select b.state_address as states,sum(a.no_of_pixels) as pixel from PURCHASE_USER a join user_details b on a.user_id = b.user_id group by state_address;";
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

        // Pie chart for showing states
        protected void getPieChartStateStatus()
        {
            string query = string.Format("select state_address, sum(no_of_pixels) countPixel from user_details u join purchase_user pu ON u.user_id=pu.user_id group by state_address");

            DataTable dt = GetData(query);


            //Loop and add each datatable row to the Pie Chart Values
            foreach (DataRow row in dt.Rows)
            {
                PieChart1.PieChartValues.Add(new AjaxControlToolkit.PieChartValue
                {
                    Category = row["state_address"].ToString(),
                    Data = Convert.ToDecimal(row["countPixel"])
                });
            }
            PieChart1.Visible = true;
        }

        private static DataTable GetData(string query)
        {
            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conStr);

            dbConnection.Open();
            SqlCommand cmd = dbConnection.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = query;

            cmd.CommandType = CommandType.Text;
            cmd.Connection = dbConnection;

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(dt);
            return dt;
        }
    }
}