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
    public partial class Order_Status : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        string orderID;
        string orderID1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["role"]))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Please Login or Sign Up.');window.location='../Login or Signup.aspx';", true);
            }
            else if (Session["role"].Equals("user") || Session["role"].Equals("shop") || Session["role"].Equals("admin"))
            {
                products();
                products1();
                products2();
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
                SqlCommand cmd = new SqlCommand("select * from OrderReceipt where customeremail='" + Session["email"].ToString() + "' and status='pending';", con);
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
        void products2()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from OrderReceipt where customeremail='" + Session["email"].ToString() + "' and status='confirm';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater3.DataSource = dt;
                Repeater3.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void products1()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from OrderReceipt where customeremail='" + Session["email"].ToString() + "' and status='delivered';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater2.DataSource = dt;
                Repeater2.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btndelivered_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            orderID = (item.FindControl("Label1") as Label).Text;
            Session["orderid"] = orderID;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Product Feedback!');window.location='../Feedback.aspx';", true);
        }

        protected void btnbuyagain_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string PostID = (item.FindControl("Label1") as Label).Text;
            Session["prdname"] = PostID;
            string storename = (item.FindControl("Label2") as Label).Text;
            Session["name"] = storename;
            Response.Redirect("~/Buy Now.aspx");
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            orderID1 = (item.FindControl("Label1") as Label).Text;
            deleteorder();
        }
        void deleteorder()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from OrderReceipt WHERE id=" + orderID1 + "", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully Cancel Order');</script>");
                products();
                products1();
                products2();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}