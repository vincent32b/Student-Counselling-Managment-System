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
    public partial class SignUp : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                if (conn.State == ConnectionState.Closed)
                {

                    conn.Open();
                    SqlCommand com = new SqlCommand("INSERT INTO [Profile] (username,password,Name,DOB,Gender,Phone,Email,role) " + "VALUES (@username,@pass,@Name,@DOB,@gender,@phone,@email,@role)", conn);

                    com.Parameters.AddWithValue("@username", txtusername.Text);
                    com.Parameters.AddWithValue("@pass", txtpass.Text);
                    com.Parameters.AddWithValue("@Name", txtFullname.Text);
                    com.Parameters.AddWithValue("@DOB", txtDOB.Text);
                    com.Parameters.AddWithValue("@gender", ddlgender.SelectedValue);
                    com.Parameters.AddWithValue("@phone", txtphone.Text);
                    com.Parameters.AddWithValue("@email", txtemail.Text);
                    com.Parameters.AddWithValue("@role", ddlrole.SelectedValue);



                    com.ExecuteNonQuery();
                    Response.Redirect("Login.aspx");
                    conn.Close();

                }
            }
            catch (Exception ex)
            {
                
            }
        }
    }
}