using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace FYPSystem.Code
{
    public partial class ChangePassword : System.Web.UI.Page
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


                    }
                }

            }

            catch (Exception ex)
            {

            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                if (conn.State == ConnectionState.Closed)
                {

                    conn.Open();
                    String userID = Session["username"].ToString();

                    string UpdateSql = "Update Profile SET password=@pass where username=@username";
                    SqlCommand com = new SqlCommand(UpdateSql, conn);

                    com.Parameters.AddWithValue("@pass", txtpass.Text);
                    com.Parameters.AddWithValue("@username",userID);


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
    }
}