using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookingDetail
/// </summary>
public class BookingDetail
{
    public BookingDetail()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int id { get; set; }
    public int user_id { get; set; }
    public int showtime_id { get; set; }
    public string userFullName { get; set; }
    public DateTime showtimeTime { get; set; }
    public string movieTitle { get; set; }
    public string bookingSeat { get; set; }
}