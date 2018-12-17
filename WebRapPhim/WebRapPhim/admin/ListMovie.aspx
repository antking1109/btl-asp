<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ListMovie.aspx.cs" Inherits="admin_ListMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    List Movie
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    List Movie
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
                                <div class="col-sm-12">
                                    <asp:Label ID="mess" runat="server" Font-Bold="true"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:GridView ID="grvMovie" runat="server" AutoGenerateColumns="false" Width="100%" AllowPaging="true" PageSize="10" OnPageIndexChanging="grvMovie_PageIndexChanging">
                                        <HeaderStyle CssClass="bg-blue" Height="30px" Wrap="true"/>
                                        <RowStyle HorizontalAlign="Center" CssClass="bg-success"/>
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID"/>
                                            <asp:BoundField DataField="title" HeaderText="Title" />
                                            <asp:BoundField DataField="start_time" HeaderText="Start Time" />
                                            <asp:BoundField DataField="stop_time" HeaderText="Stop Time" />
                                            <asp:BoundField DataField="genre" HeaderText="Genre" />
                                            <asp:BoundField DataField="actor" HeaderText="Actor" />
                                            <asp:BoundField DataField="director" HeaderText="Director" />
                                            <asp:BoundField DataField="duration" HeaderText="Duration" />
                                            <asp:BoundField DataField="version" HeaderText="Version" />
                                            <asp:BoundField DataField="production" HeaderText="Production" />
                                            <asp:BoundField DataField="price" HeaderText="Price" />
                                            <asp:TemplateField HeaderText="Movie Detail">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label377" runat="server" Text='<%# Eval("movie_detail").ToString().Length > 100 ? HttpUtility.HtmlEncode(Eval("movie_detail").ToString().Substring(0, 100)+"...") : HttpUtility.HtmlEncode(Eval("movie_detail")) %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Image Thumb">
                                                <ItemTemplate>
                                                    <asp:Image ImageUrl='<%# "~/"+Eval("image_thumb") %>' Height="100px" Width="100px" runat="server"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Chức năng">
                                                <ItemTemplate>
                                                    <asp:Button ID="btnXoa" Text="Xóa" CommandName="xoa" 
                                                        CommandArgument='<%#Bind("id") %>' OnCommand="btnXoa_Click"
                                                        OnClientClick="return confirm('Bạn có xác nhận muốn xóa không?. Lưu ý khi xóa sẽ xóa tất cả các dữ liệu liên quan đến phim này.')"
                                                        runat="server" CssClass="btn-danger"/>
                                                    <asp:Button ID="btnSua" Text="Sửa" CommandName="sua"
                                                        CommandArgument='<%#Bind("id") %>' OnCommand="btnSua_Click" runat="server" CssClass="btn-warning"/>
                                                    <asp:Button ID="btnThongKe" Text="Thống Kê Vé" CommandName="thongke"
                                                        CommandArgument='<%#Bind("id") %>' OnCommand="btnThongKe_Click" runat="server" CssClass="btn-success"/>
                                                    <asp:Button ID="btnThemShowtime" Text="Thêm Showtime" CommandName="them"
                                                        CommandArgument='<%#Bind("id") %>' OnCommand="btnThem_Click" runat="server"
                                                          CssClass="btn-success" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
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

