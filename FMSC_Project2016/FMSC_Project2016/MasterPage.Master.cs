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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connstr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(connstr);
            SqlCommand sqlCmnd;
            SqlDataReader sqlReader;

            if (Page.IsPostBack)
            {
                string user_id = Request.Form["username"];
                string paswrd = Request.Form["password"];

                try
                {
                    dbConnection.Open();
                    string info = "SELECT * FROM user_login_details WHERE USER_ID = '" + user_id.Trim() + "';";
                    sqlCmnd = new SqlCommand(info, dbConnection);
                    sqlReader = sqlCmnd.ExecuteReader();

                    //checking if login id and password are correct
                    if (sqlReader.Read())
                    {

                        if (sqlReader["user_id"].Equals(user_id) && sqlReader["PASSWORD"].Equals(paswrd))
                        {
                            //HttpCookie employee_id = new HttpCookie("userName");
                            //employee_id.Value = user_id;
                            //employee_id.Expires = DateTime.Now.AddMinutes(2);
                            //Response.Cookies.Add(employee_id);

                            FormsAuthentication.SetAuthCookie(user_id, false);
                            //if admin then change the page
                            if (sqlReader["user_id"].Equals("admin"))
                            {
                                Response.Redirect("~/Admin/Admin.aspx");
                            }
                            //if any other id then go to home page
                            else
                            {
                                Session["currentUser"] = user_id;
                                Response.Redirect("~/DonateMeal.aspx");
                            }

                            //FormsAuthentication.SignOut();
                        }
                        else
                        {
                            Request.Form["errorMessage"] = "User ID or Password is incorrect";
                            Response.Redirect("~/Signup.aspx");
                        }
                    }
                    else
                    {
                        Request.Form["errorMessage"] = "No such Employee ID exists";
                        Response.Redirect("~/DonateMeal.aspx");
                    }
                }
                catch (SqlException ex)
                {
                    Request.Form["errorMessage"] = "<p>Error Code" + ex.Number + ": " + ex.Message + "</p>";
                }
                finally
                {
                    dbConnection.Close();
                }
            }
        }
    }
}
