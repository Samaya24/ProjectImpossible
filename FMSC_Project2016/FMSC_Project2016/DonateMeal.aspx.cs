using System;
using System.Collections.Generic;
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
                Total.Text = "$" + i.ToString();
                Session["total_price"] = i;
                Session["noOfPixels"] = noOfPixels.SelectedItem.Text;

            }
        }
    }
}