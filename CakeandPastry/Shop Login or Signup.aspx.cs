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
    public partial class Shop_Login_or_Signup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["role"] = null;
        }
        protected void loginbtn_Click(object sender, EventArgs e)
        {
            // user login
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from ShopAccount where email='" + email.Text.Trim() + "' AND password='" + password.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["email"] = dr.GetValue(2).ToString();
                        Session["shopname"] = dr.GetValue(1).ToString();
                        Session["role"] = "shop";
                        Response.Redirect("Shop Home.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('Member Already Exist with this Member ID, try other ID');</script>");
            }
            else
            {
                //signUpNewMember();
                if (txtname.Text != "" && txtemail.Text != "" && passwordsignup.Text != "" && txtlocation.Text != "")
                {
                    if (FileUpload1.HasFile)
                    {
                        string strimagename = FileUpload1.FileName.ToString();
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + strimagename);
                  try
                    {
                        SqlConnection con = new SqlConnection(strcon);
                        if (con.State == ConnectionState.Closed)
                        {
                            con.Open();
                        }
                        SqlCommand cmd = new SqlCommand("INSERT INTO ShopAccount(shopname,email,password,image,shopaddress,contact) values(@shopname,@email,@password,@image,@shopaddress,@contact)", con);
                        cmd.Parameters.AddWithValue("@shopname", txtname.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", passwordsignup.Text.Trim());
                        cmd.Parameters.AddWithValue("@image", strimagename);
                        cmd.Parameters.AddWithValue("@shopaddress", txtlocation.Text.Trim());
                        cmd.Parameters.AddWithValue("@contact", txtcontact.Text.Trim());
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Write("<script>alert('Sign Up Successful. Go to Login');</script>");
                        email.Text = txtemail.Text;
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
        }
        // user defined method
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from ShopAccount where email='" + txtemail.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
    }
}