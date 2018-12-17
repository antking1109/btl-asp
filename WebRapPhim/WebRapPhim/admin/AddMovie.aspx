<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddMovie.aspx.cs" Inherits="admin_AddMovie" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add Movie  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    Add Movie
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
                            <label>Title (Tiêu đề phim)</label>
                            <asp:TextBox runat="server" ID="txtTitle" class="form-control" type="text" placeholder="Enter title" />
                        </div>
                        <div class="form-group">
                            <label>Start Time (Ngày khởi chiếu)</label>
                            <div class="input-group">
                              <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </div>
                              <asp:TextBox ID="txtStartTime" runat="server" type="text" class="form-control" textmode="Date"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Stop Time (Ngày kết thúc)</label>
                            <div class="input-group">
                              <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </div>
                              <asp:TextBox ID="txtStopTime" runat="server" type="text" class="form-control" textmode="Date"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Genre (Thể loại phim)</label>
                            <asp:TextBox runat="server" ID="txtGenre" class="form-control" type="text" placeholder="Enter genre" />
                        </div>
                        <div class="form-group">
                            <label>Actor (Diễn viên)</label>
                            <asp:TextBox runat="server" ID="txtActor" class="form-control" type="text" placeholder="Enter actor" />
                        </div>
                        <div class="form-group">
                            <label>Director (Đạo diễn)</label>
                            <asp:TextBox runat="server" ID="txtDiretor" class="form-control" type="text" placeholder="Enter Director" />
                        </div>
                        <div class="form-group">
                            <label>Duration (Thời lượng)</label>
                            <asp:TextBox runat="server" ID="txtDuration" class="form-control" type="text" placeholder="Enter duration" />
                        </div>
                        <div class="form-group">
                            <label>Version</label>
                            <asp:TextBox runat="server" ID="txtVersion" class="form-control" type="text" placeholder="Enter Version" />
                        </div>
                        <div class="form-group">
                            <label>Production (Sản xuất)</label>
                            <asp:TextBox runat="server" ID="txtProduction" class="form-control" type="text" placeholder="Enter Production" />
                        </div>
                        <div class="form-group">
                            <label>Price (Gía vé)</label>
                            <asp:TextBox runat="server" ID="txtPrice" class="form-control" type="text" placeholder="Enter price" />
                        </div>
                        <div class="form-group">
                            <label>Upload image thumb (Tải lên ảnh phim)</label>
                            <asp:FileUpload ID="fileImage" runat="server"/>
                            <p class="help-block">Tệp tin phải là ảnh.</p>
                        </div>
                        <div class="form-group">
                            <label>Movie Detail (Chi tiết phim)</label><br />
                            <textarea runat="server" name="txtMovielDetail" id="txtMovielDetail" rows="10" cols="80">

                            </textarea>
                            <script>
                                // Replace the <textarea id="editor1"> with a CKEditor
                                // instance, using default configuration.
                                CKEDITOR.replace( 'content_txtMovielDetail' );
                            </script>
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <asp:Button ID="btnThem" runat="server" Text="Thêm" class="btn btn-primary" OnClick="btnThem_Click"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>

