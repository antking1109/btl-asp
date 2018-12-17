using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_AddEvent : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ThemEvent_Click(object sender, EventArgs e)
    {
        try
        {
            Event s = new Event();
            s.title = txtTitle.Text;
            s.start_time = Convert.ToDateTime(txtStartTime.Text);
            s.stop_time = Convert.ToDateTime(txtStopTime.Text);
            s.content = txtContent.Value;
            if (Page.IsValid && txtfileImage.HasFile)
            {
                Random rdi = new Random();
                string fileName = "~/images/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + txtfileImage.FileName;
                string filePath = MapPath(fileName);
                txtfileImage.SaveAs(filePath);
                s.image_thumb = fileName.Replace("~/","");
            }
            data.AddEvent(s);
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