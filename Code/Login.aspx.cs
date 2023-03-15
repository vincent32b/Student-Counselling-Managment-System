using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace FYPSystem.Code
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (conn.State == ConnectionState.Closed)
                {

                    // SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HalloweenConnStr"].ConnectionString);
                    conn.Open();
                    SqlCommand com = new SqlCommand("SELECT * FROM [Profile] where username='" + txtUsername.Text.Trim() + "'AND password ='" + txtpassword.Text.Trim() + "'", conn);
                    SqlDataReader dr = com.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["username"] = dr.GetValue(0).ToString();

                            if (dr["role"].ToString() == "Admin")
                            {
                                Response.Redirect("AdminHome.aspx");
                            }
                            else
                            {
                                Response.Redirect("StudentHome.aspx");
                            }
                        }
                        

                    }
                    else
                    {
                        lbllabel.Text = "Incorrect Username or Password";
                    }
                }
            }
            catch (Exception ex)
            {

            }
            }
    }
}