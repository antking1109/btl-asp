<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditEvent.aspx.cs" Inherits="admin_EditEvent" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Sua Su Kien
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    Sua Su Kien
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
                            <label>ID: </label>
                            <asp:Label ID="txtID" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>Title (Tiêu đề sự kiện)</label>
                            <asp:TextBox runat="server" ID="txtTitle" class="form-control" type="text" placeholder="Enter title" />
                        </div>
                        <div class="form-group">
                            <label>Start Time (Time bắt đầu). Cũ :<asp:Label ID="oldStartTime" runat="server" />. Để nguyên dưới nếu không muốn thay đổi.</label>
                            <div class="input-group">
                              <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </div>
                              <asp:TextBox ID="txtStartTime" runat="server" type="text" class="form-control" textmode="Date"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Stop Time (Time kết thúc). Cũ :<asp:Label ID="oldStopTime" runat="server" />. Để nguyên dưới nếu không muốn thay đổi.</label>
                            <div class="input-group">
                              <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </div>
                              <asp:TextBox ID="txtStopTime" runat="server" type="text" class="form-control" textmode="Date"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Content (Chi tiết sự kiện)</label><br />
                            <textarea runat="server" name="txtContent" id="txtContent" rows="10" cols="80">

                            </textarea>
                            <script>
                                // Replace the <textarea id="editor1"> with a CKEditor
                                // instance, using default configuration.
                                CKEDITOR.replace( 'content_txtContent' );
                            </script>
                        </div>
                        <div class="form-group">
                            <label>Upload image thumb (Tải lên ảnh phim)</label><br />
                            <asp:Image ID="imageThumb" runat="server" Width="250px" Height="100px"/>
                            <asp:FileUpload ID="txtfileImage" runat="server"/>
                            <p class="help-block">Tệp tin phải là ảnh. Chọn ảnh mới nếu muốn sửa ảnh.</p>
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <asp:Button ID="btnSua" runat="server" Text="Sửa" class="btn btn-primary" OnClick="SuaEvent_Click" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>

