using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    DataUtility dt = new DataUtility();
    protected void Page_Load(object sender, EventArgs e)
    {
        List<Movie> liMovie = dt.layPhim("phimdangchieu");
        dsPhimDangChieu.DataSource = liMovie;
        DataBind();
        dsSuKien.DataSource = dt.getAllEvent();
        DataBind();
        dspDangChieu.DataSource = dt.layPhim("phimdangchieu");
        DataBind();
        dspSapChieu.DataSource = dt.layPhim("phimsapchieu");
        DataBind();
    }
}