using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Setting : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<Setting> liSetting = new List<Setting>();
            liSetting = data.getAllSetting();
            foreach (Setting s in liSetting)
            {
                if (s.key == "title")
                {
                    txtTitle.Text = s.value;
                }
                if (s.key == "describe")
                {
                    txtDescribe.Text = s.value;
                }
                if (s.key == "facebook")
                {
                    txtFacebook.Text = s.value;
                }
                if (s.key == "image_logo")
                {
                    imgLogo.ImageUrl = s.value;
                }
                if (s.key == "instagram")
                {
                    txtInstagram.Text = s.value;
                }
                if (s.key == "youtube")
                {
                    txtYoutube.Text = s.value;
                }
                if (s.key == "zalo")
                {
                    txtZalo.Text = s.value;
                }
                if (s.key == "code_footer")
                {
                    txtCodeFooter.InnerText = s.value;
                }
            }
        }
    }
    public void btnSua_Click(object sender, EventArgs e)
    {
        data.EditSetting("describe", txtDescribe.Text);
        data.EditSetting("title", txtTitle.Text);
        data.EditSetting("facebook", txtFacebook.Text);
        data.EditSetting("instagram", txtInstagram.Text);
        data.EditSetting("youtube", txtYoutube.Text);
        data.EditSetting("zalo", txtZalo.Text);
        data.EditSetting("code_footer", txtCodeFooter.InnerText);
        if (fileLogo.HasFile)
        {
            string fileName = "~/images/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + fileLogo.FileName;
            string filePath = MapPath(fileName);
            fileLogo.SaveAs(filePath);
            data.EditSetting("image_logo", fileName);
        }
    }
}