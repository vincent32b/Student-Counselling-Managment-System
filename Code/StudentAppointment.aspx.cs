using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;

namespace FYPSystem.Code
{
    public partial class StudentAppointment : System.Web.UI.Page
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
            String username= Session["username"].ToString();

            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Appointment WHERE username =  '" + username + "';", conn);

            SqlDataAdapter sda = new SqlDataAdapter();
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {

                    sda.Fill(dt);



                    SqlCommand cmd2 = new SqlCommand("SELECT * FROM Appointment WHERE username = '" + username + "';", conn);

                    SqlDataReader dr = cmd2.ExecuteReader();
                    bool recordfound = dr.Read();
                    lblDate.Text = dr["Date"].ToString();
                    lblSlot.Text = dr["Slot"].ToString();
                    lblLink.Text = dr["Link"].ToString();
                    lblastatus.Text= dr["AAStatus"].ToString();


                }

            }
            conn.Close();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    String username = Session["username"].ToString();

                    // SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HalloweenConnStr"].ConnectionString);
                    conn.Open();
                    SqlCommand com = new SqlCommand("INSERT INTO [Appointment] (Date,Issue,Method,AAShortDes,Slot,username) " + "VALUES (@Date,@Issuea,@Method,@Desc,@Slot,@username)", conn);

                    com.Parameters.AddWithValue("@Date",txtDate.Text);
                    com.Parameters.AddWithValue("@Issuea", ddlissue.SelectedValue);
                    com.Parameters.AddWithValue("@Method", Methodlist.SelectedValue);
                    com.Parameters.AddWithValue("@Desc", txtDesc.Text);
                    com.Parameters.AddWithValue("@Slot", Slotlist.SelectedValue);
                    com.Parameters.AddWithValue("@username", username);




                    int k = com.ExecuteNonQuery();
                    if (k != 0)
                    {
                        lblStatus.Text = "New record added successfully!";
                        lblStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                    else
                    {
                        lblStatus.Text = "Unable to add the new record.";
                        lblStatus.ForeColor = System.Drawing.Color.Red;

                    }
                    conn.Close();

                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error:" + ex.ToString();
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}