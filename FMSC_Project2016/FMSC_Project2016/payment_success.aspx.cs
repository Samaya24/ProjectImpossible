using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FMSC_Project2016
{
    public partial class payment_success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                form1.Visible = false;
                Label2.Text = "You do not have permissions to access this page.";
            }
            else
            {
                labelSteps_1_2.Text = "<a name=\"fb_share\" type=\"button\"></a>" +
                            "<script src=\"http://static.ak.fbcdn.net/connect.php/js/FB.Share\" " +
                            "type=\"text/javascript\"></script>";
                HtmlMeta tag = new HtmlMeta();
                tag.Name = "title";
                tag.Content = "This is the Title";
                Page.Header.Controls.Add(tag);
                HtmlMeta tag1 = new HtmlMeta();
                tag.Name = "description";
                tag.Content = "Thank you for your courtosey, Please take your time to share ";
                Page.Header.Controls.Add(tag);
                HtmlLink link = new HtmlLink();

                link.Href = "http://www.murrayhilltech.com/images/LogoColorNoText.jpg";
                link.Attributes["rel"] = "image_src";
                Page.Header.Controls.Add(link);

                if (!IsPostBack)
                {
                    string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
                    SqlConnection dbConnection = new SqlConnection(conStr);
                    SqlCommand sqlcommand;
                    SqlDataReader sqlreader;
                    string username = User.Identity.Name;
                    try
                    {
                        dbConnection.Open();
                        string query = "SELECT * FROM USER_DETAILS WHERE USER_ID = '" + username + "';";
                        sqlcommand = new SqlCommand(query, dbConnection);
                        sqlreader = sqlcommand.ExecuteReader();
                        int start_pixel = (int)Session["end_pixel_count"] + 1;
                        int pixel = Convert.ToInt32((string)Session["noOfPixels"]);
                        int end_pixel = start_pixel + pixel;
                        if (sqlreader.Read())
                        {
                            query = string.Empty;
                            query = "INSERT INTO PURCHASE_USER VALUES ('" + username + "','" +
                                    ((string)Session["noOfPixels"]) + "','" +
                                    sqlreader["first_name"] + " " + sqlreader["last_name"] + "'," + start_pixel.ToString() + "," + end_pixel.ToString() + ");SELECT CAST(scope_identity() AS int)";

                            sqlcommand = new SqlCommand(query, dbConnection);
                            sqlreader.Close();
                            int number = (int)sqlcommand.ExecuteScalar();
                            Session["number"] = number;
                            if (number != 0)
                            {
                                sqlreader.Close();
                                query = string.Empty;
                                query = "SELECT REGISTERED_NAME FROM PURCHASE_USER WHERE PURCHASE_ID = '" + number + "';";
                                sqlcommand = new SqlCommand(query, dbConnection);
                                sqlreader = sqlcommand.ExecuteReader();
                                if (sqlreader.Read())
                                {
                                    Print_name.Text = sqlreader["REGISTERED_NAME"].ToString();

                                }
                                else
                                {
                                    Print_name.Text = "Something went wrong you stupid";
                                }
                            }
                            else
                            {
                                Print_name.Text = "Something went wrong you stupid";
                            }
                        }
                        else
                        {
                            Print_name.Text = "Something went wrong you stupid";
                        }
                    }
                    catch (SqlException ex)
                    {
                        Label1.Text = (" < p > Error code " + ex.Number
                            + ": " + ex.Message + "</p>");
                    }
                    finally
                    {
                        dbConnection.Close();
                    }
                }
            }
             
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                Panel1.Visible = true;
            }
            else
            {
                Panel1.Visible = false;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conStr);
            SqlCommand sqlcommand;
            // SqlDataReader reader;
            string query;

            try
            {
                dbConnection.Open();
                int number = (int)Session["number"];
                query = "UPDATE PURCHASE_USER SET REGISTERED_NAME = '" + update_name.Text + "' WHERE PURCHASE_ID =" + number + ";";
                sqlcommand = new SqlCommand(query, dbConnection);
                int count = sqlcommand.ExecuteNonQuery();
                if (count != 0)
                {
                    Panel1.Visible = false;
                    Print_name.Text = update_name.Text;
                    CheckBox1.Checked = false;
                }
            }
            catch (SqlException ex)
            {
                Label1.Text = (" < p > Error code " + ex.Number
                        + ": " + ex.Message + "</p>");
            }
            finally
            {
                dbConnection.Close();
            }
        }
    }
}