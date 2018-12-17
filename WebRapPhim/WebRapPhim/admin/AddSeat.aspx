<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddSeat.aspx.cs" Inherits="admin_AddSeat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add Seat
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    Add Seat
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
                            <label>Tên Ghế</label>
                            <asp:TextBox runat="server" ID="txtTenGhe" class="form-control" type="text" placeholder="Enter seat name" />
                        </div>
                    </div>
                    <div class="box-footer">
                        <asp:Button ID="btnThem" runat="server" Text="Thêm" class="btn btn-primary" OnClick="btnThem_Click" />
                    </div>
                    </form>
                </div>
            </div>
        </div>
</asp:Content>

