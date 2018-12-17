<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Setting.aspx.cs" Inherits="admin_Setting" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Cài đặt website
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    Cài đặt website
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <div class="row">
    <!-- left column -->
    <div class="col-md-12">
        <!-- general form elements -->
        <div class="box box-primary">
            <div class="box-header with-border">
                <asp:Label ID="mess" runat="server" />
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" runat="server">
                <div class="box-body">
                    <div class="form-group">
                        <label>Title</label>
                        <asp:TextBox ID="txtTitle" runat="server" class="form-control" placeholder="Enter title"/>
                    </div>
                    <div class="form-group">
                        <label>Describe</label>
                        <asp:TextBox ID="txtDescribe" runat="server" class="form-control" placeholder="Enter Describe"/>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">Logo web</label>
                        <asp:Image ID="imgLogo" runat="server" Width="150px" Height="75px" />
                        <asp:FileUpload ID="fileLogo" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Link Youtube</label>
                        <asp:TextBox ID="txtYoutube" runat="server" class="form-control" placeholder="Enter Link Youtube"/>
                    </div>
                    <div class="form-group">
                        <label>Link facebook</label>
                        <asp:TextBox ID="txtFacebook" runat="server" class="form-control" placeholder="Enter Link facebook"/>
                    </div>
                    <div class="form-group">
                        <label>Link instagram</label>
                        <asp:TextBox ID="txtInstagram" runat="server" class="form-control" placeholder="Enter Link instagram"/>
                    </div>
                    <div class="form-group">
                        <label>Link zalo</label>
                        <asp:TextBox ID="txtZalo" runat="server" class="form-control" placeholder="Enter Link zalo"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Code Footer</label><br />
                        <textarea id="txtCodeFooter" runat="server" rows="10" cols="150"></textarea>
                    </div>
                    
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <asp:Button ID="btnSua" class="btn btn-primary" runat="server" Text="Sửa" OnClick="btnSua_Click"/>
                </div>
            </form>
        </div>
    </div>
</div>
</asp:Content>

