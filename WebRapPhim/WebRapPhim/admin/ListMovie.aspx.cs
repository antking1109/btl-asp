using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ListMovie : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    private void HienThi()
    {
        grvMovie.DataSource = data.getAllMovie();
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

    protected void grvMovie_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvMovie.PageIndex = e.NewPageIndex;
        HienThi();
        //Load phaann trang
    }
    protected void btnXoa_Click(object sender, CommandEventArgs e)
    {

        if (e.CommandName == "xoa")
        {
            try
            {
                int id = Convert.ToInt16(e.CommandArgument);
                data.DeleteMovie(id);
                HienThi();
                mess.ForeColor = System.Drawing.Color.Green;
                mess.Text = "Bạn đã xóa thành công";
            }catch(Exception ex)
            {
                mess.ForeColor = System.Drawing.Color.Red;
                mess.Text = "Lỗi không thể xóa. Chi tiết lỗi: "+ex.Message;
            }
        }

    }
    public void btnSua_Click(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "sua")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            Movie m = data.getOneMovie(id);
            Session["EditMovie"] = m;
            Response.Redirect("EditMovie.aspx");
        }
    }
    public void btnThongKe_Click(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "thongke")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            Response.Redirect("ListBookingByMovie.aspx?movieid="+id);
        }
    }
    public void btnThem_Click(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "them")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Session["MovieID"] = id;
            Response.Redirect("AddShowtime.aspx");
        }
    }
}