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
    public partial class StudentProfile : System.Web.UI.Page
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
            //try
            //{
            //    if (conn.State == ConnectionState.Closed)
            //    {

            //        // SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HalloweenConnStr"].ConnectionString);
            //        conn.Open();
            //        SqlCommand com = new SqlCommand("INSERT INTO [StudentProfile](StudentId,StudentName,StudentCourse,StudentDOB,StudentAge,StudentGrade,StudentGender,StudentPhone,StudentEmail,StudentAddress,StudentPos,StudentCity,StudentPass) " +
            //                                                                "VALUES (@sID,@sName,@sCourse,@sDOB,@sAge,@sGrade,@sGender,@sPhone,@sEmail,@sAddress,@sPos,@sCity,@sPass)", conn);
            //        //@prodID,@prodName,@shortDesc,@longDesc,@ddlCat,@Price, @onHand
            //        com.Parameters.AddWithValue("@sID", txtstudentID.Text);
            //        com.Parameters.AddWithValue("@sName", txtstudentName.Text);
            //        com.Parameters.AddWithValue("@sCourse", txtstudentCourse.Text);
            //        com.Parameters.AddWithValue("@sDOB", txtstudentDOB.Text);
            //        com.Parameters.AddWithValue("@sAge", txtstudentAge.Text);
            //        com.Parameters.AddWithValue("@sGrade", txtstudentGrade.Text);
            //        com.Parameters.AddWithValue("@sGender", txtstudentGender.Text);
            //        com.Parameters.AddWithValue("@sPhone", txtstudentPhone.Text);
            //        com.Parameters.AddWithValue("@sEmail", txtstudentEmail.Text);
            //        com.Parameters.AddWithValue("@sAddress", txtstudentAddress.Text);
            //        com.Parameters.AddWithValue("@sPos", txtstudentPoscode.Text);
            //        com.Parameters.AddWithValue("@sCity", txtstudentCity.Text);
            //        com.Parameters.AddWithValue("@sPass", txtstudentPass.Text);

            //        int k = com.ExecuteNonQuery();
            //        if (k != 0)
            //        {
            //            lblStatus.Text = "New record added successfully!";
            //            lblStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
            //        }
            //        else
            //        {
            //            lblStatus.Text = "Unable to add the new record.";
            //            lblStatus.ForeColor = System.Drawing.Color.Red;

            //        }
            //        conn.Close();

            //    }
            //}
            //catch (Exception ex)
            //{
            //    lblStatus.Text = "Error:" + ex.ToString();
            //    lblStatus.ForeColor = System.Drawing.Color.Red;
            //}

        }
    }
}