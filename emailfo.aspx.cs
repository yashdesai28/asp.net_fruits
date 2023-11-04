using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace _6semprojectfruits
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DELL\\SQLEXPRESS;Initial Catalog=fruits;Persist Security Info=True;User ID=sa;Password=123");
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack) // If page loads for first time
            {
                // Assign the Session["update"] with unique value
                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
                //=============== Page load code =========================




                //============== End of Page load code ===================
            }

        }



        protected override void OnPreRender(EventArgs e)
        {
            ViewState["update"] = Session["update"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {



            // If page not Refreshed
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {
                //=============== On click event code ========================= 



                all.Value = "";
                emailuse.Value = "";

                string email = foremail.Text;

                if (email == "")
                {
                    all.Value = "1";
                    emailuse.Value = "";

                }
                else
                {
                    all.Value = "";


                    da = new SqlDataAdapter("select * from reg where email='" + email + "'", con);
                    dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count == 0)
                    {
                        emailuse.Value = "1";
                        all.Value = "";
                    }
                    else
                    {

                        Session["forgetemail"] = email;
                        try
                        {
                            Random rnd = new Random();
                            string rmdnumber = (rnd.Next(1000, 9999)).ToString();
                            DateTime now = DateTime.Now;
                            var start = now;

                            Session["time"] = start;
                            Session["otp"] = rmdnumber;



                            string filepath = "E:\\6semprojectfruits\\forgot.html";

                            StreamReader str = new StreamReader(filepath);
                            string MailText = str.ReadToEnd();
                            MailText = MailText.Replace("[otp]", rmdnumber);
                            str.Close();




                            MailMessage mail = new MailMessage();
                            mail.From = new MailAddress("omniiyu2022@gmail.com");
                            mail.To.Add(email);
                            mail.Subject = "forgot-password-Verification";
                            mail.Body = MailText;

                            mail.IsBodyHtml = true;

                            SmtpClient smtp = new SmtpClient();
                            smtp.Host = "smtp.gmail.com";
                            smtp.Port = 587;
                            smtp.UseDefaultCredentials = false;
                            smtp.Credentials = new NetworkCredential("omniiyu2022@gmail.com", "nsumutuneupweefn");
                            smtp.EnableSsl = true;
                            smtp.Send(mail);

                        }
                        catch (Exception ex)
                        {
                            // Log or throw an exception as appropriate for your application
                            Response.Write(ex);
                        }


                        Response.Redirect("otpforgot.aspx");
                    }
                }

                //=============== End of On click event code ==================

                // After the event/ method, again update the session 

                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
            }
            else // If Page Refreshed
            {
                // Do nothing 
            }



        }
    }
}