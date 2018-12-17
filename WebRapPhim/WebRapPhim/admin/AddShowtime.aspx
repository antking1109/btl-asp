<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddShowtime.aspx.cs" Inherits="admin_AddShowtime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Thêm thời gian chiếu
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    Thêm thời gian chiếu
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <asp:Label ID="mess" runat="server"/>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form" runat="server">
                    <div class="box-body">
                        <div class="form-group">
                            <label>Thời gian chiếu </label><br />
                            <label>Ngày</label>
                            <br />
                            <asp:Calendar ID="txtNgay" runat="server"></asp:Calendar>
                            <label>Giờ</label>
                            <br />
                            <asp:DropDownList ID="ddlGio" runat="server">
                                <asp:ListItem>07:30:00 AM</asp:ListItem>
                                <asp:ListItem>09:30:00 AM</asp:ListItem>
                                <asp:ListItem>7:00:00 PM</asp:ListItem>
                                <asp:ListItem>9:00:00 PM</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <asp:Button ID="btnThem" runat="server" Text="Thêm" class="btn btn-primary" OnClick="btnThem_Click" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>

