using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookingStep1 : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("404.html");
        }
        else
        {
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("~/SignIn.aspx");
            }
            else
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                List<Showtime> showtimes = data.getAllShowtimeByMovie(id);
                ddlDSLichChieu.DataSource = showtimes;
                ddlDSLichChieu.DataTextField = "showtime";
                ddlDSLichChieu.DataValueField = "showtimeid";
                DataBind();
            }
            
        }
    }

    protected void btnBuocTiep_Click(object sender, EventArgs e)
    {
        User u = (User)Session["CurrentUser"];
        int uid = u.id;
        int showtimeid = Convert.ToInt32(ddlDSLichChieu.SelectedValue);
        BookingDetail bd = new BookingDetail();
        bd.showtime_id = showtimeid;
        bd.user_id = uid;
        data.AddBooking(bd);
        Response.Redirect("BookingStep2.aspx?showid=" + ddlDSLichChieu.SelectedValue);
    }
}