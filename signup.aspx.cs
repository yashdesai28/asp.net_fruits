using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace _6semprojectfruits
{
    
    public partial class signup : System.Web.UI.Page
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

                Response.Write("one ");


                String rfname = fname.Text;
                String rlname = lname.Text;
                String remail = email.Text;
                String pho = rpho.Text;
                String password1 = pass1.Text;
                String conpass = pass2.Text;

                int chek = 0;

                if (CheckBox1.Checked)
                {
                    chek = 1;
                }
                else
                {
                    chek = 0;
                }




                string em = "0";
                string ph = "0";
                string n = "0";
                string pas = "0";






                if (rfname == "" || rlname == "" || remail == "" || pho == "" || password1 == "" || conpass == "" || chek == 0)
                {

                    all.Value = "1";


                    Response.Write("okk");
                }
                else
                {


                    all.Value = "";

                    if (Regex.IsMatch(remail, @"^[\w!#$%&'*+\-/=?\^_`{|}~]+(\.[\w!#$%&'*+\-/=?\^_`{|}~]+)*@((([\-\w]+\.)+[a-zA-Z]{2,4})|(([0-9]{1,3}\.){3}[0-9]{1,3}))$"))
                    {
                        Response.Write("all done email");
                    }
                    else
                    {


                        em = "1";


                    }


                    if (Regex.IsMatch(rfname, @"^[a-zA-Z]+$") && Regex.IsMatch(rlname, @"^[a-zA-Z]+$"))
                    {
                        Response.Write("all done");
                    }
                    else
                    {
                        n = "1";

                    }



                    if (Regex.IsMatch(pho, "^\\+?[1-9][0-9]{7,14}$"))
                    {
                        Response.Write("/======all done number");
                    }
                    else
                    {

                        ph = "1";


                    }



                    if (Regex.IsMatch(password1, @"^(?=.{8,}$)(?=[^A-Z]*[A-Z][^A-Z]*$)\w*\W\w*$"))
                    {
                        Response.Write("/======all password ");


                    }
                    else
                    {
                        pas = "1";
                    }


                    if (ph == "1" || n == "1" || em == "1" || pas == "1")
                    {

                        all.Value = "";
                        vali.Value = "1";


                        Response.Write("thayuuuuu");

                    }
                    else
                    {


                        da = new SqlDataAdapter("select * from reg where email='" + remail + "'", con);
                        dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count == 0)
                        {
                            Session["email"] = remail;
                            Session["fname"] = rfname;
                            Session["lname"] = rlname;
                            Session["pho"] = pho;
                            Session["pass"] = password1;
                            Session["t&c"] = chek;

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
                                mail.To.Add(remail);
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

                            Response.Write("all is done ");

                            Response.Redirect("otp.aspx");

                        }
                        else
                        {
                            emailuse.Value = "1";
                        }


                    }


                    //  Response.Redirect("otp.aspx");



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
