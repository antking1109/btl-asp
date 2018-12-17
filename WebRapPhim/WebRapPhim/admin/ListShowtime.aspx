<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ListShowtime.aspx.cs" Inherits="admin_ListShowtime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Thời gian chiếu
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    Thời gian chiếu
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <div>
   <form id="form" runat="server">
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
                                    <asp:GridView ID="grvShowtime" runat="server" AutoGenerateColumns="false" Width="100%" AllowPaging="true" PageSize="10" OnPageIndexChanging="grvShowtime_PageIndexChanging">
                                        <HeaderStyle CssClass="bg-blue" Height="30px" Wrap="true"/>
                                        <RowStyle HorizontalAlign="Center" CssClass="bg-success"/>
                                        <Columns>
                                            <asp:BoundField DataField="showtimeid" HeaderText="Showtime ID" />
                                            <asp:BoundField DataField="movieid" HeaderText="Movie ID" />
                                            <asp:BoundField DataField="showtime" HeaderText="Show Time" />
                                            <asp:BoundField DataField="movietitle" HeaderText="Movie Title" />
                                            

                                            

                                            
                                            <asp:TemplateField HeaderText="Xoa_Showtime">
                                                <ItemTemplate>
                                                    <asp:Button ID="xoa" CommandName="xoa" CommandArgument='<%#Bind("showtimeid") %>'
                                                        Text="Xoa" OnCommand="XoaShowtime_Click" runat="server"
                                                        OnClientClick="return confirm ('Ban Co Muon Xoa Khong?')" />
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
  </div>
</asp:Content>

