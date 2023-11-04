using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;

namespace _6semprojectfruits
{
    public partial class login : System.Web.UI.Page
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



        protected void lemail_TextChanged(object sender, EventArgs e)
        {
           

         


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


                String email = lemail.Text;
                string pass = lpassword.Text;

                string pas = "0";
                string em = "0";



                if (email == "" || pass == "")
                {

                    all.Value = "1";
                    vali.Value = "";


                    Response.Write("okk");
                }
                else
                {
                    all.Value = "";

                    if (Regex.IsMatch(email, @"^[\w!#$%&'*+\-/=?\^_`{|}~]+(\.[\w!#$%&'*+\-/=?\^_`{|}~]+)*@((([\-\w]+\.)+[a-zA-Z]{2,4})|(([0-9]{1,3}\.){3}[0-9]{1,3}))$"))
                    {
                        Response.Write("all done email");
                    }
                    else
                    {


                        em = "1";


                    }

                    if (Regex.IsMatch(pass, @"^(?=.{8,}$)(?=[^A-Z]*[A-Z][^A-Z]*$)\w*\W\w*$"))
                    {
                        Response.Write("/======all password ");


                    }
                    else
                    {
                        pas = "1";
                    }

                    if (pas == "1" || em == "1")
                    {
                        all.Value = "";
                        vali.Value = "1";


                        Response.Write("thayuuuuu");

                    }
                    else
                    {

                        string hashedPassword = "";

                        // create a SHA256 hash object
                        using (SHA256 sha256Hash = SHA256.Create())
                        {
                            // hash the password
                            byte[] bytes = sha256Hash.ComputeHash(System.Text.Encoding.UTF8.GetBytes(pass));

                            // convert the hash to a string and store it
                            hashedPassword = BitConverter.ToString(bytes).Replace("-", "");
                            Response.Write("Hashed Password: " + hashedPassword);
                        }


                        da = new SqlDataAdapter("select * from reg where email='" + email + "' and password='" + hashedPassword + "'", con);
                        dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count == 0)
                        {
                            vali.Value = "1";
                        }
                        else
                        {
                            Response.Redirect("index_2.html");
                        }

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