 <%@ Page Title="" Language="C#" MasterPageFile="~/SiteMasterPage.master" AutoEventWireup="true" CodeFile="BookingStep2.aspx.cs" Inherits="BookingStep2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form id="dsadasd" runat="server">
    <section class="breadcrumb-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumb-area-content">
							<h1>Chọn ghế</h1>
						</div>
					</div>
				</div>
			</div>
		</section>
    <section class="blog-details">
        <div class="container">
            <div class="row">
						            <div class="col-lg-8">
							            <div class="buy-ticket-box">
								            <h4>Buy Tickets</h4>
								            <h5><font color="white">Seat</font></h5>
								            <h6><font color="white">Screen</font></h6>
								            <div class="ticket-box-table"> 
									            <table>
										            <tbody><tr>
											            <td>A</td>
										            </tr>
										            <tr>
											            <td>B</td>
										            </tr>
										            <tr>
											            <td>C</td>
										            </tr>
										            <tr>
											            <td>D</td>
										            </tr>
									            </tbody></table>
									            <table class="ticket-table-seat">
                                                    
                                                            <tbody>
                                                            <tr>
                                                                <asp:ListView ID="dsGheA" runat="server">
                                                                    <ItemTemplate>
                                                                        <td <%# Eval("status").ToString() == "dadat" ? "class='active'" : "" %>><%# Eval("name") %></td>
                                                                    </ItemTemplate>
                                                                </asp:ListView>
										                    </tr>
                                                            <tr>
                                                                <asp:ListView ID="dsGheB" runat="server">
                                                                    <ItemTemplate>
                                                                        <td <%# Eval("status").ToString() == "dadat" ? "class='active'" : "" %>><%# Eval("name") %></input></td>
                                                                    </ItemTemplate>
                                                                </asp:ListView>
										                    </tr>
                                                                <tr>
                                                                <asp:ListView ID="dsGheC" runat="server">
                                                                    <ItemTemplate>
                                                                        <td <%# Eval("status").ToString() == "dadat" ? "class='active'" : "" %>><%# Eval("name") %></input></td>
                                                                    </ItemTemplate>
                                                                </asp:ListView>
										                    </tr>
                                                                <tr>
                                                                <asp:ListView ID="dsGheD" runat="server">
                                                                    <ItemTemplate>
                                                                        <td <%# Eval("status").ToString() == "dadat" ? "class='active'" : "" %>><%# Eval("name") %></input></td>
                                                                    </ItemTemplate>
                                                                </asp:ListView>
										                    </tr>
									                         </tbody>
                                                        
										        </table>
									            <table>
										            <tbody><tr>
											            <td>A</td>
										            </tr>
										            <tr>
											            <td>B</td>
										            </tr>
										            <tr>
											            <td>C</td>
										            </tr>
										            <tr>
											            <td>D</td>
										            </tr>
									            </tbody></table>
								            </div>
									            <table class="ticket-table-seat" border="1">
                                                    <tr>
                                                        <th>Chưa đặt</th>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                                <table class="ticket-table-seat" border="1">
                                                    <tr>
                                                        <th">Đã đặt</th>
                                                    </tr>
                                                    <tr>
                                                        <td class="active"></td>
                                                    </tr>
                                                </table>
                                            <h3>Chọn chỗ ngồi cần đặt:</h3>
                                            <asp:CheckBoxList ID="cblGhe" runat="server" TextAlign="Right" Style="text-align='left';"
                                        RepeatColumns="25" RepeatDirection="Vertical" CellPadding="5" OnSelectedIndexChanged="cblGhe_SelectedIndexChanged">
                                            </asp:CheckBoxList>
                                            <asp:Button ID="btnDatVe" runat="server" Text="Đặt vé" class="theme-btn" BackColor="#009900" BorderColor="#0033CC" BorderStyle="Solid" Font-Bold="True" ForeColor="White" OnClick="btnDatVe_Click"/>
                                            <asp:Label ID="mess" runat="server"></asp:Label>
							            </div>
						            </div>
						            <div class="col-lg-3 offset-lg-1">
                                        <asp:ListView ID="lvInfo" runat="server">
                                            <ItemTemplate>
                                                <div class="buy-ticket-box mtr-30">
								                    <h4>Thông tin chi tiết</h4>
								                    <ul>
									                    <li>
										                    <p>Địa Chỉ</p>
										                    <span>Rạp Phim MoviePoint</span>
									                    </li>
									                    <li>
										                    <p>Thời gian</p>
										                    <span><%# Eval("showtime") %></span>
									                    </li>
									                    <li>
										                    <p>Tên phim</p>
										                    <span><%# Eval("movietitle") %></span>
									                    </li>
									                    <li>
										                    <p>Gía vé 1 ghế</p>
										                    <span><%# Eval("price") %></span>
									                    </li>
								                    </ul>
							                    </div>
                                            </ItemTemplate>
                                        </asp:ListView>
						            </div>
			</div>
        </div>
    </section>
        </form>
</asp:Content>

