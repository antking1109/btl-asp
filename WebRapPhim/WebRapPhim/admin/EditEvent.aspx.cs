using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_EditEvent : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Event ev = (Event)Session["EditEvent"];
            txtID.Text = ev.id.ToString();
            txtTitle.Text = ev.title.ToString();
            oldStartTime.Text = ev.start_time.ToString("dd/MM/yyyy");
            oldStopTime.Text = ev.stop_time.ToString("dd/MM/yyyy");
            txtContent.InnerText = ev.content.ToString();
            imageThumb.ImageUrl = "~/"+ev.image_thumb.ToString();


        }
    }
    protected void SuaEvent_Click(object sender, EventArgs e)
    {
        try
        {
            Event s = new Event();
            s.id = Int32.Parse(txtID.Text);
            s.title = txtTitle.Text;
            if (txtStartTime.Text == "")
                s.start_time = DateTime.ParseExact(oldStartTime.Text, "dd/MM/yyyy", null);
            else
                s.start_time = Convert.ToDateTime(txtStartTime.Text);
            if (txtStopTime.Text == "")
                s.stop_time = DateTime.ParseExact(oldStopTime.Text, "dd/MM/yyyy", null);
            else
                s.stop_time = Convert.ToDateTime(txtStopTime.Text);
            if (Page.IsValid && txtfileImage.HasFile)
            {
                Random rdi = new Random();
                string fileName = "~/images/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + txtfileImage.FileName;
                string filePath = MapPath(fileName);
                txtfileImage.SaveAs(filePath);
                s.image_thumb = fileName.Replace("~/", "");
            }
            else
            {
                s.image_thumb = imageThumb.ImageUrl.ToString();
            }
            s.content = txtContent.InnerText;

            data.EditEvent(s);
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