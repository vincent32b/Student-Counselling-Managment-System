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
    public partial class AdminFAQM : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblan.Visible = false;
                lblbid.Visible = false;
                idmo.Visible = false;
                lblq.Visible = false;
                txtFAQId.Visible = false;
                txtFAQQ.Visible = false;
                txtFAQanswer.Visible = false;
                btnEdit.Visible = false;
                BindDataList();
            }
        }
        protected void BindDataList()
        {

            SqlCommand cmd = new SqlCommand("SELECT * FROM FAQ", conn);

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
            lblStatus.Text = "Cannot";
            try
            {
                if (conn.State == ConnectionState.Closed)
                {

                    // SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["HalloweenConnStr"].ConnectionString);
                    conn.Open();
                    SqlCommand com = new SqlCommand("INSERT INTO [FAQ] (FAQTitle,FAQDes) " + "VALUES (@FAQTitle,@fDes)", conn);

                    com.Parameters.AddWithValue("@FAQTitle", TextBox2.Text);
                    com.Parameters.AddWithValue("@fDes", TextBox3.Text);



                    int k = com.ExecuteNonQuery();
                    if (k != 0)
                    {
                        BindDataList();
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

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            conn.Open();
            int ID = Int32.Parse(txtFAQId.Text);

            string UpdateSql = "Update FAQ SET FAQTitle=@Title,FAQDes=@Des where FAQId=@FAQID";
            SqlCommand com = new SqlCommand(UpdateSql, conn);
            {
                try
                {
                    //Name @ProdName, ShortDescription = @shortDes,
                    //LongDescription = @longDes, CategoryID@CatID,
                    //UnitPrice = @price, OnHand = @onHand WHERE ProductID = @prodId

                    com.Parameters.AddWithValue("@Title", txtFAQQ.Text);
                    com.Parameters.AddWithValue("@Des", txtFAQanswer.Text);
                    com.Parameters.AddWithValue("@FAQID", ID);


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
            int FAQID = Convert.ToInt32(e.CommandArgument);
            int DetailsQuantity = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Remove")
            {
                try
                {
                    connn.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM FAQ  WHERE FAQId=@FAQID", connn);

                    cmd.Parameters.AddWithValue("@FAQID", FAQID);

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
                    lblan.Visible = true;
                    lblbid.Visible = true;
                    idmo.Visible = true;
                    lblq.Visible = true;
                    txtFAQId.Visible = true;
                    txtFAQQ.Visible = true;
                    txtFAQanswer.Visible = true;
                    btnEdit.Visible = true;
                    connn.Open();
                    SqlCommand cmd = new SqlCommand("Select * FROM FAQ where FAQId=@FAQID", connn);

                    cmd.Parameters.AddWithValue("@FAQID", FAQID);

                    int rows = cmd.ExecuteNonQuery();
                    SqlDataReader dr = cmd.ExecuteReader();
                    bool recordfound = dr.Read();
                    txtFAQId.Text = dr["FAQId"].ToString();
                    txtFAQQ.Text = dr["FAQTitle"].ToString();
                    txtFAQanswer.Text = dr["FAQDes"].ToString();

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