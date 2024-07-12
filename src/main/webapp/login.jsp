<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="DAO.*,Beans.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title>Search Results - Ace Admin</title>

        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <!-- bootstrap & fontawesome -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />

        <!-- page specific plugin styles -->
        <link rel="stylesheet" href="assets/css/select2.min.css" />
        <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />

        <!-- text fonts -->
        <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

        <!-- ace styles -->
        <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

        <style>
            .spinbox-buttons .btn {
                display: flex;
                align-items: center;
                justify-content: center;
            }
        </style>
        <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
        <script src="assets/js/ace-extra.min.js"></script>
        <script src="
                https://cdn.jsdelivr.net/npm/sweetalert2@11.12.2/dist/sweetalert2.all.min.js
        "></script>
        <link href="
              https://cdn.jsdelivr.net/npm/sweetalert2@11.12.2/dist/sweetalert2.min.css
              " rel="stylesheet">
    </head>

    <body class="no-skin">
        <div class="main-container ace-save-state" id="main-container">
            <script type="text/javascript">
                        try {
                        ace.settings.loadState("main-container");
                        } catch (e) {
                }
            </script>

            <div class="main-content">
                <div class="main-content-inner">
                    <div class="page-content">
                        <div class="page-header">
                            <h1>ECOMERCE CELUMAX</h1>
                        </div>
                        <!-- /.page-header -->

                        <div class="row">
                            <div class="col-xs-12">
                                <!-- PAGE CONTENT BEGINS -->
                                <div>
                                    <div class="row search-page" id="search-page-1">
                                        <div class="col-xs-12">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-4">


                                                </div>

                                                <div class="col-xs-12 col-sm-4">

                                                    <div class="widget-body">
                                                        <div class="widget-main">
                                                            <h4 class="header blue lighter bigger">
                                                                <i class="ace-icon fa fa-shopping-cart green"></i>
                                                                Ingresar a la Pagina Ecomerce
                                                            </h4>

                                                            <div class="space-6"></div>

                                                            <form action="login" method="post">
                                                                <fieldset>
                                                                    <label class="block clearfix">
                                                                        <span class="block input-icon input-icon-right">
                                                                            <input type="text" class="form-control" placeholder="Usuario" id="username"
                                                                                   name="username">
                                                                            <i class="ace-icon fa fa-user"></i>
                                                                            <kpm-field-badge type="default" loading="false" menu-type="login" class="kpm_input-field-button kpm_gray-key-icon" style="z-index: 4 !important;"></kpm-field-badge></span>
                                                                    </label>

                                                                    <label class="block clearfix">
                                                                        <span class="block input-icon input-icon-right">
                                                                            <input type="password" class="form-control" placeholder="Contraseña" id="password"
                                                                                   name="password">
                                                                            <i class="ace-icon fa fa-lock"></i>
                                                                            <kpm-field-badge type="default" loading="false" menu-type="login" class="kpm_input-field-button kpm_gray-key-icon" style="z-index: 4 !important;"></kpm-field-badge></span>
                                                                    </label>

                                                                    <div class="space"></div>

                                                                    <div class="clearfix">


                                                                        <button type="submit" value="login" class="width-35 pull-right btn btn-sm btn-primary">
                                                                            <i class="ace-icon fa fa-key"></i>
                                                                            <span class="bigger-110">Login</span>
                                                                        </button>
                                                                    </div>

                                                                    <div class="space-4"></div>
                                                                </fieldset>
                                                            </form>


                                                            <% if (request.getParameter("error") != null) { %>
                                                            <span class="bigger-110"> <p style="color:red;">Usuario y/o contraseña Invalido.</p></span>
                                                            <% }%>


                                                        </div><!-- /.widget-main -->

                                                        <div class="toolbar clearfix">

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-4">


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- PAGE CONTENT ENDS -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.page-content -->
                </div>
            </div>
            <!-- /.main-content -->

            <div class="footer">
                <div class="footer-inner">
                    <div class="footer-content">
                        <span class="bigger-120">
                            <span class="blue bolder">ECOMERCE CELUMAX</span>
                            Application &copy; 2024
                        </span>

                        &nbsp; &nbsp;
                        <span class="action-buttons">
                            <a href="#">
                                <i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
                            </a>

                            <a href="#">
                                <i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
                            </a>

                            <a href="#">
                                <i class="ace-icon fa fa-rss-square orange bigger-150"></i>
                            </a>
                        </span>
                    </div>
                </div>
            </div>

            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
            </a>
        </div>

        <script src="assets/js/jquery-2.1.4.min.js"></script>

        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
        <script src="assets/js/dataTables.buttons.min.js"></script>
        <script src="assets/js/buttons.flash.min.js"></script>
        <script src="assets/js/buttons.html5.min.js"></script>
        <script src="assets/js/buttons.print.min.js"></script>
        <script src="assets/js/buttons.colVis.min.js"></script>
        <script src="assets/js/dataTables.select.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- page specific plugin scripts -->
        <script src="assets/js/tree.min.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/jquery-ui.custom.min.js"></script>
        <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
        <script src="assets/js/holder.min.js"></script>

        <!-- ace scripts -->
        <script src="assets/js/ace-elements.min.js"></script>
        <script src="assets/js/ace.min.js"></script>
    </body>
</html>