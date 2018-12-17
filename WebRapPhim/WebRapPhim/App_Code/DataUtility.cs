using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for DataUtility
/// </summary>
public class DataUtility
{
    SqlConnection con;
    public DataUtility()
    {
        string strConnect = @"Data Source=.\SQLEXPRESS;Initial Catalog=QLRP;Integrated Security=True;MultipleActiveResultSets=true";
        con = new SqlConnection(strConnect);
    }
    public int getTotalBy(string name_table)
    {
        string rq = "SELECT COUNT(*) FROM " + name_table;
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        int total = (int)cmd.ExecuteScalar();
        con.Close();
        return total;
    }
    public List<User> getAllUser()
    {
        List<User> liUser = new List<User>();
        string rq = "SELECT * FROM Users";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            User u = new User();
            u.id = (int)rd["id"];
            u.email = (string)rd["email"];
            u.fullName = (string)rd["full_name"];
            u.passWord = (string)rd["pass_word"];
            u.phone = (string)rd["phone"];
            u.gender = (string)rd["gender"];
            if ((bool)rd["level"] == true)
            {
                u.level = "Admin";
            }
            else
            {
                u.level = "Thành Viên";
            }
            liUser.Add(u);
        }
        con.Close();
        return liUser;
    }
    public void AddUser(User u)
    {
        con.Open();
        string rq = "INSERT INTO Users(email,full_name,pass_word,phone,gender,level) VALUES(@email,@fn,@pass,@phone,@gender,@lv)";
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("email", u.email);
        cmd.Parameters.AddWithValue("fn", u.fullName);
        cmd.Parameters.AddWithValue("pass", u.passWord);
        cmd.Parameters.AddWithValue("phone", u.phone);
        cmd.Parameters.AddWithValue("gender", u.gender);
        if (u.level == "Admin")
        {
            cmd.Parameters.AddWithValue("lv", 1);
        }
        else
        {
            cmd.Parameters.AddWithValue("lv", 0);
        }
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public User getOneUser(int id)
    {
        User u = new User();
        string rq = "SELECT * FROM Users WHERE id=@id";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("id", id);
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            u = new User();
            u.id = (int)rd["id"];
            u.email = (string)rd["email"];
            u.fullName = (string)rd["full_name"];
            u.passWord = (string)rd["pass_word"];
            u.phone = (string)rd["phone"];
            u.gender = (string)rd["gender"];
            if ((bool)rd["level"] == true)
            {
                u.level = "Admin";
            }
            else
            {
                u.level = "Thành Viên";
            }
        }
        con.Close();
        return u;
    }
    public void EditUser(User u)
    {
        con.Open();
        string rq = "UPDATE Users set email=@email, full_name=@fn, pass_word=@pass,phone=@phone,gender=@gender,level=@lv WHERE id=@id";
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("id", u.id);
        cmd.Parameters.AddWithValue("email", u.email);
        cmd.Parameters.AddWithValue("fn", u.fullName);
        cmd.Parameters.AddWithValue("pass", u.passWord);
        cmd.Parameters.AddWithValue("phone", u.phone);
        cmd.Parameters.AddWithValue("gender", u.gender);
        if (u.level == "Admin")
        {
            cmd.Parameters.AddWithValue("lv", 1);
        }
        else
        {
            cmd.Parameters.AddWithValue("lv", 0);
        }
        cmd.ExecuteNonQuery();
        con.Close();

    }
    public void DeleteUser(int id)
    {
        con.Open();
        string rq = "DELETE Users WHERE id=@id";
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("id", id);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    ///////////////////////////////Movie///////////////////////////////////////////////
    public void AddMovie(Movie m)
    {
        con.Open();
        string rq = "INSERT INTO Movies([title],[start_time],[stop_time],[genre],[actor],[director]," +
            "[duration],[version],[production],[price],[movie_detail],[image_thumb])" +
            " VALUES(@title,@starttime,@stoptime,@genre,@actor,@director,@duration,@version,@production," +
            "@price,@moviedetail,@imagethumb)";
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("title", m.title);
        cmd.Parameters.AddWithValue("starttime", m.start_time.ToShortDateString());
        cmd.Parameters.AddWithValue("stoptime", m.stop_time.ToShortDateString());
        cmd.Parameters.AddWithValue("genre", m.genre);
        cmd.Parameters.AddWithValue("actor", m.actor);
        cmd.Parameters.AddWithValue("director", m.director);
        cmd.Parameters.AddWithValue("duration", m.duration);
        cmd.Parameters.AddWithValue("version", m.version);
        cmd.Parameters.AddWithValue("production", m.production);
        cmd.Parameters.AddWithValue("price", m.price);
        cmd.Parameters.AddWithValue("moviedetail", m.movie_detail);
        cmd.Parameters.AddWithValue("imagethumb", m.image_thumb);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public List<Movie> getAllMovie()
    {
        List<Movie> liMovie = new List<Movie>();
        string rq = "SELECT * FROM Movies";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            Movie m = new Movie();
            m.id = (int)rd["id"];
            m.title = (string)rd["title"];
            m.start_time = (DateTime)rd["start_time"];
            m.stop_time = (DateTime)rd["stop_time"];
            m.actor = (string)rd["actor"];
            m.director = (string)rd["director"];
            m.duration = (string)rd["duration"];
            m.genre = (string)rd["genre"];
            m.image_thumb = (string)rd["image_thumb"];
            m.movie_detail = (string)rd["movie_detail"];
            m.price = (double)rd["price"];
            m.production = (string)rd["production"];
            m.version = (string)rd["version"];
            liMovie.Add(m);
        }
        con.Close();
        return liMovie;
    }
    public Movie getOneMovie(int id)
    {
        Movie m = new Movie();
        string rq = "SELECT * FROM Movies WHERE id=@id";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("id", id);
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            m = new Movie();
            m.id = (int)rd["id"];
            m.title = (string)rd["title"];
            m.start_time = (DateTime)rd["start_time"];
            m.stop_time = (DateTime)rd["stop_time"];
            m.actor = (string)rd["actor"];
            m.director = (string)rd["director"];
            m.duration = (string)rd["duration"];
            m.genre = (string)rd["genre"];
            m.image_thumb = (string)rd["image_thumb"];
            m.movie_detail = (string)rd["movie_detail"];
            m.price = (double)rd["price"];
            m.production = (string)rd["production"];
            m.version = (string)rd["version"];
        }
        con.Close();
        return m;
    }
    public void EditMovie(Movie m)
    {
        con.Open();
        string rq = "UPDATE Movies SET title=@title, start_time=@start_time, stop_time=@stop_time,genre=@genre,actor=@actor,director=@director,duration=@duration,version=@version,production=@production,price=@price,movie_detail=@movie_detail,image_thumb=@image_thumb WHERE id=@id";
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("title", m.title);
        cmd.Parameters.AddWithValue("start_time", m.start_time);
        cmd.Parameters.AddWithValue("stop_time", m.stop_time);
        cmd.Parameters.AddWithValue("genre", m.genre);
        cmd.Parameters.AddWithValue("actor", m.actor);
        cmd.Parameters.AddWithValue("id", m.id);
        cmd.Parameters.AddWithValue("director", m.director);
        cmd.Parameters.AddWithValue("duration", m.duration);
        cmd.Parameters.AddWithValue("version", m.version);
        cmd.Parameters.AddWithValue("production", m.production);
        cmd.Parameters.AddWithValue("price", m.price);
        cmd.Parameters.AddWithValue("movie_detail", m.movie_detail);
        cmd.Parameters.AddWithValue("image_thumb", m.image_thumb);
        cmd.ExecuteNonQuery();
        con.Close();

    }
    public void DeleteMovie(int id)
    {
        con.Open();
        string rq = "DELETE Movies WHERE id=@id";
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("id", id);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public List<Seat> getAllSeat()
    {
        List<Seat> liSeat = new List<Seat>();
        string rq = "SELECT * FROM Seats";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            Seat s = new Seat();
            s.id = (int)rd["id"];
            s.name = (string)rd["name"];
            liSeat.Add(s);
        }
        con.Close();
        return liSeat;
    }
    public Seat getOneSeat(int id)
    {
        Seat s = new Seat();
        string rq = "SELECT * FROM Seats WHERE id=@id";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("id", id);
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            s = new Seat();
            s.id = (int)rd["id"];
            s.name = (string)rd["name"];
        }
        con.Close();
        return s;
    }
    public void EditSeat(Seat s)
    {
        con.Open();
        string rq = "UPDATE Seats SET name=@name WHERE id=@id";
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("id", s.id);
        cmd.Parameters.AddWithValue("name", s.name);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void DeleteSeat(int id)
    {
        con.Open();
        string rq = "DELETE Seats WHERE id=@id";
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("id", id);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void AddSeat(Seat s)
    {
        con.Open();
        string rq = "INSERT INTO Seats([name])" +
            " VALUES(@name)";
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("name", s.name);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    //////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////
    ///Booking Detail///////////////////////////////////////////
    public List<BookingDetail> getAllBooking()
    {
        List<BookingDetail> liBooking = new List<BookingDetail>();
        string rq = "SELECT * FROM getAllBooking";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            BookingDetail b = new BookingDetail();
            b.id = (int)rd["BookingID"];
            b.user_id = (int)rd["UserID"];
            b.showtime_id = (int)rd["ShowtimeID"];
            b.movieTitle = (string)rd["MovieTitle"];
            b.showtimeTime = (DateTime)rd["ShowTime"];
            b.userFullName = (string)rd["UserFullName"];
            string rq1 = "SELECT name FROM  BookingDetails , SeatDetails, Seats " +
                "WHERE BookingDetails.id = SeatDetails.booking_id AND " +
                "SeatDetails.seat_id = Seats.id AND " +
                "SeatDetails.booking_id = " + b.id;
            SqlCommand cmd1 = new SqlCommand(rq1, con);
            SqlDataReader rd1 = cmd1.ExecuteReader();
            string seat = string.Empty;
            while (rd1.Read())
            {
                seat += (string)rd1["name"] + " ,";
            }
            b.bookingSeat = seat;
            liBooking.Add(b);
        }
        con.Close();
        return liBooking;
    }
    public List<BookingDetail> getAllBookingByMovie(string id)
    {
        List<BookingDetail> liBooking = new List<BookingDetail>();
        string rq = "EXEC getAllBookingByMovie @movie_id="+id;
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            BookingDetail b = new BookingDetail();
            b.id = (int)rd["BookingID"];
            b.user_id = (int)rd["UserID"];
            b.showtime_id = (int)rd["ShowtimeID"];
            b.movieTitle = (string)rd["MovieTitle"];
            b.showtimeTime = (DateTime)rd["ShowTime"];
            b.userFullName = (string)rd["UserFullName"];
            string rq1 = "SELECT name FROM  BookingDetails , SeatDetails, Seats " +
                "WHERE BookingDetails.id = SeatDetails.booking_id AND " +
                "SeatDetails.seat_id = Seats.id AND " +
                "SeatDetails.booking_id = " + b.id;
            SqlCommand cmd1 = new SqlCommand(rq1, con);
            SqlDataReader rd1 = cmd1.ExecuteReader();
            string seat = string.Empty;
            while (rd1.Read())
            {
                seat += (string)rd1["name"] + " ,";
            }
            b.bookingSeat = seat;
            liBooking.Add(b);
        }
        con.Close();
        return liBooking;
    }
    ////////////////////////////////////////////////////////////
    //////////////////////////Check Login//////////////////////
    public User getUserLogin(string email,string pass,out bool status)
    {
        status = false;
        User u = new User();
        string rq = "SELECT * FROM Users WHERE email='" + email + "' AND pass_word='" + pass + "'";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            u = new User();
            u.id = (int)rd["id"];
            u.email = (string)rd["email"];
            u.fullName = (string)rd["full_name"];
            u.passWord = (string)rd["pass_word"];
            u.phone = (string)rd["phone"];
            u.gender = (string)rd["gender"];
            if ((bool)rd["level"] == true)
            {
                u.level = "Admin";
            }
            else
            {
                u.level = "Thành Viên";
            }
            status = true;
        }
        con.Close();
        return u;
    }
    /////////////////////////////////////////////////////////
    ////////////////////SETTING//////////////////////////////
    public List<Setting> getAllSetting()
    {
        List<Setting> liSetting = new List<Setting>();
        string rq = "SELECT * FROM Settings";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            Setting s = new Setting();
            s.key = (string)rd["key"];
            s.value = (string)rd["value"];
            liSetting.Add(s);
        }
        con.Close();
        return liSetting;
    }
    public void EditSetting(string key, string value)
    {
        con.Open();
        string rq = "UPDATE Settings SET value=N'" + value.ToString() + "' WHERE [key]='" + key.ToString() + "'";
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    //////////////////////////////////////////////////////
    /////////////////////////////////////////////////////
    public List<Event> getAllEvent()
    {
        List<Event> li = new List<Event>();
        string rq = "SELECT * FROM Events";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            Event s = new Event();
            s.id = (int)rd["id"];
            s.title = (string)rd["title"];
            s.start_time = (DateTime)rd["start_time"];
            s.stop_time = (DateTime)rd["stop_time"];
            s.content = (string)rd["content"];
            s.image_thumb = (string)rd["image_thumb"];
            li.Add(s);
        }
        con.Close();
        return li;

    }
    public void DeleteEvent(int id)
    {
        con.Open();
        string sql = "delete Events where id=@id";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("id", id);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void AddEvent(Event s)
    {
        con.Open();
        string sql = "INSERT INTO [Events]([title],[start_time],[stop_time],[content],[image_thumb])" +
            "Values (@title,@start_time,@stop_time,@content,@image_thumb)";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("title", s.title);
        cmd.Parameters.AddWithValue("start_time", s.start_time);
        cmd.Parameters.AddWithValue("stop_time", s.stop_time);
        cmd.Parameters.AddWithValue("content", s.content);
        cmd.Parameters.AddWithValue("image_thumb", s.image_thumb);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void EditEvent(Event s)
    {
        con.Open();
        string sql = "Update Events set title=@title ,start_time=@start_time, stop_time=@stop_time,content=@content,image_thumb=@image_thumb WHERE id=@id";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("title", s.title);
        cmd.Parameters.AddWithValue("start_time", s.start_time);
        cmd.Parameters.AddWithValue("stop_time", s.stop_time);
        cmd.Parameters.AddWithValue("content", s.content);
        cmd.Parameters.AddWithValue("image_thumb", s.image_thumb);
        cmd.Parameters.AddWithValue("id", s.id);
        cmd.ExecuteNonQuery();
        con.Close();

    }
    public Event getOneEvent(int id)
    {
        Event s = new Event();
        string rq = "SELECT * FROM Events WHERE id=@id";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("id", id);
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            s = new Event();
            s.id = (int)rd["id"];
            s.title = (string)rd["title"];
            s.start_time = (DateTime)rd["start_time"];
            s.stop_time = (DateTime)rd["stop_time"];
            s.content = (string)rd["content"];
            s.image_thumb = (string)rd["image_thumb"];
        }
        con.Close();
        return s;
    }
    public List<Showtime> getAllShowtime()
    {
        List<Showtime> li = new List<Showtime>();
        con.Open();
        string sql = "select * from getAllShowtime ";
        SqlCommand cmd = new SqlCommand(sql, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            Showtime s = new Showtime();
            s.showtimeid = (int)rd["Showtimeid"];
            s.movieid = (int)rd["Movieid"];
            s.showtime = (DateTime)rd["Showtime"];
            s.movietitle = (string)rd["Movietitle"];
            li.Add(s);
        }
        con.Close();
        return li;
    }
    public List<Showtime> getAllShowtimeByMovie(int id)
    {
        List<Showtime> li = new List<Showtime>();
        con.Open();
        string sql = "EXEC getAllShowtimByMovie @movie_id="+id;
        SqlCommand cmd = new SqlCommand(sql, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            Showtime s = new Showtime();
            s.showtimeid = (int)rd["Showtimeid"];
            s.movieid = (int)rd["Movieid"];
            s.showtime = (DateTime)rd["Showtime"];
            s.movietitle = (string)rd["Movietitle"];
            li.Add(s);
        }
        con.Close();
        return li;
    }

    public void DeleteShowtime(int showtimeid)
    {
        con.Open();
        string sql = "delete Showtimes where id=@id";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("id", showtimeid);
        cmd.ExecuteNonQuery();
        con.Close();

    }
    public void AddShowtime(string movie_id, string time)
    {
        con.Open();
        string sql = "INSERT INTO [Showtimes]([movie_id],[time])" +
            "Values (@movie_id,@time)";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("movie_id", movie_id);
        cmd.Parameters.AddWithValue("time", time);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public List<Movie> layPhim(string view)
    {
        List<Movie> liMovie = new List<Movie>();
        string rq = "SELECT * FROM "+view;
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            Movie m = new Movie();
            m.id = (int)rd["id"];
            m.title = (string)rd["title"];
            m.start_time = (DateTime)rd["start_time"];
            m.stop_time = (DateTime)rd["stop_time"];
            m.actor = (string)rd["actor"];
            m.director = (string)rd["director"];
            m.duration = (string)rd["duration"];
            m.genre = (string)rd["genre"];
            m.image_thumb = (string)rd["image_thumb"];
            m.movie_detail = (string)rd["movie_detail"];
            m.price = (double)rd["price"];
            m.production = (string)rd["production"];
            m.version = (string)rd["version"];
            liMovie.Add(m);
        }
        con.Close();
        return liMovie;
    }
    public List<Seat> getAllSeatByNameLike(string name,int showtime_id)
    {
        List<Seat> liSeat = new List<Seat>();
        string rq = "SELECT * FROM Seats WHERE name LIKE '"+name+"%' ORDER BY name ASC";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            Seat s = new Seat();
            s.id = (int)rd["id"];
            s.name = (string)rd["name"];
            s.status = "chuadat";
            string rq1 = "EXEC getAllSeatBookedByShowtime @showtime_id = " + showtime_id + ", @name='" + name + "%'";
            SqlCommand cmd1 = new SqlCommand(rq1, con);
            SqlDataReader rd1 = cmd1.ExecuteReader();
            while (rd1.Read())
            {
                if((int)rd1["ID"] == s.id)
                    s.status = "dadat";
                else { s.status = "chuadat"; }
            }
            liSeat.Add(s);
        }
        con.Close();
        return liSeat;
    }
    public List<Seat> layDSGheChuaDat(int showtime_id)
    {
        List<Seat> liSeat = new List<Seat>();
        string rq = "SELECT * FROM Seats ORDER BY name ASC";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            Seat s = new Seat();
            s.id = (int)rd["id"];
            s.name = (string)rd["name"];
            s.status = "chuadat";
            string rq1 = "EXEC getAllSeatBookedByShowtimeID @showtime_id = "+showtime_id;
            SqlCommand cmd1 = new SqlCommand(rq1, con);
            SqlDataReader rd1 = cmd1.ExecuteReader();
            while (rd1.Read())
            {
                if((int)rd1["ID"] == s.id)
                {
                    s.status = "dadat";
                }
                else
                {
                    s.status = "chuadat";
                }
                
            }
            if (s.status == "chuadat")
            {
                liSeat.Add(s);
            }
        }
        con.Close();
        return liSeat;
    }
    public Showtime getAllInfoShowtime(int showid)
    {
        Showtime s = new Showtime();
        string rq = "EXEC getAllInfoShowtime @showtime_id = "+showid;
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            s = new Showtime();
            s.movieid = (int)rd["MOVIE_ID"];
            s.movietitle = (string)rd["MOVIE_TITLE"];
            s.price = (double)rd["MOVIE_PRICE"];
            s.showtime = (DateTime)rd["SHOWTIME"];
        }
        con.Close();
        return s;
    }
    public void AddBooking(BookingDetail b)
    {
        con.Open();
        string rq = "INSERT INTO BookingDetails([user_id],[showtime_id])" +
            " VALUES(@userid,@showtimeid)";
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.Parameters.AddWithValue("userid", b.user_id);
        cmd.Parameters.AddWithValue("showtimeid", b.showtime_id);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public BookingDetail getNewBookingDetail()
    {
        BookingDetail b = new BookingDetail();
        string rq = "SELECT MAX(id) AS 'MAX' FROM BookingDetails";
        con.Open();
        SqlCommand cmd = new SqlCommand(rq, con);
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            b.id = (int)rd["MAX"];
        }
        con.Close();
        return b;
    }
    public void AddSeatDetail(int bookid,int seatid)
    {
        con.Open();
        string rq = "INSERT INTO [SeatDetails]" +
            " VALUES("+bookid+","+seatid+")";
        SqlCommand cmd = new SqlCommand(rq, con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
}