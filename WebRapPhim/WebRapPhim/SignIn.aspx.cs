using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignIn : System.Web.UI.Page
{
    DataUtility dt = new DataUtility();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDK_Click(object sender, EventArgs e)
    {
        bool status=false;
        User u = new User();
        u = dt.getUserLogin(txtEmail.Text, txtPassword.Text,out status);
        if(status == false)
        {
            mess.ForeColor = System.Drawing.Color.Red;
            mess.Text = "<b>Bạn vui lòng kiểm tra lại tài khoản hoặc mật khẩu</b> <br/>";
        }
        else
        {
            mess.ForeColor = System.Drawing.Color.Green;
            Session["CurrentUser"]=u;
            mess.Text = "<b>Bạn đã đăng nhập thành công.</b>Quay lại trang chủ để tiếp tục sử dụng chức năng.<br/>" +
                    "<a href='index.aspx'><b>Trang Chủ</b></a>";
        }
    }
}