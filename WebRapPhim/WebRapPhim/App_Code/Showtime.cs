using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Showtime
/// </summary>
public class Showtime
{
    public Showtime()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int showtimeid { get; set; }
    public int movieid { get; set; }
    public DateTime showtime { get; set; }
    public string movietitle { get; set; }
    public double price { get; set; }
}