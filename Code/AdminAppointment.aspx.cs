using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace FYPSystem.Code
{
    public partial class AdminAppointment : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindDataList();
            }
        }
        protected void BindDataList()
        {

            SqlCommand cmd = new SqlCommand("SELECT * FROM Appointment", conn);

            SqlDataAdapter sda = new SqlDataAdapter();
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {

                    //SqlCommand cmd2 = new SqlCommand("SELECT * FROM Appontment", conn);
                    



                    //SqlDataReader dr = cmd2.ExecuteReader();
                    //bool recordfound = dr.Read();
                    //string status =  dr["AAStatus"].ToString();




                    sda.Fill(dt);
                    Dl2.DataSource = dt;
                    Dl2.DataBind();





                }

            }
      
        }

        protected void Dl2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            int ID = Convert.ToInt32(e.CommandArgument);
            

            if (e.CommandName == "Approve")
            {

                conn.Open();


                string UpdateSql = "Update Appointment  SET AAStatus=@ss where Id=@ID";
                SqlCommand com = new SqlCommand(UpdateSql, conn);
                {
                    try
                    {

                        com.Parameters.AddWithValue("@ss", "Approved");
                        com.Parameters.AddWithValue("@ID", ID);


                        com.ExecuteNonQuery();
                        Response.Write("<script>alert('Record updated successfully!')</script>");

                        BindDataList();

                    }
                    catch (Exception ex)
                    {
                        Exception E = ex;
                    }
                    com.Dispose();//release any "unmanaged" resources
                    conn.Close();
                }

            }
            if (e.CommandName == "Reject")
            {

                conn.Open();


                string UpdateSql = "Update Appointment  SET AAStatus=@ss where Id=@ID";
                SqlCommand com = new SqlCommand(UpdateSql, conn);
                {
                    try
                    {

                        com.Parameters.AddWithValue("@ss", "Rejected");
                        com.Parameters.AddWithValue("@ID", ID);


                        com.ExecuteNonQuery();
                        Response.Write("<script>alert('Record updated successfully!')</script>");

                        BindDataList();

                    }
                    catch (Exception ex)
                    {
                        Exception E = ex;
                    }
                    com.Dispose();//release any "unmanaged" resources
                    conn.Close();
                }

            }
            if (e.CommandName == "Link")
            {
                conn.Open();


                string UpdateSql = "Update Appointment  SET Link=@link where Id=@ID";
                SqlCommand com = new SqlCommand(UpdateSql, conn);
                {
                    try
                    {

                        com.Parameters.AddWithValue("@Link", "https://meet.google.com/jpq-kfbw-idt");
                        com.Parameters.AddWithValue("@ID", ID);


                        com.ExecuteNonQuery();
                        Response.Write("<script>alert('Record updated successfully!')</script>");

                        BindDataList();



                    }
                    catch (Exception ex)
                    {
                        Exception E = ex;
                    }
                    com.Dispose();//release any "unmanaged" resources
                    conn.Close();
                }
            }
            if (e.CommandName == "Join")
            {
               
                Response.Redirect("https://meet.google.com/jpq-kfbw-idt");

              
            }


        }

       
    }
}