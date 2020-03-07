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
            if (!IsPostBack)
            {
                Session.RemoveAll();
            }
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
                        SqlCommand comm = new SqlCommand();
                        string fname = txtFName.Text.Trim();
                        string lname = txtLName.Text.Trim();
                        string email = txtEmail.Text.Trim();
                        string password = MD5Hash(txtPassword.Text.Trim());

                        // creating instance of SsqlParameter
                        SqlParameter parFname = new SqlParameter("@FName", SqlDbType.VarChar);
                        SqlParameter parLname = new SqlParameter("@LName", SqlDbType.VarChar);
                        SqlParameter parEmail = new SqlParameter("@Email", SqlDbType.VarChar);
                        SqlParameter parPass = new SqlParameter("@Password", SqlDbType.VarChar);
                        SqlParameter parSalt = new SqlParameter("@Salt", SqlDbType.VarChar);
                        SqlParameter parPhone = new SqlParameter("@Phone", SqlDbType.VarChar);
                        SqlParameter parGroupId = new SqlParameter("@GroupId", SqlDbType.Int);


                        // Adding parameter to SqlCommand
                        comm.Parameters.Add(parFname);
                        comm.Parameters.Add(parLname);
                        comm.Parameters.Add(parEmail);
                        comm.Parameters.Add(parPass);
                        comm.Parameters.Add(parSalt);
                        comm.Parameters.Add(parPhone);
                        comm.Parameters.Add(parGroupId);

                        // Setting values
                        parFname.Value = fname;
                        parLname.Value = lname;
                        parEmail.Value = email;
                        parPass.Value = password;
                        parSalt.Value = MD5Hash(DateTime.Now.ToString("hh:mm:ss"));
                        parPhone.Value = "000-000-0000";
                        parGroupId.Value = 1;

                        // adding connection to SqlCommand
                        comm.Connection = conn;

                        // Sql Statement
                        comm.CommandText = "insert into Users(FName, LName, Email, Password, Salt, Phone, GroupId) values(@FName,@LName,@Email,@Password,@Salt,@Phone,@GroupId)";
                        comm.ExecuteNonQuery();

                        lbSuccess.Text = "Create new account successful";
                        txtFName.Text = "";
                        txtLName.Text = "";
                        txtPassword.Text = "";
                        txtConfirmpassword.Text = "";
                        txtEmail.Text = "";
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