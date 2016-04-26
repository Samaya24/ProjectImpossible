using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FMSC_Project2016
{
    public partial class NewsLetters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
                SqlConnection dbConnection = new SqlConnection(conStr);
                SqlCommand command;
                SqlDataReader reader;
                int count = 0;
                dbConnection.Open();
                string query = string.Empty;
                query = "Select top 1 end_pixel from purchase_user order by end_pixel desc";
                command = new SqlCommand(query, dbConnection);
                reader = command.ExecuteReader();
                if (reader.Read())
                {
                    count = (int)reader["end_pixel"];
                }
                reader.Close();
                Label2.Text = "Hello," + "<br /><br />";
                Label2.Text += "We are happy to annouce that the meals donations has been going good and we are very happy that you could be a part of it." + "<br /><br /><br />";
                Label2.Text += "Donations are going good.So far we have sold : " + "<br />" + "The number of pixels sold:" + count.ToString() + "<br /><br /><br />" + " We would like if you told and shared about our website and the work we are doing with as many people as possible." + "<br /><br />";
                Label2.Text += "We really appreciate the effort." + "<br /><br /><br />";
                Label2.Text += "Regards," + "<br />";
                Label2.Text += "FMSC Organization" + "<br /><br /><br />";
                Label2.Visible = false;
                mailsender(Label2.Text);
            }
        }
        public void mailsender(string s)
        {
            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;
            SqlConnection dbConnection = new SqlConnection(conStr);
            SqlCommand command;
            SqlDataReader reader;
            List<string> email = new List<string>();
            int count = 0;
            //string User_email = string.Empty;
            try
            {
                dbConnection.Open();
                string query = "select user_id from user_details where subscription = 'Yes'";
                command = new SqlCommand(query, dbConnection);
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    email.Add(reader["user_id"].ToString());
                }
                reader.Close();
                
            }
            catch (SqlException ex)
            {
                Label1.Text = "<p>Error Code" + ex.Number + ": " + ex.Message + "</p>";
            }
            finally
            {
                dbConnection.Close();
            }
            
            foreach (string address in email)
            {
                string toAddress = address;
                string s1 = string.Empty;
                s1 += "Click on the link below to unsubscribe" + "<br />";
                s1 += "http://iis.it.ilstu.edu/368Spr16/it3680105/App2/Unsubscribe.aspx?email=" + address;
                s += s1;
                MailAddress messageFrom = new MailAddress("sgonugu@ilstu.edu", "Admin");
                MailMessage emailMessage = new MailMessage();
                emailMessage.From = messageFrom;
                MailAddress messageTo = new MailAddress(address.ToLower());
                emailMessage.To.Add(messageTo.Address);
                emailMessage.Subject = "Thank you for your help";
                string messageText = s.Replace("<br />", Environment.NewLine);
                emailMessage.Body = messageText;
                SmtpClient mailClient = new SmtpClient();
                mailClient.UseDefaultCredentials = true;// false;
                mailClient.Send(emailMessage);
            }
        }
    }
}