using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Movie
/// </summary>
public class Movie
{
    public Movie()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int id { get; set; }
    public string title { get; set; }
    public DateTime start_time { get; set; }
    public DateTime stop_time { get; set; }
    public string genre { get; set; }
    public string actor { get; set; }
    public string director { get; set; }
    public string duration { get; set; }
    public string version { get; set; }
    public string production { get; set; }
    public double price { get; set; }
    public string movie_detail { get; set; }
    public string image_thumb { get; set; }
}