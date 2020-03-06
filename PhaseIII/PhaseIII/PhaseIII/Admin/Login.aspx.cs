using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace PhaseIII
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.RemoveAll();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email;
            string password;

            email = txtEmail.Text.Trim();
            password = txtPassword.Text.Trim();

            if (email.Length == 0)
            {
                //InputYourEmail.Text = "Input your email, please!!!";
                txtEmail.Focus();
                return;
            } else if (password.Length == 0)
            {
                //InputYourPassword.Text = "Input your password, please!!!";
                txtPassword.Focus();
                return;
            } else
            {
                
                string commandText = "SELECT Count(*) FROM Users WHERE Users.email = '" + email + "' AND password = hashbytes('md5', '" + password + "')";

                Response.Write(commandText);
                
                using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\micha\\source\\repos\\PhaseIII\\PhaseIII\\App_Data\\phaseIII.mdf;Integrated Security=True"))
                {
                    SqlDataAdapter sda = new SqlDataAdapter(commandText, connection);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if(dt.Rows[0][0].ToString() == "1")
                    {
                        Response.Redirect("~/Admin/Service.aspx");
                    }
                }
                //Session["LoginAccount"] =
                //Response.Redirect("~/Admin/Service.aspx");
            }
        }

    }
}