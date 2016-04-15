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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connstr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(connstr);
            SqlCommand sqlCmnd;
            SqlDataReader sqlReader;

            if (Page.IsPostBack)
            {
                string user_id = userid.Text;
                string paswrd = password.Text;

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
                                Response.Redirect("~/Default.aspx");
                            }

                            //FormsAuthentication.SignOut();
                        }
                        else
                        {
                            login_lbl.Text = "User ID or Password is incorrect";
                        }
                    }
                    else
                    {
                        login_lbl.Text = "No such Employee ID exists";
                    }
                }
                catch (SqlException ex)
                {
                    login_lbl.Text = "<p>Error Code" + ex.Number + ": " + ex.Message + "</p>";
                }
                finally
                {
                    dbConnection.Close();
                }
            }
        }
    }
}