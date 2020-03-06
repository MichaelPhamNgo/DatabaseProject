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
            //if (Session["LoginAccount"] == null || Session["LoginAccount"].ToString() == "")
            //{
            //    Response.Redirect("~/Admin/Login.aspx");
            //}


            if (!IsPostBack)
            {

            }

        }
    }
}