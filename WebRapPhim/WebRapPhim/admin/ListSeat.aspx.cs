using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ListSeat : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    public void HienThi()
    {
        grvSeat.DataSource = data.getAllSeat();
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
        {
            HienThi();
        }
    }
    protected void btnXoa_Click(object sender, CommandEventArgs e)
    {

        if (e.CommandName == "xoa")
        {
            try
            {
                int id = Convert.ToInt16(e.CommandArgument);
                data.DeleteSeat(id);
                HienThi();
                mess.ForeColor = System.Drawing.Color.Green;
                mess.Text = "Bạn đã xóa thành công";
            }
            catch (Exception ex)
            {
                mess.ForeColor = System.Drawing.Color.Red;
                mess.Text = "Lỗi không thể xóa. Chi tiết lỗi: " + ex.Message;
            }
        }

    }
    public void btnSua_Click(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "sua")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            Seat s = data.getOneSeat(id);
            Session["EditSeat"] = s;
            Response.Redirect("EditSeat.aspx");
        }
    }

    protected void grvSeat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvSeat.PageIndex = e.NewPageIndex;
        HienThi();
        //Load phaann trang
    }
}