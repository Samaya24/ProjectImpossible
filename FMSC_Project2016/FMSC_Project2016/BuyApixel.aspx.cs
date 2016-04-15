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
    public partial class BuyApixel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                noOfPixels.Items.AddRange(Enumerable.Range(10, 100).Select(en => new ListItem(en.ToString())).ToArray());
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
                Total.Text ="$" + i.ToString();
                Session["total_price"] = i;
                Session["noOfPixels"] = noOfPixels.SelectedItem.Text;
                
            }
        }

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    if (paypal())
        //    {
        //        string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
        //        SqlConnection dbConnection = new SqlConnection(conStr);
        //        SqlCommand sqlcommand;
        //        SqlDataReader sqlreader;
        //        string username = "srikargr@gmail.com";
        //        try
        //        {
        //            dbConnection.Open();
        //            string query = "SELECT * FROM USER_DETAILS WHERE USER_ID = '" + username + "';";
        //            sqlcommand = new SqlCommand(query, dbConnection);
        //            sqlreader = sqlcommand.ExecuteReader();
        //            if (sqlreader.Read())
        //            {
        //                query = string.Empty;
        //                query = "INSERT INTO PURCHASE_USER VALUES ('" + username + "','" +
        //                        Convert.ToInt32(noOfPixels.SelectedItem.Text) + "','" +
        //                        sqlreader["first_name"] + " " + sqlreader["last_name"] + "',0,0);SELECT CAST(scope_identity() AS int)";

        //                sqlcommand = new SqlCommand(query, dbConnection);
        //                sqlreader.Close();
        //                int number = (int)sqlcommand.ExecuteScalar();
        //                Session["number"] = number;
        //                if (number != 0)
        //                {
        //                    sqlreader.Close();
        //                    query = string.Empty;
        //                    query = "SELECT REGISTERED_NAME FROM PURCHASE_USER WHERE PURCHASE_ID = '" + number + "';";
        //                    sqlcommand = new SqlCommand(query, dbConnection);
        //                    sqlreader = sqlcommand.ExecuteReader();
        //                    if (sqlreader.Read())
        //                    {
        //                        Print_name.Text = sqlreader["REGISTERED_NAME"].ToString();
        //                        MultiView1.ActiveViewIndex = 2;
        //                    }
        //                    else
        //                    {
        //                        Print_name.Text = "Something went wrong you stupid";
        //                    }
        //                }
        //                else
        //                {
        //                   Print_name.Text = "Something went wrong you stupid";
        //                }
        //            }
        //            else
        //            {
        //                Print_name.Text = "Something went wrong you stupid";
        //            }
        //        }
        //        catch(SqlException ex)
        //        {
        //            Label1.Text = (" < p > Error code " + ex.Number
        //                + ": " + ex.Message + "</p>");
        //        }
        //        finally
        //        {
        //            dbConnection.Close();
        //        }
        //    }

        //}

        protected bool paypal()
        {
            return true;
        }

        
    }
}