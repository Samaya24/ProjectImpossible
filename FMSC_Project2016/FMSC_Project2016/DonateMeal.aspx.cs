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
    public partial class DonateMeal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    MultiView1.ActiveViewIndex = 0;
                    noOfPixels.Items.AddRange(Enumerable.Range(1, 1000).Select(en => new ListItem((en*10).ToString())).ToArray());
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (noOfPixels.SelectedItem.Equals(null))
            {
                Label1.Text = "Please select a value first";
            }
            else
            {
                MultiView1.ActiveViewIndex = 1;
                pixel_quantity.Text = noOfPixels.SelectedItem.Text;
                meals_quantity.Text = noOfPixels.SelectedItem.Text;
                double i = ((Convert.ToInt32(noOfPixels.SelectedItem.Text)) * 0.22);
                Total.Text = "$" + i.ToString();
                Session["total_price"] = i;

                string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;

                SqlConnection dbConnection = new SqlConnection(conStr);
                SqlCommand sqlcommand;
                SqlDataReader reader;

                string query = "Select top 1 end_pixel from purchase_user order by end_pixel desc;";
                try
                {
                    dbConnection.Open();
                    sqlcommand = new SqlCommand(query, dbConnection);
                    reader = sqlcommand.ExecuteReader();

                    if (reader.Read())
                    {
                        Session["end_pixel_count"] = reader["end_pixel"];
                    }
                    else
                    {
                        Session["end_pixel_count"] = 0;
                    }
                    Session["noOfPixels"] = noOfPixels.SelectedItem.Text;
                }
                catch(SqlException ex)
                {
                    Label2.Text = (" < p > Error code " + ex.Number
                        + ": " + ex.Message + "</p>"); ;
                }
                finally
                {
                    dbConnection.Close();
                }
            }
        }
    }
}