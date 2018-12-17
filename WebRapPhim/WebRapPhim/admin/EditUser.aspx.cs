using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_EditUser : System.Web.UI.Page
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
            User u = (User)Session["EditUser"];
            txtID.Text = u.id.ToString();
            txtEmail.Text = u.email.ToString();
            txtFullName.Text = u.fullName.ToString();
            txtPassword.Text = u.passWord.ToString();
            txtPhone.Text = u.phone.ToString();
            ddlGT.SelectedValue = u.gender.ToString();
            if (u.level == "Admin")
                cbAdmin.Checked = true;
            if (u.level == "Thành Viên")
                cbAdmin.Checked = false;
        }

    }

    protected void btnEditUser_Click(object sender, EventArgs e)
    {
        try
        {
            User u = new User();
            u.id = Int32.Parse(txtID.Text);
            u.email = txtEmail.Text;
            u.fullName = txtFullName.Text;
            u.passWord = txtPassword.Text;
            u.phone = txtPhone.Text;
            u.gender = ddlGT.SelectedItem.ToString();
            if (cbAdmin.Checked)
            {
                u.level = "Admin";
            }
            else { u.level = "Thành Viên"; }
            data.EditUser(u);
            mess.ForeColor = System.Drawing.Color.Green;
            mess.Text = "Bạn đã sửa thành công";
        }
        catch (Exception ex)
        {
            mess.ForeColor = System.Drawing.Color.Red;
            mess.Text = "Lỗi không thể sửa. Chi tiết lỗi: " + ex.Message;
        }
    }
}