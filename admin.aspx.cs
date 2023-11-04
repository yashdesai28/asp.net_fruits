using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _6semprojectfruits
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=DELL\\SQLEXPRESS;Initial Catalog=fruits;Persist Security Info=True;User ID=sa;Password=123");
        protected void Page_Load(object sender, EventArgs e)
        {
            string y = "yashdesai281@gmail.com";

            con.Open();

            SqlCommand cmd = new SqlCommand("select * from reg where email='"+y+"'",con);
            SqlDataReader rd = cmd.ExecuteReader();

            while (rd.Read())
            {
                fullname.Text = rd.GetString(1);
                email.Text = rd.GetString(3);
                int v= Convert.ToInt32(rd.GetValue(4));
                number.Text = v.ToString();

            }

            con.Close();



        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Write("hello");
            Response.Redirect("login.aspx");
        }
    }
}