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
    public partial class Shop_Home_Page : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"].ToString() != "shop")
                {
                    Response.Redirect("~/");
                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("~/");
            }
            getproductlist();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (prdname.Text != "" && prdprice.Text != "" && prddesc.Text != "")
            {
                if (FileUpload1.HasFile)
                {
                    string strimagename = FileUpload1.FileName.ToString();
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/products/") + strimagename);
                    try
                    {
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        SqlCommand cmd = new SqlCommand("INSERT INTO ShopProducts(prdname,prddesc,prdprice,prdimage,shopname) values(@prdname,@prddesc,@prdprice,@prdimage,@shopname)", con);
                        cmd.Parameters.AddWithValue("@prdname", prdname.Text.Trim());
                        cmd.Parameters.AddWithValue("@prddesc", prddesc.Text.Trim());
                        cmd.Parameters.AddWithValue("@prdprice", prdprice.Text.Trim());
                        cmd.Parameters.AddWithValue("@prdimage", strimagename);
                        cmd.Parameters.AddWithValue("@shopname", Session["shopname"].ToString());
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Successful Submit.');</script>");
                        getproductlist();
                        prdname.Text = "";
                        prddesc.Text = "";
                        prdprice.Text = "";
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Upload the image!!!!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Fill-up all Text Field');</script>");
            }
        }
        void getproductlist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT id AS [Product ID], prdname AS [Product Name], prdprice AS [Product Price] from ShopProducts where shopname='" + Session["shopname"].ToString() + "';", con);
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

                    SqlCommand cmd = new SqlCommand("DELETE from ShopProducts WHERE id=" + txtprdid.Text.Trim() + "", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Successfully Remove');</script>");
                    getproductlist();
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