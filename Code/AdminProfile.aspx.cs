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
    public partial class AdminProfile : System.Web.UI.Page
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
                //Response.Write("<script>alert('Session Expired Login Again');</script>");
                //Response.Redirect("Login.aspx");
                lblStatus.Text = "Error:" + ex.ToString();
                lblStatus.ForeColor = System.Drawing.Color.Red;
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
                        txtstudentID.Text = dr["username"].ToString();
                        txtstudentEmail.Text = dr["Email"].ToString();
                        txtstudentGender.Text = dr["Gender"].ToString();
                        string date = dr["DOB"].ToString();
                        txtstudentDOB.Text = date;
                        txtstudentName.Text = dr["Name"].ToString();
                        txtstudentPhone.Text = dr["Phone"].ToString();

                    }
                }

            }
            conn.Close();

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }
    }
}