using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_EditSeat : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            Seat s = (Seat)Session["EditSeat"];
            txtID.Text = s.id.ToString();
            txtName.Text = s.name.ToString();
        }
    }
    protected void btnSua_Click(object sender, EventArgs e)
    {
        try
        {
            Seat s = new Seat();
            s.id = Convert.ToInt32(txtID.Text);
            s.name = txtName.Text;
            data.EditSeat(s);
            mess.ForeColor = System.Drawing.Color.Green;
            mess.Text = "Sửa thành công";
        }
        catch (Exception ex)
        {
            mess.ForeColor = System.Drawing.Color.Red;
            mess.Text = "Lỗi không thể sửa. Chi tiết lỗi: " + ex.Message;
        }
    }
}