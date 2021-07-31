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
    public partial class Feedback : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        string shopname;
        string prdname;
        string orderdate;
        string pickupdate;
        string prdimage;
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
                SqlCommand cmd = new SqlCommand("select * from OrderReceipt where id='" + Session["orderid"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                shopname = dt.Rows[0]["shopname"].ToString();
                prdname = dt.Rows[0]["prdname"].ToString();
                orderdate = dt.Rows[0]["orderdate"].ToString();
                pickupdate = dt.Rows[0]["pickupdate"].ToString();
                prdimage = dt.Rows[0]["prdimage"].ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void updatestatus()
        {
            string status = "delivered";

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE OrderReceipt set status=@status " +
                    "where id=" + Session["orderid"].ToString() + "", con);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.ExecuteNonQuery();
                con.Close();

                products();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnfeedback_Click(object sender, EventArgs e)
        {
            ordered();
        }
        void ordered()
        {

            if (txtfeedback.Text != "" && RadioButtonListRating.SelectedItem != null)
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("INSERT INTO CustomerFeedbacks(prdid,customername,shopname,prdname,prdimage,pickupdate,orderdate,feedbacks,rating) " +
                        "values(@prdid,@customername,@shopname,@prdname,@prdimage,@pickupdate,@orderdate,@feedbacks,@rating)", con);
                    cmd.Parameters.AddWithValue("@prdid", Session["orderid"].ToString());
                    cmd.Parameters.AddWithValue("@customername", Session["fullname"].ToString());
                    cmd.Parameters.AddWithValue("@shopname", shopname);
                    cmd.Parameters.AddWithValue("@prdname", prdname);
                    cmd.Parameters.AddWithValue("@prdimage", prdimage);
                    cmd.Parameters.AddWithValue("@pickupdate", pickupdate);
                    cmd.Parameters.AddWithValue("@orderdate", orderdate);
                    cmd.Parameters.AddWithValue("@feedbacks", txtfeedback.Text.Trim());
                    cmd.Parameters.AddWithValue("@rating", RadioButtonListRating.SelectedItem.Text.Trim());
                    cmd.ExecuteNonQuery();
                    con.Close();
                    updatestatus();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Salamat po sa Feedback!');window.location='../Order Status.aspx';", true);
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Fill-up all Text Field');</script>");
            }
        }
    }
}