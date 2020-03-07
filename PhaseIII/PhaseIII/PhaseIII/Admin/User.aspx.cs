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
                SqlDataAdapter da = new SqlDataAdapter("SELECT U.UserId, U.FName, U.LName, U.Email, U.URL, U.Phone, G.Name FROM Users AS U JOIN Groups AS G ON U.GroupId = G.GroupId", connectionString);
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
                SqlDataAdapter da = new SqlDataAdapter("SELECT U.UserId, U.FName, U.LName, U.Email, U.URL, U.Phone, G.Name FROM Users AS U JOIN Groups AS G ON U.GroupId = G.GroupId WHERE U.Email = '" + txtSearch.Text.Trim() + "'", connectionString);
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

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
                Response.Write(ex.Message);
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
                    TextBox textFName = (TextBox)row.FindControl("FName");
                    TextBox textLName = (TextBox)row.FindControl("LName");
                    TextBox textEmail = (TextBox)row.FindControl("Email");
                    FileUpload fu = (FileUpload)row.FindControl("FileUpload1");
                    TextBox txtPhone = (TextBox)row.FindControl("Phone");
                    TextBox txtGroupId = (TextBox)row.FindControl("GroupId");

                    Random random = new Random((int)DateTime.Now.Ticks);
                    int numIterations = 0;
                    numIterations = random.Next(1, 1000);
                    fu.SaveAs(Server.MapPath("Pictures/") + numIterations + Path.GetFileName(fu.FileName));

                    string url = numIterations + Path.GetFileName(fu.FileName);
                    Response.Write("update Users set FName='" + textFName.Text + "', LName='" + textLName.Text + "',textEmail='" + textEmail.Text + "', URL = '" + url + "' where UserId='" + userid + "'");
                    SqlCommand cmd = new SqlCommand("update Users set FName='" + textFName.Text + "', LName='" + textLName.Text + "',Email='" + textEmail.Text + "', URL = '" + url + "' where UserId='" + userid + "'", conn);

                    cmd.ExecuteNonQuery();
                    GridView1.EditIndex = -1;
                    lbSuccess.Text = "Update User successful";
                    gvbind();
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
                    DropDownList DropDownList1 = (e.Row.FindControl("DropDownGroup") as DropDownList);
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