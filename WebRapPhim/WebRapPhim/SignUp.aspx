﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Đăng ký tài khoản</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
</head>

<body>
    <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">Đăng ký tài khoản</h2>
                    <form id="formReg" runat="server">
                        <div>
                            <asp:Label ID="mess" runat="server"/>
                        </div>
                        <div class="input-group">
                            <asp:TextBox ID="txtFullName" runat="server" class="input--style-1" type="text" placeholder="Họ và tên"/>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <asp:TextBox ID="txtEmail" runat="server" class="input--style-1" type="email" placeholder="Email"/>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <asp:DropDownList ID="ddlGender" runat="server">
                                            <asp:ListItem disabled="disabled" selected="selected">Giới tính</asp:ListItem>
                                            <asp:ListItem>Nam</asp:ListItem>
                                            <asp:ListItem>Nữ</asp:ListItem>
                                        </asp:DropDownList>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="input-group">
                            <asp:TextBox ID="txtPhone" class="input--style-1" type="text" placeholder="Số điện thoại" runat="server"/>
                        </div>
                        <div class="input-group">
                            <asp:TextBox ID="txtPassword" class="input--style-1" type="password" placeholder="Mật Khẩu" runat="server" />
                        </div>
                        <div class="p-t-20">
                            <asp:Button ID="btnDK" runat="server" class="btn btn--radius btn--green" Text="Đăng ký" OnClick="btnDK_Click" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->

