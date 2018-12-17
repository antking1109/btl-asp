using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ListBooking : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    private void HienThi()
    {
        grvBooking.DataSource = data.getAllBooking();
        DataBind();
    }
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
            if (u.level != "Admin")
                Response.Redirect("~/SignIn.aspx");
        }
        if (!IsPostBack)
            HienThi();
    }

    protected void grvBooking_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvBooking.PageIndex = e.NewPageIndex;
        HienThi();
    }
}