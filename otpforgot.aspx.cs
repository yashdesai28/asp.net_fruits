using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.IO;

namespace _6semprojectfruits
{
    public partial class otpforgot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["forgetemail"].ToString();


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

        protected void otpsub_Click(object sender, EventArgs e)
        {





            // If page not Refreshed
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {
                //=============== On click event code ========================= 




                Response.Write(Session["forgetemail"]);



                var start = DateTime.Now;
                var old = DateTime.Parse(Session["time"].ToString());
                if (start.Subtract(old) >= TimeSpan.FromMinutes(1))
                {
                    Response.Write("out");
                }
                else
                {


                    int otp = Convert.ToInt32(popotp.Text);
                    int oldotp = Convert.ToInt32(Session["otp"]);

                    Response.Write(" 1 mits unber");
                    if (oldotp == otp)
                    {

                        Response.Redirect("forgetpassword.aspx");

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

        protected void Button2_Click(object sender, EventArgs e)
        {




            // If page not Refreshed
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {
                //=============== On click event code ========================= 


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
                    mail.To.Add(Session["forgetemail"].ToString());
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