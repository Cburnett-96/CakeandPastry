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
    public partial class User_Account_Management : System.Web.UI.Page
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
                getcusacclist();
                ShowShopData();
            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (txtcusemail.Text != "")
            {
                customerdelete();
            }
            else
            {
                Response.Write("<script>alert('Fill-up!');</script>");
            }
        }
        void customerdelete()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from CustomerAccount WHERE id=" + txtcusemail.Text.Trim() + "", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully Remove');</script>");
                getcusacclist();
                txtcusemail.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void getcusacclist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT id AS [Customer ID], email AS [Customer Email], fullname AS [Customer Name] from CustomerAccount;", con);
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

        protected void btnshopdel_Click(object sender, EventArgs e)
        {
            if (txtshopemail.Text != "")
            {
                shopdelete();
            }
            else
            {
                Response.Write("<script>alert('Fill-up!');</script>");
            }
        }
        void shopdelete()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE from ShopAccount WHERE id=" + txtshopemail.Text.Trim() + "", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully Remove');</script>");
                txtshopemail.Text = "";
                ShowShopData();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void ShowShopData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT id AS [Shop ID], email AS [Shop Email], shopname AS [Shop Name], contact AS [Shop Contact], shopaddress AS [Shop Address], shoplocation AS [Shop Google Map Location] from ShopAccount;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            if (txtshopemail.Text != "" && txtlink.Text != "")
            {
                updatelocation();
                ShowShopData();
            }
            else
            {
                Response.Write("<script>alert('Fill-up!');</script>");
            }
        }
        void updatelocation()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE ShopAccount set shoplocation=@shoplocation where id=" + txtshopemail.Text.Trim() + "", con);
                cmd.Parameters.AddWithValue("@shoplocation", txtlink.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Successfully Update');</script>");
                txtshopemail.Text = "";
                txtlink.Text = "";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}