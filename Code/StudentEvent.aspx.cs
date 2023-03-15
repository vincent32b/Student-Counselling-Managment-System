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
    public partial class StudentEvent : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("SELECT * FROM Event", conn);

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
            int EventId = Convert.ToInt32(e.CommandArgument);
            int DetailsQuantity = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Read")
            {
                try
                {
                    connn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM EVENT  WHERE EventId=@EventID", connn);

                    cmd.Parameters.AddWithValue("@EventID", EventId);

                    int rows = cmd.ExecuteNonQuery();
                    SqlDataReader dr = cmd.ExecuteReader();
                    bool recordfound = dr.Read();
                    lblName.Text = dr["EventName"].ToString();
                    lblDate.Text = dr["EventDate"].ToString();
                    lblTime.Text = dr["EventTime"].ToString();
                    lblVenue.Text = dr["EventVenue"].ToString();
                    lblDes.Text = dr["EventDesc"].ToString();
                    lblimage.ImageUrl= dr["EventImg"].ToString();
                    //lbllongDes.Text = dr["EventLongDesc"].ToString();

                    connn.Close();
                    BindDataList();
                }
                catch (Exception ex)
                {
                    Exception E = ex;
                }

            }
        }
    }
}