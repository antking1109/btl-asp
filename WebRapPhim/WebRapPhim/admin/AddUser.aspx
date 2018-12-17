<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="admin_AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add User
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
    Add User
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="box box-primary">
                    <div class="box-header with-border">
                      <asp:Label ID="mess" runat="server" Font-Bold="true"/>
                    </div>
                    <!-- form start -->
                    <form role="form" runat="server">
                        <div class="box-body">
                            <div class="form-group">
                                <label>Email Address</label>
                                <asp:TextBox ID="txtEmail" runat="server" type="email" class="form-control" placeholder="Enter email"/>
                            </div>
                            <div class="form-group">
                                <label>Full Name</label>
                                <asp:TextBox ID="txtFullName" runat="server" type="text" class="form-control" placeholder="Enter full name"/>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" type="password" class="form-control" placeholder="Enter password"/>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <asp:TextBox ID="txtPhone" runat="server" type="text" class="form-control" placeholder="Enter phone number"/>
                            </div>
                            <div class="form-group">
                                <label>Gender</label>
                                <asp:DropDownList ID="ddlGT" runat="server" class="form-control">
                                    <asp:ListItem Text="Nam" Value="Nam"></asp:ListItem>
                                    <asp:ListItem Text="Nữ" Value="Nữ"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="cbAdmin" Text="Is Admin" runat="server" />
                                </label>
                            </div>
                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">
                            <asp:Button ID="btnAddUser" runat="server" Text="Add User" class="btn btn-primary" OnClick="btnAddUser_Click"/>
                        </div>
                    </form>
                </div>
        </div>
    </div>
</asp:Content>

