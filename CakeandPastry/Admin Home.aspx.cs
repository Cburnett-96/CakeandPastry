using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CakeandPastry
{
    public partial class Admin_Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["role"]) || Session["role"].Equals("user") || Session["role"].Equals("shop"))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Only Administrator can access');window.location='../';", true);
            }
            else if (Session["role"].Equals("admin"))
            {
                Response.Write("<script>alert('Welcome Admin');</script>");
            }
        }

        protected void Imagebtnaccount_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/User Account Management.aspx");
        }

        protected void Imagebtnproduct_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin Manage Product.aspx");
        }

        protected void Imagebtn_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin Manage Feedback.aspx");
        }
    }
}