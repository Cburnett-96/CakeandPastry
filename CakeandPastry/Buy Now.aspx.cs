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
    public partial class Buy_Now : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        string prdid;
        string shopname;
        string shopcontact;
        string shopaddress;
        string prdname;
        string prddesc;
        string prdprice;
        string prdimage;
        string status = "pending";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((string)Session["role"]))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Please Login or Sign Up. To check-out the products');window.location='../Login or Signup.aspx';", true);
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
                SqlCommand cmd = new SqlCommand("select * from ShopProducts, ShopAccount where ShopProducts.id='" + Session["prdname"].ToString() + "' and ShopAccount.shopname='"+ Session["name"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                prdid = dt.Rows[0]["id"].ToString();
                shopname = dt.Rows[0]["shopname"].ToString();
                shopcontact = dt.Rows[0]["contact"].ToString();
                shopaddress = dt.Rows[0]["shopaddress"].ToString();
                prdname = dt.Rows[0]["prdname"].ToString();
                prddesc = dt.Rows[0]["prddesc"].ToString();
                prdprice = dt.Rows[0]["prdprice"].ToString();
                prdimage = dt.Rows[0]["prdimage"].ToString();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void btnbuynow_Click(object sender, EventArgs e)
        {
            ordered();
        }
        void ordered()
        {
            int total = int.Parse(prdprice) * int.Parse(txtqty.Text.Trim());
            
            if (txtadd.Text != "" && txtcpnum.Text != "" && txtpickupdate.Text != "" && txtpickuptime.Text != "" && txtqty.Text != "" && txtorderdate.Text != "")
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("INSERT INTO OrderReceipt(customername,customeremail,customernumber,customeraddress,shopname,shopcontact,shopaddress,prdname,prddesc,prdprice,prdimage,pickupdate,pickuptime,orderdate,status,quantity,total,prdid) " +
                        "values(@customername,@customeremail,@customernumber,@customeraddress,@shopname,@shopcontact,@shopaddress,@prdname,@prddesc,@prdprice,@prdimage,@pickupdate,@pickuptime,@orderdate,@status,@quantity,@total,@prdid)", con);
                    cmd.Parameters.AddWithValue("@customername", Session["fullname"].ToString());
                    cmd.Parameters.AddWithValue("@customeremail", Session["email"].ToString());
                    cmd.Parameters.AddWithValue("@customernumber", txtcpnum.Text.Trim());
                    cmd.Parameters.AddWithValue("@customeraddress", txtadd.Text.Trim());
                    cmd.Parameters.AddWithValue("@shopname", shopname);
                    cmd.Parameters.AddWithValue("@shopcontact", shopcontact);
                    cmd.Parameters.AddWithValue("@shopaddress", shopaddress);
                    cmd.Parameters.AddWithValue("@prdname", prdname);
                    cmd.Parameters.AddWithValue("@prddesc", prddesc);
                    cmd.Parameters.AddWithValue("@prdprice", prdprice);
                    cmd.Parameters.AddWithValue("@prdimage", prdimage);
                    cmd.Parameters.AddWithValue("@pickupdate", txtpickupdate.Text.Trim());
                    cmd.Parameters.AddWithValue("@pickuptime", txtpickuptime.Text.Trim());
                    cmd.Parameters.AddWithValue("@orderdate", txtorderdate.Text.Trim());
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@quantity", txtqty.Text.Trim());
                    cmd.Parameters.AddWithValue("@total", total.ToString());
                    cmd.Parameters.AddWithValue("@prdid", prdid);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Successful Ordered!');window.location='../OrderReceipt.aspx';", true);
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