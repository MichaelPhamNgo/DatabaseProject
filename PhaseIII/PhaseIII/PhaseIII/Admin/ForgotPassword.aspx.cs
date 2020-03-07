using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace PhaseIII
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.RemoveAll();
            }
        }

        protected void btnResetpassword_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);

            if (txtEmail.Text.Trim().Length == 0)
            {
                lbError.Text = "Input your email, please!!!";
                txtEmail.Focus();
                return;
            }            
            else
            {
                try
                {
                    conn.Open();
                    string email = txtEmail.Text.Trim();

                    SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Users", connectionString);
                    int totalRow = 0;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    totalRow = dt.Rows.Count;

                    for (int i = 0; i < totalRow; i++)
                    {
                        if (dt.Rows[i]["Email"].ToString().Trim() == email)
                        {
                            lbSuccess.Text = "Sent to your mailbox already.";
                        }
                    }
                    lbError.Text = "Username or password is not correct!!!";
                    txtEmail.Focus();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
        }
    }
}