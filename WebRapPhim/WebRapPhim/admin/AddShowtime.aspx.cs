using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_AddShowtime : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        int movieid = (int)Session["MovieID"];
        string time = txtNgay.SelectedDate.ToString("yyyy/MM/dd") + " " + ddlGio.SelectedValue.ToString();
        data.AddShowtime(movieid.ToString(), time);
    }
}