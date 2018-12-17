using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ListEvent : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HienthiDL();
        }
    }
    private void HienthiDL()
    {
        grvEvent.DataSource = data.getAllEvent();
        DataBind();
    }

    public void XoaEvent_Click(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "xoa")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            data.DeleteEvent(id);
            HienthiDL();

        }
    }
    public void SuaEvent_Click(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "sua")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            Event s = data.getOneEvent(id);
            Session["EditEvent"] = s;
            Response.Redirect("EditEvent.aspx");
        }
    }


    protected void grvEvent_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvEvent.PageIndex = e.NewPageIndex;
        HienthiDL();
    }
}