using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] == null)
        {
            messlogin.Text = "<li><a href='SignIn.aspx' class='theme-btn'>Sign In</a></li>" +
                "<li><a href='SignUp.aspx' class='theme-btn'>Sign Up</a></li>";
        }
        else
        {
            User u = new User();
            u = (User)Session["CurrentUser"];
            messlogin.Text = "<li>Xin chào" + u.fullName + "</li><li><a href='LogOut.aspx' class='theme-btn'>Đăng Xuất</a></li>";
            if (u.level == "Admin")
                messlogin.Text = "<li>Xin chào" + u.fullName + "</li><li><a href='admin/Dashboard.aspx' class='theme-btn'>Admin CP</a></li><li><a href='LogOut.aspx' class='theme-btn'>Đăng Xuất</a></li>";
        }
    }
}
