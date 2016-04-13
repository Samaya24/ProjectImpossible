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
    public partial class Payment_confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
                SqlConnection dbConnection = new SqlConnection(conStr);
                SqlCommand sqlcommand;
                SqlDataReader sqlreader;

                string query = "";
            }
        }
    }
}