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
    public partial class StudentTherapy : System.Web.UI.Page
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
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Therapy where TherapyCat='General'", conn);

            SqlDataAdapter sda = new SqlDataAdapter();
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;
               
                using (DataTable dt = new DataTable())
                {


                    sda.Fill(dt);
                    Dl1.DataSource = dt;
                    Dl1.DataBind();
                 



                }

            }
            conn.Close();
        }


        protected void Dl1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            int ID = Convert.ToInt32(e.CommandArgument);
            int DetailsQuantity = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Read")
            {
                try
                {
                    connn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Therapy  WHERE TherapyId=@ID", connn);

                    cmd.Parameters.AddWithValue("@ID", ID);
                   
                    int rows = cmd.ExecuteNonQuery();
                    SqlDataReader dr = cmd.ExecuteReader();
                    bool recordfound = dr.Read();
                    lblTitle.Text = dr["TherapyTitle"].ToString();
                    //lblLong.Text = dr["TherapyLongDesc"].ToString();
                    lblcat.Text = dr["TherapyCat"].ToString();
                 
                    string link = "https://www.youtube.com/embed/"+ dr["TherapyLink"].ToString();
                    
                    var videoFrame = new Literal();
                    videoFrame.Text = string.Format(@"<iframe width=""628"" height=""374"" src=""{0}"" frameborder=""0"" allowfullscreen></iframe>", link);
                    Panel1.Controls.Add(videoFrame);


                    connn.Close();
                   
                }
                catch (Exception ex)
                {
                    Exception E = ex;
                }

            }
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Therapy where TherapyCat='Mental'", conn);

            SqlDataAdapter sda = new SqlDataAdapter();
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;

                using (DataTable dt = new DataTable())
                {


                    sda.Fill(dt);
                    Dl1.DataSource = dt;
                    Dl1.DataBind();




                }

            }
            conn.Close();
        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Therapy where TherapyCat='Physical'", conn);

            SqlDataAdapter sda = new SqlDataAdapter();
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;

                using (DataTable dt = new DataTable())
                {


                    sda.Fill(dt);
                    Dl1.DataSource = dt;
                    Dl1.DataBind();




                }

            }
            conn.Close();
        }
    }
}