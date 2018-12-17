using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public User()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int id { get; set; }
    public string email { get; set; }
    public string fullName { get; set; }
    public string passWord { get; set; }
    public string phone { get; set; }
    public string gender { get; set; }
    public string level { get; set; }
}