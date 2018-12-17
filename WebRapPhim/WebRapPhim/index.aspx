<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Trang Chủ Rạp Phim
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <section class="hero-area" id="home">
			<div class="container">
				<div class="hero-area-slider">
                    <asp:ListView ID="dsPhimDangChieu" runat="server">
                        <ItemTemplate>
                            <div class="row hero-area-slide">
						        <div class="col-lg-6 col-md-5">
							        <div class="hero-area-content">
								        <img src='<%# Eval("image_thumb") %>' alt="about" />
							        </div>
						        </div>
						        <div class="col-lg-6 col-md-7">
							        <div class="hero-area-content pr-50">
								        <h2><%# Eval("title") %></h2>
								        <div class="review">
									        <div class="author-review">
										        <i class="icofont icofont-star"></i>
										        <i class="icofont icofont-star"></i>
										        <i class="icofont icofont-star"></i>
										        <i class="icofont icofont-star"></i>
										        <i class="icofont icofont-star"></i>
									        </div>
								        </div>
								        <p><%# Eval("movie_detail").ToString().Length > 250 ? HttpUtility.HtmlEncode(Eval("movie_detail").ToString().Substring(0, 250)+"...") : HttpUtility.HtmlEncode(Eval("movie_detail")) %></p>
								        <h3>Diễn Viên:</h3>
								        <div class="slide-cast">
									        <%# Eval("actor") %>
								        </div>
								        <div class="slide-trailor">
									        <a class="theme-btn theme-btn2" href='<%# "MovieDetail.aspx?id="+Eval("id") %>'><i class="icofont icofont-play"></i> Chi tiết</a>
                                                    <a class="theme-btn theme-btn2" href='<%# "BookingStep1.aspx?id="+Eval("id") %>'><i class="icofont icofont-play"></i> Đặt vé</a>
								        </div>
							        </div>
						        </div>
					        </div>
                        </ItemTemplate>
                    </asp:ListView>
				</div>
                <div class="hero-area-thumb">
					    <div class="thumb-prev">
						    <div class="row hero-area-slide">
							    <div class="col-lg-6">
								    <div class="hero-area-content">
									    <img src="assets/img/slide3.png" alt="about">
								    </div>
							    </div>
							    <div class="col-lg-6">
								    <div class="hero-area-content pr-50">
									    <h2>Last Avatar</h2>
									    <div class="review">
										    <div class="author-review">
											    <i class="icofont icofont-star"></i>
											    <i class="icofont icofont-star"></i>
											    <i class="icofont icofont-star"></i>
											    <i class="icofont icofont-star"></i>
											    <i class="icofont icofont-star"></i>
										    </div>
										    <h4>180k voters</h4>
									    </div>
									    <p>She is a devil princess from the demon world. She grew up sheltered by her parents and doesn't really know how to be evil or any of the common actions,   She is unable to cry due to Keita's accidental first wish, despite needed for him to wish...</p>
									    <h3>Cast:</h3>
									    <div class="slide-cast">
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast1.png" alt="about">
										    </div>
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast2.png" alt="about">
										    </div>
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast3.png" alt="about">
										    </div>
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast4.png" alt="about">
										    </div>
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast5.png" alt="about">
										    </div>
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast6.png" alt="about">
										    </div>
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast7.png" alt="about">
										    </div>
										    <div class="single-slide-cast text-center">
											    5+
										    </div>
									    </div>
									    <div class="slide-trailor">
										    <h3>Watch Trailer</h3>
										    <a class="theme-btn theme-btn2" href="#"><i class="icofont icofont-play"></i> Tickets</a>
									    </div>
								    </div>
							    </div>
						    </div>
					    </div>
					    <div class="thumb-next">
						    <div class="row hero-area-slide">
							    <div class="col-lg-6">
								    <div class="hero-area-content">
									    <img src="assets/img/slide1.png" alt="about">
								    </div>
							    </div>
							    <div class="col-lg-6">
								    <div class="hero-area-content pr-50">
									    <h2>The Deer God</h2>
									    <div class="review">
										    <div class="author-review">
											    <i class="icofont icofont-star"></i>
											    <i class="icofont icofont-star"></i>
											    <i class="icofont icofont-star"></i>
											    <i class="icofont icofont-star"></i>
											    <i class="icofont icofont-star"></i>
										    </div>
										    <h4>180k voters</h4>
									    </div>
									    <p>She is a devil princess from the demon world. She grew up sheltered by her parents and doesn't really know how to be evil or any of the common actions,   She is unable to cry due to Keita's accidental first wish, despite needed for him to wish...</p>
									    <h3>Cast:</h3>
									    <div class="slide-cast">
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast1.png" alt="about">
										    </div>
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast2.png" alt="about">
										    </div>
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast3.png" alt="about">
										    </div>
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast4.png" alt="about">
										    </div>
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast5.png" alt="about">
										    </div>
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast6.png" alt="about">
										    </div>
										    <div class="single-slide-cast">
											    <img src="assets/img/cast/cast7.png" alt="about">
										    </div>
										    <div class="single-slide-cast text-center">
											    5+
										    </div>
									    </div>
									    <div class="slide-trailor">
										    <h3>Watch Trailer</h3>
										    <a class="theme-btn theme-btn2" href="#"><i class="icofont icofont-play"></i> Tickets</a>
									    </div>
								    </div>
							    </div>
						    </div>
					    </div>
				    </div>
			</div>
		</section><!-- hero area end -->
    <section class="portfolio-area pt-60">
			<div class="container">
				<div class="row flexbox-center">
					<div class="col-lg-6 text-center text-lg-left">
					    <div class="section-title">
							<h1><i class="icofont icofont-movie"></i> Danh sách phim</h1>
						</div>
					</div>
					<div class="col-lg-6 text-center text-lg-right">
					    <div class="portfolio-menu">
							<ul>
								<li data-filter="*" class="active">Tất cả phim</li>
								<li data-filter=".soon">Phim đang chiếu</li>
								<li data-filter=".top">Phim sắp chiếu</li>
							</ul>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-9">
						<div class="row portfolio-item" style="position: relative; height: 1093.84px;">
                            <asp:ListView ID="dspDangChieu" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-4 col-sm-6 soon" style="position: absolute; left: 0px; top: 0px;">
								        <div class="single-portfolio">
									        <div class="single-portfolio-img">
										        <img src='<%# Eval("image_thumb") %>'' alt="portfolio">
										        <a href='<%# "MovieDetail.aspx?id="+Eval("id") %>' class="popup-youtube">
											        <i class="icofont icofont-ui-play"></i>
										        </a>
									        </div>
									        <div class="portfolio-content">
										        <h2><%# Eval("title") %></h2>
										        <div class="review">
											        <div class="author-review">
												        <i class="icofont icofont-star"></i>
												        <i class="icofont icofont-star"></i>
												        <i class="icofont icofont-star"></i>
												        <i class="icofont icofont-star"></i>
												        <i class="icofont icofont-star"></i>
											        </div><br />
											        <a class="theme-btn theme-btn2" href='<%# "MovieDetail.aspx?id="+Eval("id") %>'><i class="icofont icofont-play"></i> Chi tiết</a>
                                                    <a class="theme-btn theme-btn2" href='<%# "BookingStep1.aspx?id="+Eval("id") %>'><i class="icofont icofont-play"></i> Đặt vé</a>
										        </div>
									        </div>
								        </div>
							        </div>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:ListView ID="dspSapChieu" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-4 col-sm-6 top" style="position: absolute; left: 0px; top: 0px;">
								        <div class="single-portfolio">
									        <div class="single-portfolio-img">
										        <img src='<%# Eval("image_thumb") %>'' alt="portfolio">
										        <a href='<%# "MovieDetail.aspx?id="+Eval("id") %>' class="popup-youtube">
											        <i class="icofont icofont-ui-play"></i>
										        </a>
									        </div>
									        <div class="portfolio-content">
										        <h2><%# Eval("title") %></h2>
										        <div class="review">
											        <div class="author-review">
												        <i class="icofont icofont-star"></i>
												        <i class="icofont icofont-star"></i>
												        <i class="icofont icofont-star"></i>
												        <i class="icofont icofont-star"></i>
												        <i class="icofont icofont-star"></i>
											        </div><br />
											        <a class="theme-btn theme-btn2" href='<%# "MovieDetail.aspx?id="+Eval("id") %>'><i class="icofont icofont-play"></i> Chi tiết</a>
                                                    <a class="theme-btn theme-btn2" href='<%# "BookingStep1.aspx?id="+Eval("id") %>'><i class="icofont icofont-play"></i> Đặt vé</a>
										        </div>
									        </div>
								        </div>
							        </div>
                                </ItemTemplate>
                            </asp:ListView>
						</div>
					</div>
					<div class="col-lg-3 text-center text-lg-left">
					    <div class="portfolio-sidebar">
                            <asp:ListView ID="dsSuKien" runat="server">
                                <ItemTemplate><a href='<%# "EventDetail.aspx?id="+Eval("id") %>'><img src='<%# Eval("image_thumb") %>' /></a></ItemTemplate>
                            </asp:ListView>
						</div>
					</div>
				</div>
			</div>
		</section>
</asp:Content>

