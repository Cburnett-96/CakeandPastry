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
    public partial class OrderReceipt : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["role"]))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Please Login or Sign Up.');window.location='../Login or Signup.aspx';", true);
            }
            else if (Session["role"].Equals("user") || Session["role"].Equals("shop") || Session["role"].Equals("admin"))
            {
                products();
            }
        }
        void products()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from OrderReceipt where customeremail='"+ Session["email"].ToString() + "' and prdid='" + Session["prdname"].ToString() + "' and shopname='" + Session["name"].ToString() + "' and status='pending';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}