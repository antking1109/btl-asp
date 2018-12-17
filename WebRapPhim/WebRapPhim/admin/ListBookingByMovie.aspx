<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ListBookingByMovie.aspx.cs" Inherits="admin_ListBookingByMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Thống kê vé đặt theo phim
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    Thống kê vé đặt theo phim
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <form id="form1" runat="server">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <!-- /.box-header -->
                <div class="box-body">
                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row">
                            <div class="col-sm-6"></div>
                            <div class="col-sm-6"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <asp:GridView ID="grvBooking" runat="server" AutoGenerateColumns="false" Width="100%" AllowPaging="true" PageSize="10" OnPageIndexChanging="grvBooking_PageIndexChanging">
                                    <HeaderStyle CssClass="bg-blue" Height="30px" Wrap="true"/>
                                    <RowStyle HorizontalAlign="Center" CssClass="bg-success"/>
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="ID"/>
                                        <asp:BoundField DataField="movieTitle" HeaderText="Tên Phim"/>
                                        <asp:BoundField DataField="userFullName" HeaderText="Người Đặt" />
                                        <asp:BoundField DataField="showtimeTime" HeaderText="Thời Gian Chiếu" />
                                        <asp:BoundField DataField="bookingSeat" HeaderText="Ghế Đặt" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    </form>
</asp:Content>

