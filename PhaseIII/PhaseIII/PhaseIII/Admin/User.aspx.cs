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
using System.IO;

namespace PhaseIII.Admin
{
    public partial class User : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                gvbind();
            }
        }

        protected void gvbind()
        {
            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT U.UserId AS 'UserId', U.FName AS 'FName', U.LName AS 'LName', U.Email AS 'Email', U.URL" +
                    " AS 'URL', U.Phone AS 'Phone', G.Name AS 'GroupName', Locations.Latitude, Locations.Longtitude  FROM Users AS U JOIN Groups AS G ON U.GroupId = G.GroupId JOIN Locations ON " +
                    "U.CurrentLocation = Locations.LocationId", connectionString);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (!object.Equals(ds, null))
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables[0];
                        GridView1.DataBind();
                    }

                }
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {            
            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT U.UserId, U.FName, U.LName, U.Email, U.URL, U.Phone, G.Name, L.Latitude, L.Longitude FROM Users AS U JOIN Groups AS G ON U.GroupId = G.GroupId JOIN Locations AS L ON U.CurrentLocation = L.LocationId  WHERE U.Email = '" + txtSearch.Text.Trim() + "'", connectionString);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (!object.Equals(ds, null))
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridView1.DataSource = ds.Tables[0];
                        GridView1.DataBind();
                    }

                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connectionString);

            try
            {
                conn.Open();
                string textFName = txtFName.Text;
                string textLName = txtLName.Text;
                string textEmail = txtEmail.Text;
                string textPassword = MD5Hash(txtPassword.Text);
                if(txtPassword.Text.CompareTo(txtConfirmpassword.Text) != 0)
                {
                    lbError.Text = "Password and confirm password don't match!";
                    return;
                }


                if (textFile.HasFile)
                {
                    try
                    {
                        if (textFile.PostedFile.ContentType == "image/jpeg")
                        {
                            if (textFile.PostedFile.ContentLength < 102400)
                            {
                                Random random = new Random((int)DateTime.Now.Ticks);
                                int numIterations = 0;
                                numIterations = random.Next(1, 1000);
                                textFile.SaveAs(Server.MapPath("Pictures/") + numIterations + Path.GetFileName(textFile.FileName));
                                string url = numIterations + Path.GetFileName(textFile.FileName);
                                string textPhone = txtPhone.Text;
                                Int64 txtGroupId = Convert.ToInt64(DropDownList1.SelectedValue);
                                string txtSalt = MD5Hash(DateTime.Now.ToString("hh:mm:ss"));
                                //check file was submitted
                                SqlCommand cmd = new SqlCommand("insert into Users(FName, LName, Email, Password, Salt, URL, Phone, GroupId) " +
                                                                "values ('" + textFName + "', '" + textLName + "', '" + textEmail + "', '" + textPassword
                                                                + "', '" + txtSalt + "', '" + url + "',  '" + textPhone + "',  " + txtGroupId + ")", conn);

                                cmd.ExecuteNonQuery();
                                lbSubmitSuccess.Text = "Insert User successful";
                                gvbind();
                            }
                            else
                            {
                                lbError.Text = "Upload status: The file has to be less than 100 kb!";
                            }
                                
                        }
                        else
                        {
                            lbError.Text = "Upload status: Only JPEG files are accepted!";
                        }
                            
                    }
                    catch (Exception ex)
                    {
                        lbError.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    }
                    return;
                }
                

            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("delete FROM Users where UserId='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", conn);
                cmd.ExecuteNonQuery();
                lbSuccess.Text = "Delete User successful";
                gvbind();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gvbind();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
                SqlConnection conn = new SqlConnection(connectionString);
                try
                {
                    conn.Open();
                    int userid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
                    GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
                    Label lblID = (Label)row.FindControl("UserId");
                    string textFName = ((TextBox)row.FindControl("FName")).Text;
                    string textLName = ((TextBox)row.FindControl("LName")).Text;
                    string textEmail = ((TextBox)row.FindControl("Email")).Text;
                    FileUpload fu = (FileUpload)row.FindControl("URL");
                    string txtPhone = ((TextBox)row.FindControl("Phone")).Text;
                    Int64 txtGroupId = Convert.ToInt64(((DropDownList)row.FindControl("GroupName")).SelectedValue);
                    Random random = new Random((int)DateTime.Now.Ticks);
                    int numIterations = 0;
                    numIterations = random.Next(1, 1000);
                    fu.SaveAs(Server.MapPath("Pictures/") + numIterations + Path.GetFileName(fu.FileName));

                    string url = numIterations + Path.GetFileName(fu.FileName);
                    SqlCommand cmd = new SqlCommand("update Users set FName='" + textFName 
                                                                + "', LName='" + textLName 
                                                                + "',Email='" + textEmail 
                                                                + "', URL = '" + url
                                                                + "', Phone = '" + txtPhone
                                                                + "', GroupId = " + txtGroupId
                                                                + " where UserId='" + userid + "'", conn);

                    cmd.ExecuteNonQuery();
                    GridView1.EditIndex = -1;
                    lbSuccess.Text = "Update User successful";
                    gvbind();
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    conn.Close();
                }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            gvbind();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gvbind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                SqlConnection conn = new SqlConnection(connectionString);
                try
                {
                    DropDownList DropDownList1 = (e.Row.FindControl("GroupName") as DropDownList);
                    SqlDataAdapter sda = new SqlDataAdapter("select GroupID, Name from Groups", conn);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);   
                    DropDownList1.DataSource = dt;

                    DropDownList1.DataTextField = "Name";
                    DropDownList1.DataValueField = "GroupID";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, new ListItem("--Select Group Name--", "0"));
                } 
                catch (Exception ex)
                {
        }
                finally
                {
                    conn.Close();
                }
            }
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