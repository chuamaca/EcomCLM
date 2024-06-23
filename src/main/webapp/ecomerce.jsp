<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="DAO.*,Beans.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title>Search Results - Ace Admin</title>

        <meta name="description" content="" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0"
            />

        <!-- bootstrap & fontawesome -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />

        <!-- page specific plugin styles -->
        <link rel="stylesheet" href="assets/css/select2.min.css" />
        <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />

        <!-- text fonts -->
        <link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

        <!-- ace styles -->
        <link
            rel="stylesheet"
            href="assets/css/ace.min.css"
            class="ace-main-stylesheet"
            id="main-ace-style"
            />

        <!--[if lte IE 9]>
          <link
            rel="stylesheet"
            href="assets/css/ace-part2.min.css"
            class="ace-main-stylesheet"
          />
        <![endif]-->
        <link rel="stylesheet" href="assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

        <!--[if lte IE 9]>
          <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
        <![endif]-->

        <!-- inline styles related to this page -->

        <!-- ace settings handler -->
        <script src="assets/js/ace-extra.min.js"></script>

        <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

        <!--[if lte IE 8]>
          <script src="assets/js/html5shiv.min.js"></script>
          <script src="assets/js/respond.min.js"></script>
        <![endif]-->
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
                                                    <div class="search-area well well-sm">
                                                        <div class="search-filter-header bg-primary">
                                                            <h5 class="smaller no-margin-bottom">
                                                                <i
                                                                    class="ace-icon fa fa-sliders light-green bigger-130"
                                                                    ></i
                                                                >&nbsp; Carrito De Compras
                                                            </h5>
                                                        </div>
                                                        <div class="space-10"></div>
                                                        <div class="col-sm-8 infobox-container">

                                                            <%
                                                                int cantidad = 0;
                                                                HttpSession ses = request.getSession();
                                                                List<RDetalleVenta> listaCarritoAgregado2 = (List<RDetalleVenta>) ses.getAttribute("canasta");
                                                                if (listaCarritoAgregado2 != null) {
                                                                    cantidad = listaCarritoAgregado2.size();
                                                                }
                                                                List<RDetalleVenta> listaCarritoAgregado = (List<RDetalleVenta>) ses.getAttribute("canasta");
                                                            %> 



                                                            <div class="widget-body">
                                                                <div class="widget-main no-padding">
                                                                    <table class="table table-bordered table-striped" style="background-color: red">
                                                                        <thead class="thin-border-bottom">
                                                                            <tr>
                                                                                <th style="color: black;">
                                                                                    <i class="ace-icon fa fa-caret-right blue"></i>name
                                                                                </th>

                                                                                <th>
                                                                                    <i class="ace-icon fa fa-caret-right blue"></i>price
                                                                                </th>

                                                                                <th class="hidden-480">
                                                                                    <i class="ace-icon fa fa-caret-right blue"></i>status
                                                                                </th>
                                                                            </tr>
                                                                        </thead>

                                                                        <tbody>
                                                                            <tr>
                                                                                <td>domain.com</td>

                                                                                <td>
                                                                                    <b class="blue">$12.00</b>
                                                                                </td>

                                                                                <td class="hidden-480">
                                                                                    <span class="label label-warning arrowed arrowed-right">SOLD</span>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div><!-- /.widget-main -->
                                                            </div>

                                                            <div class="widget-body">
                                                                <div class="widget-main padding-4">
                                                                    <div class="tab-content padding-12">
                                                                        <div id="task-tab" class="tab-pane active">
                                                                            <h4 class="smaller lighter green">
                                                                                <i class="ace-icon fa fa-shopping-cart bigger-160"></i>
                                                                                Carrito de Compras
                                                                            </h4>


                                                                            <ul id="tasks" class="item-list ui-sortable">
                                                                                <%                                                                                    if (cantidad > 0) {
                                                                                        for (RDetalleVenta obj : listaCarritoAgregado) {
                                                                                %>
                                                                                <li class="item-default clearfix ui-sortable-handle">
                                                                                    <label class="inline">
                                                                                        <span class="lbl"> <%=obj.getNombre()%></span>
                                                                                    </label>

                                                                                    <div class="pull-right pos-rel dropdown-hover">
                                                                                        <button class="btn btn-minier bigger btn-primary">
                                                                                            <i class="ace-icon fa fa-cog icon-only bigger-120"></i>
                                                                                        </button>

                                                                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-caret dropdown-close dropdown-menu-right">
                                                                                            <li>
                                                                                                <a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Mark&nbsp;as&nbsp;done">
                                                                                                    <span class="green">
                                                                                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                                                                                    </span>
                                                                                                </a>
                                                                                            </li>

                                                                                            <li>
                                                                                                <a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
                                                                                                    <span class="red">
                                                                                                        <i class="ace-icon fa fa-trash-o bigger-110"></i>
                                                                                                    </span>
                                                                                                </a>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </li>
                                                                                <%}
                                                                                    }
                                                                                %>

                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div><!-- /.widget-main -->
                                                            </div>

                                                            <div class="infobox infobox-pink">


                                                                <div class="infobox-icon">
                                                                    <i class="ace-icon fa fa-shopping-cart"></i>
                                                                </div>

                                                                <div class="infobox-data">
                                                                    <span class="infobox-data-number">8</span>
                                                                    <div class="infobox-content">new orders</div>
                                                                </div>
                                                                <div class="stat stat-important">4%</div>

                                                            </div>
                                                            <div class="space-6"></div>


                                                        </div>
                                                        <div class="space-10"></div>

                                                        <form>
                                                            <div class="row">
                                                                <div class="col-xs-12 col-sm-11 col-md-10">
                                                                    <div class="input-group">
                                                                        <input
                                                                            type="text"
                                                                            class="form-control"
                                                                            name="keywords"
                                                                            placeholder="Look within results"
                                                                            />
                                                                        <div class="input-group-btn">
                                                                            <button
                                                                                type="button"
                                                                                class="btn btn-default no-border btn-sm"
                                                                                >
                                                                                <i
                                                                                    class="ace-icon fa fa-search icon-on-right bigger-110"
                                                                                    ></i>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>

                                                        <div class="hr hr-dotted"></div>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-8">
                                                    <div class="row">

                                                    </div>

                                                    <div class="row">
                                                        <!--                                                        <form method="post" name="fr">
                                                                                                                    <input type="hidden" name="opc" value="22"/>-->
                                                        <%
                                                            DProducto dProducto = new DProducto();
                                                            for (MProducto producto : dProducto.Select()) {
                                                                int idproducto = producto.getIdProducto();
                                                                String stock = producto.getStock() + " UN";
                                                                String precioVenta = "S/. " + producto.getPrecioVenta();
                                                                String urlProducto = "opc=21?IdProducto=" + producto.getIdProducto();
                                                                String nombreProducto = producto.getNombre();
                                                                String categoriaProducto = producto.getCategoria();
                                                                String imagenProducto = "imagenes/" + idproducto;
                                                        %>
                                                        <div class="col-xs-6 col-sm-4 col-md-3">
                                                            <div class="thumbnail search-thumbnail">
                                                                <span class="search-promotion label label-success arrowed-in arrowed-in-right"><%= stock%></span>
                                                                <img class="media-object" src="<%= imagenProducto%>.jpg" height="200px" width="100px" alt="<%= nombreProducto%>" />

                                                                <div class="caption">
                                                                    <div class="clearfix">
                                                                        <span class="pull-right label label-grey info-label"><%= precioVenta%></span>
                                                                    </div>
                                                                    <h4 class="search-title">
                                                                        <a href="<%= urlProducto%>" class="blue"><%= nombreProducto%></a>
                                                                    </h4>
                                                                    <p><%= categoriaProducto%></p>
                                                                    <div class="ace-spinner middle" style="width: 125px; align: center;">
                                                                        <div class="input-group">
                                                                            <input type="text" id="cantidad" name="cantidad" class="spinbox-input form-control text-center">
                                                                            <div class="spinbox-buttons input-group-btn btn-group-vertical">
                                                                                <button type="button" class="btn spinbox-up btn-sm btn-success">
                                                                                    <i class="icon-only ace-icon fa fa-chevron-up"></i>
                                                                                </button>
                                                                                <button type="button" class="btn spinbox-down btn-sm btn-danger">
                                                                                    <i class="icon-only ace-icon fa fa-chevron-down"></i>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <input type="hidden" name="idproducto" value="<%=idproducto%>"/>

                                                                    <a href="ServletVenta?opc=22&idproducto=<%=idproducto%>&cantidad=2" class="btn btn-info">Agregar</a> 
                                                                    <!--                                                                        <a href="#" onclick="valida()" class="btn btn-info">Agregar</a> -->

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%
                                                            }
                                                        %>

                                                        <!--                                                        </form>-->
                                                    </div>
                                                    <div class="space-12"></div>
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
                                <i
                                    class="ace-icon fa fa-twitter-square light-blue bigger-150"
                                    ></i>
                            </a>

                            <a href="#">
                                <i
                                    class="ace-icon fa fa-facebook-square text-primary bigger-150"
                                    ></i>
                            </a>

                            <a href="#">
                                <i class="ace-icon fa fa-rss-square orange bigger-150"></i>
                            </a>
                        </span>
                    </div>
                </div>
            </div>

            <a
                href="#"
                id="btn-scroll-up"
                class="btn-scroll-up btn btn-sm btn-inverse"
                >
                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
            </a>
        </div>
        <!-- /.main-container -->

        <!-- basic scripts -->

        <!--[if !IE]> -->
        <script src="assets/js/jquery-2.1.4.min.js"></script>

        <!-- <![endif]-->

        <!--[if IE]>
          <script src="assets/js/jquery-1.11.3.min.js"></script>
        <![endif]-->
        <script type="text/javascript">
                if ("ontouchstart" in document.documentElement)
                    document.write(
                            "<script src='assets/js/jquery.mobile.custom.min.js'>" +
                            "<" +
                            "/script>"
                            );
        </script>

        <script>
            function valida() {

                console.log("valida log");
//                st =
//                can = Number(fr.cantidad.value)
//                if (can > st) {
//                    alert('stock no disponible');
//                    return;
//                }
                fr.action = "ServletVenta";
                fr.submit();
            }

        </script>  

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
