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
    public partial class Signup : System.Web.UI.Page
    {
        private SMSService textMessage;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                Label1.Text = string.Empty;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;

            SqlConnection dbConnection = new SqlConnection(conStr);
            SqlCommand sqlcommand;
            SqlDataReader sqlreader;

            try
            {
                dbConnection.Open();
                string check = string.Empty;
                if (CheckBox1.Checked)
                {
                    check = "Yes";
                }
                else
                {
                    check = "No";
                }
                string query = "INSERT INTO USER_DETAILS VALuES ('" + email_id.Text + "','" +
                    frst_name.Text + "','" + last_name.Text + "','" + street_address.Text + "','" +
                    city_address.Text + "','" + DropDownListState.SelectedValue.ToUpper() + "','USA','" + pin_address.Text + "','" + phone_num.Text + "','" + check + "','"+DropDownList1.SelectedItem.Text+"');";
                sqlcommand = new SqlCommand(query, dbConnection);
                sqlcommand.ExecuteNonQuery();

                //Activating the password and security question view
                MultiView1.ActiveViewIndex = 1;
                Label1.Text = string.Empty;

            }
            catch(SqlException ex)
            {
                Label1.Text="<p>Error Code" + ex.Number + ": " + ex.Message + "</p>";
            }
            finally
            {
                dbConnection.Close();
            }

            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["projectConnectionString"].ConnectionString;

            SqlConnection dbConnection = new SqlConnection(conStr);
            SqlCommand sqlcommand;
            SqlDataReader sqlreader;

            try
            {
                dbConnection.Open();
                if(!(sec_ques1.SelectedItem.Text.Equals(null) && sec_ques2.SelectedItem.Text.Equals(null) && sec_ques3.SelectedItem.Text.Equals(null)))
                { 

                    string query = "INSERT INTO USER_LOGIN_DETAILS VALUES('" + email_id.Text + "','" +
                                    password.Text + "','" + sec_ques1.SelectedItem.Text + "','" + Answer1.Text + "','" +
                                    sec_ques2.SelectedItem.Text + "','" + Answer2.Text + "','" + sec_ques3.SelectedItem.Text + "','" +
                                    Answer3.Text + "');";
                    sqlcommand = new SqlCommand(query, dbConnection);
                    sqlcommand.ExecuteNonQuery();
                    MultiView1.ActiveViewIndex = 2;

                    //sending a text message
                    string message = "Thank you for signing up. you will be receiving a mail shortly";
                    textMessage = new SMSService(DropDownList1.SelectedItem.Text, phone_num.Text, message);
                    textMessage.SendTextMessage(textMessage);

                    //triggering a mail message
                    string mail_message = "Hello " + frst_name.Text + " " + last_name.Text + "<br /><br /><br />";
                    mail_message += "Welcome to FMSC donate a meal site. We are thankful to you, for taking time out of your schedule and doing something good for the society";
                    mail_message += "<br /><br />" + "We encourage you to donate some meals by buying pixels.";
                    mail_message += "<br /><br />" + "Thank you in advance";
                    mail_message += "<br /><br /><br />" + "Regards," + "<br />";
                    mail_message += "FMSC";

                    //triggering mail
                    mailsender(mail_message);
                }
                else
                {
                    Label1.Text = "Please select a proper security question";
                }
            }
            catch(SqlException ex)
            {
                Label1.Text = "<p>Error Code" + ex.Number + ": " + ex.Message + "</p>";
            }
            finally
            {
                dbConnection.Close();
            }
        }

        public void mailsender(string s)
        {
            string toAddress = email_id.Text;

            MailAddress messageFrom = new MailAddress("sgonugu@ilstu.edu", "Admin");
            MailMessage emailMessage = new MailMessage();
            emailMessage.From = messageFrom;
            MailAddress messageTo = new MailAddress(email_id.Text.ToLower());
            emailMessage.To.Add(messageTo.Address);
            emailMessage.Subject = "Welcome to FMSC donate a meal site.";
            string messageText = s.Replace("<br />", Environment.NewLine);
            emailMessage.Body = messageText;
            SmtpClient mailClient = new SmtpClient();
            mailClient.UseDefaultCredentials = true;// false;
            mailClient.Send(emailMessage);
        }
    }
}