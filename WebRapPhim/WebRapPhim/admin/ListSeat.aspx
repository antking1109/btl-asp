<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ListSeat.aspx.cs" Inherits="admin_ListSeat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    List Seat
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    List Seat
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
                                <div class="col-sm-4"></div>
                                <div class="col-sm-4">
                                    <asp:GridView ID="grvSeat" runat="server" AutoGenerateColumns="false" Width="100%" AllowPaging="true" PageSize="20" OnPageIndexChanging="grvSeat_PageIndexChanging">
                                        <HeaderStyle CssClass="bg-blue" Height="30px" Wrap="true"/>
                                        <RowStyle HorizontalAlign="Center" CssClass="bg-success"/>
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="ID"/>
                                            <asp:BoundField DataField="name" HeaderText="Name"/>
                                            <asp:TemplateField HeaderText="Chức năng">
                                                <ItemTemplate>
                                                    <asp:Button ID="btnXoa" Text="Xóa" CommandName="xoa" 
                                                        CommandArgument='<%#Bind("id") %>' OnCommand="btnXoa_Click"
                                                        OnClientClick="return confirm('Bạn có xác nhận muốn xóa không?. Lưu ý khi xóa sẽ xóa tất cả các dữ liệu liên quan đến ghế này.')"
                                                        runat="server" CssClass="btn-danger"/>
                                                    <asp:Button ID="btnSua" Text="Sửa" CommandName="sua"
                                                        CommandArgument='<%#Bind("id") %>' OnCommand="btnSua_Click" runat="server" CssClass="btn-warning"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="col-sm-4"></div>
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

