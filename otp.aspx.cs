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
using System.Security.Cryptography;



namespace _6semprojectfruits
{
    public partial class otp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DELL\\SQLEXPRESS;Initial Catalog=fruits;Persist Security Info=True;User ID=sa;Password=123");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // If page loads for first time
            {
                // Assign the Session["update"] with unique value
                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
                //=============== Page load code =========================




                //============== End of Page load code ===================
            }


            Response.Write(Session["email"]);
            Response.Write(Session["fname"]);
            Response.Write(Session["lname"]);
            Response.Write(Session["pho"]);
            Response.Write(Session["pass"]);
            Response.Write(Session["time"]);
            Response.Write(Session["otp"]);
            Response.Write(Session["t&c"]);

            sent.Text = Session["email"].ToString();
            
            






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

                        string hashedPassword = "";

                        // create a SHA256 hash object
                        using (SHA256 sha256Hash = SHA256.Create())
                        {
                            // hash the password
                            byte[] bytes = sha256Hash.ComputeHash(System.Text.Encoding.UTF8.GetBytes(Session["pass"].ToString()));

                            // convert the hash to a string and store it
                            hashedPassword = BitConverter.ToString(bytes).Replace("-", "");
                            Response.Write("Hashed Password: " + hashedPassword);
                        }



                        con.Open();
                        SqlCommand cmd = new SqlCommand("INSERT INTO reg(fname,lname,email,phonumber,password,[t&c])values('" + Session["fname"].ToString() + "','" + Session["lname"].ToString() + "','" + Session["email"].ToString() + "','" + Int64.Parse(Session["pho"].ToString()) + "','" + hashedPassword + "','" + Int64.Parse(Session["t&c"].ToString()) + "')", con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        string oemail = Session["email"].ToString();


                        try
                        {




                            string filepath = "E:\\6semprojectfruits\\wlc.html";

                            StreamReader str = new StreamReader(filepath);
                            string MailText = str.ReadToEnd();
                            MailText = MailText.Replace("[fname]", Session["fname"].ToString());
                            str.Close();




                            MailMessage mail = new MailMessage();
                            mail.From = new MailAddress("omniiyu2022@gmail.com");
                            mail.To.Add(oemail);
                            mail.Subject = "Registration-OmniFood";
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

                        Response.Write("login");
                        Response.Redirect("login.aspx");
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

        protected void Button1_Click(object sender, EventArgs e)
        {


            // If page not Refreshed
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {
                //=============== On click event code ========================= 



                string oemail = Session["email"].ToString();


                try
                {
                    Random rnd = new Random();
                    string rmdnumber = (rnd.Next(1000, 9999)).ToString();
                    DateTime now = DateTime.Now;
                    var start = now;

                    Session["time"] = start;
                    Session["otp"] = rmdnumber;



                    string filepath = "E:\\6semprojectfruits\\tem.html";

                    StreamReader str = new StreamReader(filepath);
                    string MailText = str.ReadToEnd();
                    MailText = MailText.Replace("[otp]", rmdnumber);
                    str.Close();




                    MailMessage mail = new MailMessage();
                    mail.From = new MailAddress("omniiyu2022@gmail.com");
                    mail.To.Add(oemail);
                    mail.Subject = "Registration-OmniFood";
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