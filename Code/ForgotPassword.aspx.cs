using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;

namespace FYPSystem.Code
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            String Email = txtemail.Text;
            String pass;
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Profile WHERE Email =  '" + Email + "';", conn);

            SqlDataAdapter sda = new SqlDataAdapter();
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {


                    sda.Fill(dt);



                    SqlCommand cmd2 = new SqlCommand("SELECT * FROM Profile WHERE Email = '" + Email + "';", conn);

                    SqlDataReader dr = cmd2.ExecuteReader();
                    bool recordfound = dr.Read();
                    pass = dr["password"].ToString();

                    string body = "Your password is " + pass + " Thank you ";
                    try
                    {
                        MailMessage mail = new MailMessage();
                        mail.To.Add(Email);
                        mail.From = new MailAddress("i20019214@student.newinti.edu.my");
                        mail.Subject = "Counselling System Change Password";
                        mail.Body = body;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new System.Net.NetworkCredential("i20019214@student.newinti.edu.my", "iu000320060863");
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                        lblStatus.Text = "Email sent, check your mailbox";
                        Response.Write("<script>alert('Check your password in your mailbox')</script>");

                    }
                    catch (Exception ex)
                    {
                        Response.Write("Email Not Found')</script>");
                        lblStatus.Text = "fail";
                    }


                }

            }
            conn.Close();

        

    }
    }
}