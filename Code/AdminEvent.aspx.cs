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
    public partial class AdminEvent : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblti.Visible = false;
                    lblid.Visible = false;
                txtEventId.Visible = false;
                lblimglink.Visible = false;
                lbltt.Visible = false;
                txtEventName.Visible = false;
                lblimage.Visible = false;
                flImage.Visible = false;
                lblMsg.Visible = false;
                lblTest.Visible = false;
                lbltime.Visible = false;
                txtTime.Visible = false;
                lbldate.Visible = false;
                txtDate.Visible = false;
                lblv.Visible = false;
                txtVenue.Visible = false;
                txtShort.Visible = false;
                lblshort.Visible = false;
                lbllong.Visible = false;
                txtLong.Visible = false;
                btnEdit.Visible = false;
                BindDataList();
            }
        }
        protected void BindDataList()
        {

            SqlCommand cmd = new SqlCommand("SELECT * FROM Event", conn);

            SqlDataAdapter sda = new SqlDataAdapter();
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {


                    sda.Fill(dt);
                    Dl2.DataSource = dt;
                    Dl2.DataBind();




                }

            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {

                    conn.Open();
                    if (FileUpload1.PostedFile != null)
                    {
                    if (FileUpload1.PostedFile.ContentLength < 1024000)
                    {
                        string imgfile = System.IO.Path.GetFileName(FileUpload1.FileName);
                        FileUpload1.SaveAs(Server.MapPath("~/image/") + imgfile);
                        // SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HalloweenConnStr"].ConnectionString);

                        SqlCommand com = new SqlCommand("INSERT INTO [Event] (EventImg,EventName,EventTime,EventDate,EventVenue,EventDesc,EventLongDesc) " + "VALUES (@EventImg,@EventName,@EventTime,@EventDate,@EventVenue,@EventDesc,@EventLongDesc)", conn);


                        com.Parameters.AddWithValue("@EventName", TextBox2.Text);
                        com.Parameters.AddWithValue("@EventImg", ("../image" + @"/" + imgfile));
                        com.Parameters.AddWithValue("@EventTime", Convert.ToDateTime(TextBox3.Text));
                        com.Parameters.AddWithValue("@EventDate", TextBox4.Text);
                        com.Parameters.AddWithValue("@EventVenue", TextBox5.Text);
                        com.Parameters.AddWithValue("@EventDesc", TextBox6.Text);
                        com.Parameters.AddWithValue("@EventLongDesc", TextBox7.Text);


                        com.ExecuteNonQuery();

                        Response.Write("<script>alert('Record updated successfully!')</script>");
                        BindDataList();

                        lblStatus.Text = "New record added successfully!";
                        lblStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                    }
                    else
                    {
                        Response.Write("<script>alert('Record Not added successfully!')</script>");
                        lblStatus.Text = "Unable to add the new record.";
                        lblStatus.ForeColor = System.Drawing.Color.Red;

                    }
                            conn.Close();

                        
                    }
                    else
                    {
                        lblTest.Text = "File is too big.";
                    }
                }
            
            catch (Exception ex)
            {
                lblStatus.Text = "Error:" + ex.ToString();
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            conn.Open();
            int ID = Int32.Parse(txtEventId.Text);



            string UpdateSql = "Update Event SET EventName=@EN,EventTime=@ET,EventDate@ED,EventVenue=@EV,EventDesc=@ED,EventLongDesc=@ELD where EventId=@ID";
            SqlCommand com = new SqlCommand(UpdateSql, conn);
            {
                try
                {
                    //Name @ProdName, ShortDescription = @shortDes,
                    //LongDescription = @longDes, CategoryID@CatID,
                    //UnitPrice = @price, OnHand = @onHand WHERE ProductID = @prodId
                    com.Parameters.AddWithValue("@EN", txtEventName.Text);

                    com.Parameters.AddWithValue("@ET", Convert.ToDateTime(txtTime.Text));
                    com.Parameters.AddWithValue("@ED", Convert.ToDateTime(txtDate.Text));
                    com.Parameters.AddWithValue("@EV", txtVenue.Text);
                    com.Parameters.AddWithValue("@ED", txtShort.Text);
                    com.Parameters.AddWithValue("@ELD", txtLong.Text);




                    com.ExecuteNonQuery();
                    Response.Write("<script>alert('Record updated successfully!')</script>");

                    lblStatus.Text = "keyi";
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

        protected void Dl2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            SqlConnection connn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            int ID = Convert.ToInt32(e.CommandArgument);
            int DetailsQuantity = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Remove")
            {
                try
                {
                    connn.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM FAQ  WHERE EventId=@ID", connn);

                    cmd.Parameters.AddWithValue("@ID", ID);

                    int rows = cmd.ExecuteNonQuery();
                    BindDataList();
                    connn.Close();
                    BindDataList();
                }
                catch (Exception ex)
                {
                    Exception E = ex;
                }

            }
            if (e.CommandName == "Edit")
            {
                try
                {
                    lblti.Visible = true;
                    lblid.Visible = true;
                    txtEventId.Visible = true;
                    lblimglink.Visible = true;
                    lbltt.Visible = true;
                    txtEventName.Visible = true;
                    lblimage.Visible = true; 
                    flImage.Visible = true;
                    lblMsg.Visible = true;
                    lblTest.Visible = true;
                    lbltime.Visible = true;
                    txtTime.Visible = true;
                    lbldate.Visible = true;
                    txtDate.Visible = true;
                    lblv.Visible = true;
                    txtVenue.Visible = true;
                    txtShort.Visible = true;
                    lblshort.Visible = true;
                    lbllong.Visible = true;
                    txtLong.Visible = true;
                    btnEdit.Visible = true;
                    connn.Open();
                    SqlCommand cmd = new SqlCommand("Select * FROM Event where EventId=@ID", connn);

                    cmd.Parameters.AddWithValue("@ID", ID);

                    int rows = cmd.ExecuteNonQuery();
                    SqlDataReader dr = cmd.ExecuteReader();
                    bool recordfound = dr.Read();

                    txtEventId.Text = dr["EventId"].ToString();
                    txtEventName.Text = dr["EventName"].ToString();

                    txtTime.Text = dr["EventTime"].ToString();
                    txtDate.Text = dr["EventDate"].ToString();
                    txtVenue.Text = dr["EventVenue"].ToString();
                    txtShort.Text = dr["EventDesc"].ToString();
                    txtLong.Text = dr["EventLongDesc"].ToString();


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