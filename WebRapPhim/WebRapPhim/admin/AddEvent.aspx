<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddEvent.aspx.cs" Inherits="admin_AddEvent" ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Them Su Kien
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    Them Su Kien
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
                            <label>Title (Tiêu đề sự kiện)</label>
                            <asp:TextBox runat="server" ID="txtTitle" class="form-control" type="text" placeholder="Enter title" />
                        </div>
                        <div class="form-group">
                            <label>Start Time (Time bắt đầu)</label>
                            <div class="input-group">
                              <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                              </div>
                              <asp:TextBox ID="txtStartTime" runat="server" type="text" class="form-control" textmode="Date"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Stop Time (Time kết thúc)</label>
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
                            <label>Upload image thumb (Tải lên ảnh sự kiện)</label>
                            <asp:FileUpload ID="txtfileImage" runat="server"/>
                            <p class="help-block">Tệp tin phải là ảnh.</p>
                        </div>
                    </div>
                    
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <asp:Button ID="btnThem" runat="server" Text="Thêm" class="btn btn-primary" OnClick="ThemEvent_Click" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>