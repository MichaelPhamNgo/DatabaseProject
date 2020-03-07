using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PhaseIII.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserID"].ToString() == "")
            {
                Response.Redirect("~/Admin/Login.aspx");
            }

            if (!IsPostBack)
            {
                lbUserName.Text = Session["Fullname"].ToString();
            }

        }

        protected void LinkLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Admin/Login.aspx");
        }
    }
}