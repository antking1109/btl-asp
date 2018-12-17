using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_EditMovie : System.Web.UI.Page
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
            Movie m = (Movie)Session["EditMovie"];
            txtID.Text = m.id.ToString();
            txtActor.Text = m.actor.ToString();
            txtDiretor.Text = m.director.ToString();
            txtDuration.Text = m.duration.ToString();
            txtGenre.Text = m.genre.ToString();
            txtMovielDetail.InnerText = m.movie_detail.ToString();
            txtPrice.Text = m.price.ToString();
            txtProduction.Text = m.production.ToString();
            oldStartTime.Text = m.start_time.ToString("dd'/'MM'/'yyyy");
            oldStopTime.Text = m.stop_time.ToString("dd/MM/yyyy");
            txtTitle.Text = m.title.ToString();
            txtVersion.Text = m.version.ToString();
            imageThumb.ImageUrl = m.image_thumb.ToString();
        }
    }

    protected void btnSua_Click(object sender, EventArgs e)
    {
        try
        {
            Movie m = new Movie();
            m.id = Int32.Parse(txtID.Text);
            m.actor = txtActor.Text;
            m.director = txtDiretor.Text;
            m.duration = txtDuration.Text;
            m.genre = txtGenre.Text;
            if (Page.IsValid && fileImage.HasFile)
            {
                Random rdi = new Random();
                string fileName = "~/images/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + fileImage.FileName;
                string filePath = MapPath(fileName);
                fileImage.SaveAs(filePath);
                m.image_thumb = fileName.Replace("~/","");
            }
            else
            {
                m.image_thumb = imageThumb.ImageUrl.ToString();
            }
            m.movie_detail = txtMovielDetail.InnerText;
            m.price = Convert.ToInt32(txtPrice.Text);
            m.production = txtProduction.Text;
            if (txtStartTime.Text == "")
                m.start_time = DateTime.ParseExact(oldStartTime.Text,"dd/MM/yyyy",null);
            else
                m.start_time = Convert.ToDateTime(txtStartTime.Text);
            if (txtStopTime.Text == "")
                m.stop_time = DateTime.ParseExact(oldStopTime.Text, "dd/MM/yyyy", null);
            else
                m.stop_time = Convert.ToDateTime(txtStopTime.Text);
            m.title = txtTitle.Text;
            m.version = txtVersion.Text;
            data.EditMovie(m);
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