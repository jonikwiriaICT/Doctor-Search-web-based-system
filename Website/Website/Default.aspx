<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />
    <title>Doctor Search using Fuzzy Search Classifier</title>
    <!-- Favicons -->
    <link type="image/x-icon" href="assets/img/favicon.png" rel="icon" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css" />
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css" />
    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/style.css" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
</head>
<body>
    <form id="form1" runat="server" class="main-wrapper">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Header -->
        <header class="header">
            <nav class="navbar navbar-expand-lg header-nav">
                <div class="navbar-header">
                    <a id="mobile_btn" href="javascript:void(0);">
                        <span class="bar-icon">
                            <span></span>
                            <span></span>
                            <span></span>
                        </span>
                    </a>
                    <a href="index" class="navbar-brand logo">
                        <img src="assets/img/logo.png" class="img-fluid" alt="Logo" />
                    </a>
                </div>
                <div class="main-menu-wrapper">
                    <div class="menu-header">
                        <a href="index" class="menu-logo">
                            <img src="assets/img/logo.png" class="img-fluid" alt="Logo" />
                        </a>
                        <a id="menu_close" class="menu-close" href="javascript:void(0);">
                            <i class="fas fa-times"></i>
                        </a>
                    </div>
                    <ul class="main-nav">
                        <li class="active">
                            <a href="index">Home</a>
                        </li>
                    </ul>
                </div>

            </nav>
        </header>
        <!-- /Header -->

        <!-- Home Banner -->
        <section class="section section-search">
            <div class="container-fluid">
                <div class="banner-wrapper">
                    <br />
                    <asp:Panel ID="pnlAlert" runat="server" CssClass="alert alert-danger" Visible="false">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <span id="spIcon" runat="server"></span>
                        <asp:Label ID="lblMsg" CssClass="text-white " runat="server" Text=""></asp:Label>
                    </asp:Panel>
                    <div class="banner-header text-center">
                        <h1>Search Doctor using Fuzzy Search Classifier</h1>
                        <p>Testing dataset from data govt (2021)</p>
                    </div>

                    <!-- Search -->
                    <div class="search-box">

                        <div class="row text-center ">
                            &nbsp	&nbsp	&nbsp	&nbsp	&nbsp	&nbsp
									&nbsp	&nbsp	&nbsp	&nbsp	&nbsp	&nbsp	&nbsp
								<div class="form-group input-group  search-info">
                                    <input type="text" runat="server" id="Search" class="form-control" placeholder="Search for your doctor here." />

                                </div>
                            <button type="submit" runat="server" onserverclick="SearchForDoctor" class="btn btn-primary search-btn"><i class="fas fa-search"></i><span>Search Doctor</span></button>
                        </div>
                    </div>
                    <!-- /Search -->

                </div>
            </div>
        </section>

        <section class="section section-doctor">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-lg-12">
                        <div class="doctor-slider slider">
                            <asp:ListView ID="ltDoctor" runat="server">
                                <ItemTemplate>
                                    <div class="profile-widget">
                                        <div class="doc-img">
                                            <a href="#">
                                                <img class="img-fluid" alt="User Image"  src="<%#Eval("ProfilePic")%>">
                                            </a>
                                            <a href="javascript:void(0)" class="fav-btn">
                                                <i class="far fa-bookmark"></i>
                                            </a>
                                        </div>
                                        <div class="pro-content">
                                            <h3 class="title">
                                                <a href="#"><%#Eval("FirstName") %></a>
                                                <i class="fas fa-check-circle verified"></i>
                                            </h3>
                                            <p class="speciality"><%#Eval("Specialisation") %></p>
                                            <div class="rating">
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star filled"></i>
                                                <i class="fas fa-star"></i>
                                                <span class="d-inline-block average-rating">(49)</span>
                                            </div>
                                            <ul class="available-info">
                                                <li>
                                                    <i class="fas fa-map-marker-alt"></i>California, USA
                                                </li>
                                                <li>
                                                    <i class="far fa-clock"></i>Available on Fri, 22 Mar
                                                </li>
                                                <li>
                                                    <i class="far fa-money-bill-alt"></i><%#Eval("Pricing") %>
                                                    <i class="fas fa-info-circle" data-toggle="tooltip" title="Lorem Ipsum"></i>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:ListView>
                            <!-- Doctor Widget -->
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer class="footer">
            <div class="footer-bottom">
                <div class="container-fluid">
                    <div class="copyright">
                        <div class="row">
                            <div class="col-md-6 col-lg-6">
                                <div class="copyright-text">
                                    <p class="mb-0"><a href="index">Department of Computer Science and Information Technology designed by Alao Ezekiel</a></p>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6">

                                <!-- Copyright Menu -->
                                <div class="copyright-menu">
                                    <ul class="policy-menu">
                                        <li><a href="index">Terms and Conditions</a></li>
                                        <li><a href="index">Policy</a></li>
                                    </ul>
                                </div>
                                <!-- /Copyright Menu -->

                            </div>
                        </div>
                    </div>
                    <!-- /Copyright -->

                </div>
            </div>
            <!-- /Footer Bottom -->
        </footer>
        <!-- /Footer -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/slick.js"></script>
        <script src="assets/js/script.js"></script>
    </form>
</body>
</html>
