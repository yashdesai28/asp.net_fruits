using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace _6semprojectfruits
{
    public partial class forgetpassword : System.Web.UI.Page
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





        }

        protected override void OnPreRender(EventArgs e)
        {
            ViewState["update"] = Session["update"];
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            all.Value = "1";
            vali.Value = "1";


            // If page not Refreshed
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {
                //=============== On click event code ========================= 





                string pass1 = compass1.Text;
                string pass2 = compass2.Text;



                if (pass1 == "" || pass2 == "")
                {
                    all.Value = "1";
                    vali.Value = "";

                }
                else
                {
                    all.Value = "";

                    if (Regex.IsMatch(pass1, @"^(?=.{8,}$)(?=[^A-Z]*[A-Z][^A-Z]*$)\w*\W\w*$") && Regex.IsMatch(pass2, @"^(?=.{8,}$)(?=[^A-Z]*[A-Z][^A-Z]*$)\w*\W\w*$") && pass1 == pass2)
                    {


                        string hashedPassword = "";

                        // create a SHA256 hash object
                        using (SHA256 sha256Hash = SHA256.Create())
                        {
                            // hash the password
                            byte[] bytes = sha256Hash.ComputeHash(System.Text.Encoding.UTF8.GetBytes(pass1));

                            // convert the hash to a string and store it
                            hashedPassword = BitConverter.ToString(bytes).Replace("-", "");
                            Response.Write("Hashed Password: " + hashedPassword);
                        }
                        con.Open();

                        SqlCommand cmd = new SqlCommand("update reg set password='" + hashedPassword + "' where email='" + Session["forgetemail"].ToString() + "'", con);
                        cmd.ExecuteNonQuery();
                        con.Close();


                        try
                        {




                            string filepath = "E:\\6semprojectfruits\\suc.html";

                            StreamReader str = new StreamReader(filepath);
                            string MailText = str.ReadToEnd();





                            MailMessage mail = new MailMessage();
                            mail.From = new MailAddress("omniiyu2022@gmail.com");
                            mail.To.Add(Session["forgetemail"].ToString());
                            mail.Subject = "successful-password-change";
                            mail.Body = MailText;

                            mail.IsBodyHtml = true;

                            SmtpClient smtp = new SmtpClient();
                            smtp.Host = "smtp.gmail.com";
                            smtp.Port = 587;
                            smtp.UseDefaultCredentials = false;
                            smtp.Credentials = new NetworkCredential("omniiyu2022@gmail.com", "nsumutuneupweefn");
                            smtp.EnableSsl = true;
                            smtp.Send(mail);

                            Response.Write("login");
                            Response.Redirect("login.aspx");

                           

                        }
                        catch (Exception ex)
                        {
                            // Log or throw an exception as appropriate for your application
                            Response.Write(ex);
                        }








                    }
                    else
                    {

                        Response.Write("lkjhgf");
                        all.Value = "";
                        vali.Value = "1";
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