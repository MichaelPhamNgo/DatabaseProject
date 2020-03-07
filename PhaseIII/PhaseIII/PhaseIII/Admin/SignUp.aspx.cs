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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);

            if (txtEmail.Text.Trim().Length == 0)
            {
                lbError.Text = "Input your email, please!!!";
                txtEmail.Focus();
                return;
            } else if (txtFName.Text.Trim().Length == 0)
            {
                lbError.Text = "Input your first name, please!!!";
                txtFName.Focus();
                return;
            } else if(txtLName.Text.Trim().Length == 0)
            {
                lbError.Text = "Input your last name, please!!!";
                txtLName.Focus();
                return;
            }
            else if (txtPassword.Text.Trim().Length == 0)
            {
                lbError.Text = "Input your password, please!!!";
                txtPassword.Focus();
                return;
            }
            else if (txtConfirmpassword.Text.Trim().Length == 0)
            {
                lbError.Text = "Input your confirm password, please!!!";
                txtPassword.Focus();
                return;
            }
            else
            {
                if(txtPassword.Text.Trim() != txtConfirmpassword.Text.Trim())
                {
                    lbError.Text = "Password and confirm password don't match!!!";
                    txtPassword.Focus();
                    return;
                }
                else
                {
                    try
                    {
                        conn.Open();

                        string fname = txtFName.Text.Trim();
                        string lname = txtLName.Text.Trim();
                        string email = txtEmail.Text.Trim();
                        string password = MD5Hash(txtPassword.Text.Trim());

                        // creating instance of SsqlParameter
                        SqlParameter parFname = new SqlParameter("@FName", SqlDbType.VarChar);
                        SqlParameter parLname = new SqlParameter("@n", SqlDbType.VarChar);
                        SqlParameter parEmail = new SqlParameter("@c", SqlDbType.VarChar);
                        SqlParameter parPass = new SqlParameter("@ci", SqlDbType.VarChar);


                        // Adding parameter to SqlCommand
                        /*
                        comm.Parameters.Add(rollno);
                        comm.Parameters.Add(name);
                        comm.Parameters.Add(course);
                        comm.Parameters.Add(city);
                        */

                        SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Users", connectionString);
                        int totalRow = 0;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        conn.Close();

                        totalRow = dt.Rows.Count;

                        for (int i = 0; i < totalRow; i++)
                        {
                            if (dt.Rows[i]["Email"].ToString().Trim() == email)
                            {
                                if (dt.Rows[i]["Password"].ToString().Trim() == password)
                                {
                                    Session["Email"] = dt.Rows[i]["Email"].ToString().Trim();
                                    Session["Fullname"] = dt.Rows[i]["FName"].ToString().Trim() + " " + dt.Rows[i]["LName"].ToString().Trim();
                                    Session["UserID"] = dt.Rows[i]["UserID"].ToString().Trim();
                                    Response.Redirect("~/Admin/Service.aspx");
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }

                }
            }
            txtFName.Focus();
        }

        private string MD5Hash(string text)
        {
            MD5 md5 = new MD5CryptoServiceProvider();

            //compute hash from the bytes of text  
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));

            //get hash result after compute it  
            byte[] result = md5.Hash;

            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                //change it into 2 hexadecimal digits  
                //for each byte  
                strBuilder.Append(result[i].ToString("x2"));
            }

            return strBuilder.ToString();
        }
    }
}