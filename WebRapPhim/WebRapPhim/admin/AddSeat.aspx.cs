using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_AddSeat : System.Web.UI.Page
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
            if (u.level != "Admin")
                Response.Redirect("~/SignIn.aspx");
        }
    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        try
        {
            Seat s = new Seat();
            s.name = txtTenGhe.Text;
            data.AddSeat(s);
            mess.ForeColor = System.Drawing.Color.Green;
            mess.Text = "Bạn đã thêm thành công";
        }
        catch (Exception ex)
        {
            mess.ForeColor = System.Drawing.Color.Red;
            mess.Text = "Lỗi không thể thêm. Chi tiết lỗi: " + ex.Message;
        }
    }
}