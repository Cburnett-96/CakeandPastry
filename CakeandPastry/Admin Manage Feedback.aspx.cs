using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CakeandPastry
{
    public partial class Admin_Manage_Feedback : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["role"]) || Session["role"].Equals("user") || Session["role"].Equals("shop"))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Only Administrator can access');window.location='../';", true);
            }
            else if (Session["role"].Equals("admin"))
            {
                getfeedbacklist();
            }
        }
        void getfeedbacklist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT id AS [Feedback ID], customername AS [Customer Name], feedbacks AS [Customer Feedback], rating AS [Customer Rate], shopname AS [Shop Name], prdname AS [Product Name] from CustomerFeedbacks;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (txtprdid.Text != "")
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from CustomerFeedbacks WHERE id=" + txtprdid.Text.Trim() + "", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Successfully Remove');</script>");
                    getfeedbacklist();
                    txtprdid.Text = "";
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Fill-up');</script>");
            }
        }

    }
}