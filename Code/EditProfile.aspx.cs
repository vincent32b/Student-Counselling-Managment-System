using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;

namespace FYPSystem.Code
{
    public partial class EditProfile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"] == null)
                {

                    Response.Redirect("Login.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        Bindbind();
                    }
                }

            }

            catch (Exception ex)
            {

            }
        }
        private void Bindbind()
        {

            String userID = Session["username"].ToString();
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Profile WHERE username = '" + userID + "';", conn);

            SqlDataAdapter sda = new SqlDataAdapter();
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    if (userID != null)
                    {

                        sda.Fill(dt);



                        SqlCommand cmd2 = new SqlCommand("SELECT * FROM Profile WHERE username = '" + userID + "';", conn);

                        SqlDataReader dr = cmd2.ExecuteReader();
                        bool recordfound = dr.Read();
                        txtusername.Text = dr["username"].ToString();
                        txtemail.Text = dr["Email"].ToString();
                        ddlgender.SelectedValue = dr["Gender"].ToString();
                        string date = dr["DOB"].ToString();
                        txtDOB.Text = date;
                        txtFullname.Text = dr["Name"].ToString();
                        txtphone.Text = dr["Phone"].ToString();

                    }
                }

            }
            conn.Close();

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            try
            {
                if (conn.State == ConnectionState.Closed)
                {

                    conn.Open();
                    String userID = Session["username"].ToString();

                    string UpdateSql = "Update Profile SET Name=@name,DOB=@DOB,Gender=@gender,Phone=@phone,Email=@email where username=@username";
                    SqlCommand com = new SqlCommand(UpdateSql, conn);

                    com.Parameters.AddWithValue("@username", userID);

                    com.Parameters.AddWithValue("@Name", txtFullname.Text);
                    com.Parameters.AddWithValue("@DOB", txtDOB.Text);
                    com.Parameters.AddWithValue("@gender", ddlgender.SelectedValue);
                    com.Parameters.AddWithValue("@phone", txtphone.Text);
                    com.Parameters.AddWithValue("@email", txtemail.Text);


                    com.ExecuteNonQuery();
                    Response.Write("<script>alert('Record updated successfully!')</script>");


                    com.ExecuteNonQuery();

                    conn.Close();

                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }
    }
}