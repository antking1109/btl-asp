using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ListShowtime : System.Web.UI.Page
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
        grvShowtime.DataSource = data.getAllShowtime();
        DataBind();
    }

    protected void XoaShowtime_Click(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "xoa")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            data.DeleteShowtime(id);
            HienthiDL();
        }
    }

    protected void grvShowtime_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvShowtime.PageIndex = e.NewPageIndex;
        HienthiDL();
    }
}