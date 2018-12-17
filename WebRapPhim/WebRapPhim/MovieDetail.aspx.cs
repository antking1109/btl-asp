using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MovieDetail : System.Web.UI.Page
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
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Movie m = data.getOneMovie(id);
            List<Movie> movies = new List<Movie>();
            movies.Add(m);
            lvMovie.DataSource = movies;
            DataBind();
        }
    }
}