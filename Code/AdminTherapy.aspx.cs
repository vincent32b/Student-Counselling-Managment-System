    using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYPSystem.Code
{
    public partial class AdminTherapy : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                btnEdit.Visible = false;
                h2.Visible = false;
                lblID.Visible = false;
                txtTherapyId.Visible = false;
                lblimglink.Visible = false;
                lbltitle.Visible = false;
                txtTherapyTitle.Visible = false;
                lblimage.Visible = false;
                flImage.Visible = false;
                lblMsg.Visible = false;
                lblTest.Visible = false;
                
               // lbldate.Visible = false;
               
                //txtDate.Visible = false;
                txtShort.Visible = false;
                //txtLong.Visible = false;
                lbls.Visible = false;
                //lbll.Visible = false;
                lbllink.Visible = false;
                lblcat.Visible = false;
                ddlissue.Visible = false;
                txtlink.Visible = false;

                BindDataList();
            }

        }

        protected void BindDataList()
        {

            SqlCommand cmd = new SqlCommand("SELECT * FROM Therapy", conn);

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
                    SqlCommand cmd = new SqlCommand("DELETE FROM FAQ  WHERE TherapyId=@ID", connn);

                    cmd.Parameters.AddWithValue("@ID", ID);

                    int rows = cmd.ExecuteNonQuery();

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
                    connn.Open();

                    h2.Visible = true;
                    lblID.Visible = true;
                    txtTherapyId.Visible = true;
                    lblimglink.Visible = true;
                    lbltitle.Visible = true;
                    txtTherapyTitle.Visible = true;
                    lblimage.Visible = true;
                    flImage.Visible = true;
                    lblMsg.Visible = true;
                    lblTest.Visible = true;
                   
                    //lbldate.Visible = true;
                  
                    //txtDate.Visible = true;
                    txtShort.Visible = true;
                  //  txtLong.Visible = true;
                    lbls.Visible = true;
                    //lbll.Visible = true;
                    btnEdit.Visible = true;
                    lbllink.Visible = true;
                    lblcat.Visible = true;
                    ddlissue.Visible = true;
                    txtlink.Visible = true;
                  
                    SqlCommand cmd = new SqlCommand("Select * FROM Therapy where TherapyId=@ID", connn);

                    cmd.Parameters.AddWithValue("@ID", ID);

                    int rows = cmd.ExecuteNonQuery();
                    SqlDataReader dr = cmd.ExecuteReader();
                    bool recordfound = dr.Read();
                    txtTherapyId.Text = dr["TherapyId"].ToString();
                    txtTherapyTitle.Text = dr["TherapyTitle"].ToString();
                    //txtDate.ToString() = 
                    //txtTime. = dr["FAQDes"].ToString();
                    txtShort.Text = dr["TherapyDesc"].ToString();
                    //txtLong.Text = dr["TherapyLongDesc"].ToString();
                    ddlissue.SelectedValue= dr["TherapyCat"].ToString();
                    txtlink.Text= dr["TherapyLink"].ToString();

                    connn.Close();
                    BindDataList();
                }
                catch (Exception ex)
                {
                    Exception E = ex;
                }

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                    if (FileUpload1.PostedFile != null)
                    {
                        if (FileUpload1.PostedFile.ContentLength < 1024000)
                        {
                            string imgfile = System.IO.Path.GetFileName(FileUpload1.FileName);
                            FileUpload1.SaveAs(Server.MapPath("~/image/") + imgfile);
                            // SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HalloweenConnStr"].ConnectionString);
                            
                            SqlCommand com = new SqlCommand("INSERT INTO [Therapy] (TherapyTitle,TherapyDateUpload,TherapyDesc,TherapyImg,TherapyLink,TherapyCat) " + "VALUES (@TT,@TD,@TDesc,@Image,@Link,@Cat)", conn);


                            com.Parameters.AddWithValue("@TT", TextBox2.Text);
                            com.Parameters.AddWithValue("@Image", ("../image" + @"/" + imgfile));
                            com.Parameters.AddWithValue("@TD", TextBox3.Text);
                            com.Parameters.AddWithValue("@TDesc", TextBox4.Text);
                            //com.Parameters.AddWithValue("@TLDesc", TextBox5.Text);
                            com.Parameters.AddWithValue("@Link", TextBox6.Text);
                            com.Parameters.AddWithValue("@Cat", DropDownList1.SelectedValue);

                            

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
                            BindDataList();
                            conn.Close();

                        }
                    }
                    else
                    {
                        lblTest.Text = "File is too big.";
                    }
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
            int ID = Int32.Parse(txtTherapyId.Text);



            string UpdateSql = "Update Therapy SET TherapyTitle=@TT,TherapyDesc=@TDesc,TherapyLongDesc=@TLDesc, TherapyLink=@L,TherapyCat=@Cat where TherapyID=@ID";
            SqlCommand com = new SqlCommand(UpdateSql, conn);
            {
                try
                {
                    //Name @ProdName, ShortDescription = @shortDes,
                    //LongDescription = @longDes, CategoryID@CatID,
                    //UnitPrice = @price, OnHand = @onHand WHERE ProductID = @prodId

                    com.Parameters.AddWithValue("@TT", txtTherapyTitle.Text);

                    com.Parameters.AddWithValue("@L", txtlink.Text);

                    com.Parameters.AddWithValue("@Cat", ddlissue.SelectedValue);
                    //com.Parameters.AddWithValue("@TD", txtDate.ToString());
                    com.Parameters.AddWithValue("@TDesc", txtShort.Text);
                    //com.Parameters.AddWithValue("@TLDesc", txtLong.Text);
                    com.Parameters.AddWithValue("@ID", ID);



                    com.ExecuteNonQuery();


                    BindDataList();
                    lblStatus.Text = "New record added successfully!";
                    lblStatus.ForeColor = System.Drawing.Color.CornflowerBlue;
                    Response.Write("<script>alert('Record updated successfully!')</script>");


                }
                catch (Exception ex)
                {
                    Exception E = ex;
                      lblStatus.Text = "Error:" + ex.ToString();
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
                com.Dispose();//release any "unmanaged" resources
                conn.Close();
            }
        }
    }
}