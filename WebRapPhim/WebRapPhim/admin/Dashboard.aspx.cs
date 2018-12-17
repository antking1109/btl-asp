using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Dashboard : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] == null)
        {
            Response.Redirect("~/SignIn.aspx");
        }
        else
        {
            User u = new User();
            u = (User)Session["CurrentUser"];
            if (u.level == "Admin")
            {
                totalMovie.Text = data.getTotalBy("Movies").ToString();
                totalUser.Text = data.getTotalBy("Users").ToString();
            }
            else
            {
                Response.Redirect("~/SignIn.aspx");
            }
        }
    }
}