using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("CurrentUser");
        mess.ForeColor = System.Drawing.Color.Green;
        mess.Text = "<b>Bạn đã đăng xuất thành công!. <a href='index.aspx'>Trang Chủ</a></b> <br/>";
    }
}