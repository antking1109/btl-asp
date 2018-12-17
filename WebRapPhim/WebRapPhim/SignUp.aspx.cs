using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUp : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDK_Click(object sender, EventArgs e)
    {
        List<string> err = new List<string>();
        if (txtEmail.Text == "")
            err.Add("Vui lòng nhập Email");
        if(txtFullName.Text== "")
            err.Add("Vui lòng nhập Họ và tên");
        if (txtPhone.Text == "")
            err.Add("Vui lòng nhập Số điện thoại");
        if (txtPassword.Text == "")
            err.Add("Vui lòng nhập mật khẩu");
        if (ddlGender.SelectedValue == "Giới tính")
            err.Add("Vui lòng chọn giới tính");
        if(err.Count == 0)
        {
            try
            {
                User u = new User();
                u.email = txtEmail.Text;
                u.fullName = txtFullName.Text;
                u.passWord = txtPassword.Text;
                u.phone = txtPhone.Text;
                u.gender = ddlGender.SelectedItem.ToString();
                u.level = "Thành Viên";
                data.AddUser(u);
                mess.ForeColor = System.Drawing.Color.Green;
                mess.Text = "<b>Bạn đã thêm thành công</b>. Vui lòng đăng nhập để sử dụng các chức năng!.<br/>" +
                    "<a href='SignIn.aspx'><b>Đăng Nhập</b></a>";
            }
            catch (Exception ex)
            {
                mess.ForeColor = System.Drawing.Color.Red;
                mess.Text = "Lỗi không thể thêm. Chi tiết lỗi: " + ex.Message;
            }
        }
        else
        {
            string cacloi=string.Empty;
            foreach(string loi in err)
            {
                cacloi += "<li>" + loi + "</li>";
            }
            mess.ForeColor = System.Drawing.Color.Red;
            mess.Text = "<b>Lỗi không thể thêm. Chi tiết lỗi:</b> <br/>" + "<ul>" + cacloi + "</ul>";
        }
        
    }
}