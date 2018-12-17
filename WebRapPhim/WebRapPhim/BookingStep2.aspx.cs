using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookingStep2 : System.Web.UI.Page
{
    DataUtility data = new DataUtility();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["showid"] == null)
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
                
                    int id = Convert.ToInt32(Request.QueryString["showid"]);
                    
                    List<Seat> seatsA = data.getAllSeatByNameLike("A", id);
                    dsGheA.DataSource = seatsA;
                    DataBind();
                    List<Seat> seatsB = data.getAllSeatByNameLike("B", id);
                    dsGheB.DataSource = seatsB;
                    DataBind();
                    List<Seat> seatsC = data.getAllSeatByNameLike("C", id);
                    dsGheC.DataSource = seatsC;
                    DataBind();
                    List<Seat> seatsD = data.getAllSeatByNameLike("D", id);
                    dsGheD.DataSource = seatsD;
                    DataBind();
                
                    Showtime s = data.getAllInfoShowtime(id);
                    List<Showtime> showtimes = new List<Showtime>();
                    showtimes.Add(s);
                    lvInfo.DataSource = showtimes;
                    DataBind();

                ///////////////////////
                if (!IsPostBack)
                {
                    cblGhe.DataSource = data.layDSGheChuaDat(id);
                    cblGhe.DataTextField = "name";
                    cblGhe.DataValueField = "id";
                    DataBind();
                }
            }
        }
    }

    List<int> lsseatid = new List<int>();
    string strChoNgoi="Các chỗ bạn đặt là: ";
    protected void btnDatVe_Click(object sender, EventArgs e)
    {
        try
        {
            //Thêm vào bảng seatdetail
            BookingDetail bd = data.getNewBookingDetail();
            int id = bd.id;//Lấy ra idBookingDetails vừa thêm ở trên
            foreach(int seatid in lsseatid)
            {
                data.AddSeatDetail(id, seatid);
            }
            mess.ForeColor = System.Drawing.Color.Green;
            mess.Text = "<b>Bạn đã đặt vé thành công. "+strChoNgoi+"</b>";
        }
        catch(Exception ex)
        {
            mess.ForeColor = System.Drawing.Color.Red;
            mess.Text = "Lỗi không thể đặt. Chi tiết lỗi: " + ex.Message;
        }

    }

    protected void cblGhe_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (ListItem item in cblGhe.Items)
        {
            if (item.Selected)
            {
                int seatid = Convert.ToInt32(item.Value);
                lsseatid.Add(seatid);
                strChoNgoi += item.Text + "|";
            }
            else
            {

            }
        }
    }
}