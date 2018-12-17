<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true" CodeFile="MovieDetail.aspx.cs" Inherits="MovieDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Chi tiet phim
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <asp:ListView ID="lvMovie" runat="server">
        <ItemTemplate>
        <section class="breadcrumb-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                            <center><h1><%# Eval("title") %></h1></center>
                    </div>
                </div>
            </div>
        </section>
        <section class="transformers-area">
            <div class="container">
                <div class="transformers-box">
                    <div class="row flexbox-center">
                        <div class="col-lg-5 text-lg-left text-center">
                            <div class="transformers-content">
                                <img src="<%# Eval("image_thumb") %>" alt="about">
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="transformers-content">
                                <h2><%# Eval("title") %></h2>
                                <p><%# Eval("genre") %></p>
                                <ul>
                                    <li>
                                        <div class="transformers-left">
                                            Actor:
                                        </div>
                                        <div class="transformers-right">
                                            <%# Eval("actor") %>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="transformers-left">
                                            Director:
                                        </div>
                                        <div class="transformers-right">
                                            <%# Eval("director") %>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="transformers-left">
                                            Duration:
                                        </div>
                                        <div class="transformers-right">
                                            <%# Eval("duration") %>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="transformers-left">
                                            Version:
                                        </div>
                                        <div class="transformers-right">
                                            <%# Eval("version") %>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="transformers-left">
                                            Production:
                                        </div>
                                        <div class="transformers-right">
                                            <%# Eval("production") %>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="transformers-left">
                                            Start Time:
                                        </div>
                                        <div class="transformers-right">
                                            <%# Eval("start_time") %>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="transformers-left">
                                            Stop Time:
                                        </div>
                                        <div class="transformers-right">
                                            <%# Eval("stop_time") %>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <a href='<%# "BookingStep1.aspx?id="+Eval("id") %>' class="theme-btn"><i class="icofont icofont-ticket"></i> BUY TICKET</a>
                </div>
            </div>
        </section>
        <section class="details-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="details-content">
                            <div class="details-overview">
                                <h2>Giới thiệu phim</h2>
                                <p><%# Eval("movie_detail") %></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>

