using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_AddMovie : System.Web.UI.Page
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
            Movie m = new Movie();
            m.title = txtTitle.Text;
            m.start_time = Convert.ToDateTime(txtStartTime.Text);
            m.stop_time = Convert.ToDateTime(txtStopTime.Text);
            m.genre = txtGenre.Text;
            m.actor = txtActor.Text;
            m.director = txtDiretor.Text;
            m.duration = txtDuration.Text;
            m.version = txtVersion.Text;
            m.production = txtProduction.Text;
            m.price = Convert.ToInt32(txtPrice.Text);
            m.movie_detail = txtMovielDetail.Value;
            if (Page.IsValid && fileImage.HasFile)
            {
                Random rdi = new Random();
                string fileName = "~/images/"+ DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + fileImage.FileName;
                string filePath = MapPath(fileName);
                fileImage.SaveAs(filePath);
                m.image_thumb = fileName.Replace("~/", "");
            }
            data.AddMovie(m);
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