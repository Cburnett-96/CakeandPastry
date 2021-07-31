using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CakeandPastry
{
    public partial class Site_Mobile : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["role"]))
            {
                linkbtnlogin.Visible = true;
                linkbtnshop.Visible = true;
                loginsignup.Visible = true;
                linkbtnlogout.Visible = false;
                linkbtnorderstatus.Visible = false;
                shophome.Visible = false;
                home.Visible = true;
            }
            else if (Session["role"].Equals("user"))
            {
                linkbtnlogin.Visible = false;
                linkbtnshop.Visible = false;
                loginsignup.Visible = false;
                linkbtnlogout.Visible = true;
                linkbtnorderstatus.Visible = true;
                home.Visible = true;
                lblGreeting.Text = "Hello " + (string)Session["fullname"];
            }
            else if (Session["role"].Equals("shop"))
            {
                shophome.Visible = true;
                home.Visible = false;
                linkbtnlogin.Visible = false;
                linkbtnshop.Visible = false;
                loginsignup.Visible = false;
                linkbtnlogout.Visible = true;
                lblGreeting.Text = "Hello " + (string)Session["shopname"];
            }
            else if (Session["role"].Equals("admin"))
            {
                adminhome.Visible = true;
                home.Visible = false;
                linkbtnlogin.Visible = false;
                linkbtnshop.Visible = false;
                loginsignup.Visible = false;
                linkbtnlogout.Visible = true;
                lblGreeting.Text = "Hello " + (string)Session["fullname"];
            }
        }
        protected void linkbtnlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login or Signup.aspx");
        }

        protected void linkbtnshop_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shop Login or Signup.aspx");
        }

        protected void linkbtnlogout_Click(object sender, EventArgs e)
        {
            Session["role"] = null;
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            Response.Redirect("~/");
        }

        protected void linkbtnorderstatus_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Order Status.aspx");
        }
    }
}