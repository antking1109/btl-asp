using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Event
/// </summary>
public class Event
{
    public Event()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int id { get; set; }
    public string title { get; set; }
    public DateTime start_time { get; set; }
    public DateTime stop_time { get; set; }
    public string content { get; set; }
    public string image_thumb { get; set; }
}