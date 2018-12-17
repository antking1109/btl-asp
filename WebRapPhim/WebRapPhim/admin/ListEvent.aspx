<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ListEvent.aspx.cs" Inherits="admin_ListEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Danh sách Sự Kiện
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    List Events
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-xs-12">
                <div class="Box">
                    <div class="box-body">
                        <div id="a" class="dataTables_wrapper form-inline dt-bootstrap">
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:Label ID="mess" runat="server" Font-Bold="true"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <asp:GridView ID="grvEvent" runat="server" AutoGenerateColumns="false" Width="100%" AllowPaging="true" PageSize="10" OnPageIndexChanging="grvEvent_PageIndexChanging">
                                        <HeaderStyle CssClass="bg-blue" Height="30px" Wrap="true"/>
                                        <RowStyle HorizontalAlign="Center" CssClass="bg-success"/>
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="Id" />
                                            <asp:BoundField DataField="title" HeaderText="Title" />
                                            <asp:BoundField DataField="start_time" HeaderText="Start Time" />
                                            <asp:BoundField DataField="stop_time" HeaderText="Stop Time" />
                                            <asp:TemplateField HeaderText="Content">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label377" runat="server" Text='<%# Eval("content").ToString().Length > 100 ? HttpUtility.HtmlEncode(Eval("content").ToString().Substring(0, 100)+"...") : HttpUtility.HtmlEncode(Eval("content")) %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Image Thumb">
                                                <ItemTemplate>
                                                    <asp:Image ImageUrl='<%# "~/"+Eval("image_thumb") %>' Height="100px" Width="100px" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            
                                            <asp:TemplateField HeaderText="Xoa_Event">
                                                <ItemTemplate>
                                                    <asp:Button ID="xoa" CommandName="xoa" CommandArgument='<%#Bind("id") %>'
                                                        Text="Xoa" OnCommand="XoaEvent_Click" runat="server"
                                                        OnClientClick="return confirm ('Ban Co Muon Xoa Khong?')" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Sua_Event">
                                                <ItemTemplate>
                                                    <asp:Button ID="Sua" runat="server" CommandName="sua" CommandArgument='<%#Bind("id") %>'
                                                        Text="Sua" OnCommand="SuaEvent_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>