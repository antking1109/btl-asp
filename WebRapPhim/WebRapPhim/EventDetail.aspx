<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true" CodeFile="EventDetail.aspx.cs" Inherits="EventDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Chi tiet su kien
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <asp:ListView ID="lvSuKien" runat="server">
        <ItemTemplate>
            <section class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumb-area-content">
							<h1><%# Eval("title") %></h1>
						</div>
					</div>
				</div>
			</div>
		</section>
    <section class="blog-details">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="news-details">
							<div class="single-news">
								<div class="news-bg-3">
								</div>
								<div class="news-date">
									Bắt đầu: <%# Eval("start_time") %><br />
                                    Kết thúc: <%# Eval("stop_time") %>
								</div>
							</div>
							<h2><%# Eval("title") %></h2>
							<p><%# Eval("content") %></p>
						</div>
					</div>
				</div>
			</div>
		</section>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>

