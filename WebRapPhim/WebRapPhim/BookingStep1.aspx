<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true" CodeFile="BookingStep1.aspx.cs" Inherits="BookingStep1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Bước 1: Chọn Lịch Chiếu
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <section class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumb-area-content">
							<h1>Chọn lịch chiếu phim</h1>
						</div>
					</div>
				</div>
			</div>
		</section>
    <form id="form1" runat="server">
    <section class="blog-details">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="news-details">
							<div class="single-news">
                                <h2>Vui lòng chọn lịch chiếu mà bạn muốn đặt vé</h2>
							    <br />
                                <asp:DropDownList ID="ddlDSLichChieu" runat="server">
                                </asp:DropDownList>
							    <br />
                                <asp:Button ID="btnBuocTiep" runat="server" BackColor="#009900" BorderColor="#000099" Font-Bold="True" ForeColor="White" Text="Bước Tiếp Theo" OnClick="btnBuocTiep_Click" />
                                
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
    </form>
</asp:Content>

