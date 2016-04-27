using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FMSC_Project2016
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblShare.Text = "<a name=\"fb_share\" type=\"button\"></a>" +
                    "<script " +
                    "src=\"http://static.ak.fbcdn.net/connect.php/js/FB.Share\" " +
                    "type=\"text/javascript\"></script>";
            HtmlMeta tag = new HtmlMeta();
            tag.Name = "title";
            tag.Content = "This is the page title";
            Page.Header.Controls.Add(tag);
            HtmlMeta tag1 = new HtmlMeta();
            tag.Name = "description";
            tag.Content = "This is a page description.";
            Page.Header.Controls.Add(tag);
        }
    }
}