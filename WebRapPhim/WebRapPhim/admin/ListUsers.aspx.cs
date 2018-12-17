using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ListUsers : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    private void HienThi()
    {
        grvUser.DataSource = data.getAllUser();
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
    protected void grvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvUser.PageIndex = e.NewPageIndex;
        HienThi();
    }
    protected void btnXoa_Click(object sender, CommandEventArgs e)
    {

        if (e.CommandName == "xoa")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            data.DeleteUser(id);
            HienThi();
        }

    }
    public void btnSua_Click(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "sua")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            User u = data.getOneUser(id);
            Session["EditUser"] = u;
            Response.Redirect("EditUser.aspx");
        }
    }

}