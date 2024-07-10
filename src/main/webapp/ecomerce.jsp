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
                                                    <div class="col-xs-12 col-sm-3">


                                                        <div id="purchase-info" class="widget-box">
                                                            <div class="widget-header">
                                                                <h5 class="widget-title">Carrito de Compras</h5>
                                                            </div>

                                                            <div class="widget-body">
                                                                <div class="widget-main">

                                                                    <table class="table table-striped table-bordered">
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="center">#</th>
                                                                                <th>Producto</th>
                                                                                <th class="hidden-xs">Cantidad</th>
                                                                                <th>Total</th>
                                                                                <th>Accion</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <% int cantidad=0; HttpSession
                                                                                ses=request.getSession();
                                                                                List<RDetalleVenta>
                                                                                listaCarritoAgregado2 = (List
                                                                                <RDetalleVenta>)
                                                                                    ses.getAttribute("canasta");
                                                                                    if (listaCarritoAgregado2 != null) {
                                                                                    cantidad =
                                                                                    listaCarritoAgregado2.size();
                                                                                    }
                                                                                    List<RDetalleVenta>
                                                                                        listaCarritoAgregado = (List
                                                                                        <RDetalleVenta>)
                                                                                            ses.getAttribute("canasta");
                                                                                            %>

                                                                                            <% double sm=0; int
                                                                                                inicial=0; int
                                                                                                contador=0; if
                                                                                                (cantidad> 0) {

                                                                                                for (RDetalleVenta obj :
                                                                                                listaCarritoAgregado) {
                                                                                                contador++;
                                                                                                %>
                                                                                                <tr>
                                                                                                    <td class="center">
                                                                                                        <%=contador%>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <a href="#">
                                                                                                            <%=obj.getNombre()%>
                                                                                                        </a>
                                                                                                    </td>
                                                                                                    <td
                                                                                                        class="hidden-xs">
                                                                                                        <%=obj.getCantidad()
                                                                                                            + " UN" %>
                                                                                                    </td>

                                                                                                    <td>
                                                                                                        <%=obj.getPrecioVenta()%>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        <a href="ServletVenta?op=25&IdProducto=<%=obj.getIdProducto()%>" class="btn btn-danger">
                                                                                                            <i class="ace-icon fa fa-trash-o"></i>
                                                                                                        </a>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <% sm
                                                                                                    +=obj.getPrecioVenta();
                                                                                                    }
                                                                                                    ses.setAttribute("total",
                                                                                                    sm); }%>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div id="purchase-info" class="widget-box">
                                                            <div class="widget-header">
                                                                <h5 class="widget-title">Medio De Pago:</h5>
                                                            </div>

                                                            <div class="widget-body">
                                                                <div class="widget-main">
                                                                    <div class="form-group">
                                                                        <label for="form-field-12">Usuario</label>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <input class="input-sm" type="text" id="usuario"
                                                                            name="usuario" placeholder="">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="form-field-12">Tarjeta:</label>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <input class="input-sm" type="text" id="tarjeta"
                                                                            name="tarjeta" placeholder="">
                                                                    </div>

                                                                    <a href="ServletVenta?opc=23" target="zona"
                                                                        class="btn btn-info">
                                                                        <i class="ace-icon fa fa-print">Comprar</i>
                                                                    </a>
                                                                </div>
                                                            </div>

                                                            <div class="widget-header">
                                                                <h5 class="widget-title">Comprobante</h5>
                                                            </div>
                                                            <div class="widget-body">
                                                                <div class="widget-main">
                                                                    <iframe name="zona" height="320"
                                                                        width="320"></iframe>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-9">
                                                        <div class="row">
                                                            <% DProducto dProducto=new DProducto(); for (MProducto
                                                                producto : dProducto.Select()) { int
                                                                idproducto=producto.getIdProducto(); String
                                                                stock=producto.getStock() + " UN" ; String
                                                                precioVenta="S/. " + producto.getPrecioVenta(); String
                                                                urlProducto="opc=21?IdProducto=" +
                                                                producto.getIdProducto(); String
                                                                nombreProducto=producto.getNombre(); String
                                                                categoriaProducto=producto.getCategoria(); String
                                                                imagenProducto="imagenes/" + idproducto; %>
                                                                <div class="col-xs-6 col-sm-4 col-md-3">
                                                                    <div class="thumbnail search-thumbnail">
                                                                        <span
                                                                            class="search-promotion label label-success arrowed-in arrowed-in-right">
                                                                            <%= stock%>
                                                                        </span>
                                                                        <img class="media-object"
                                                                            src="<%= imagenProducto%>.jpg"
                                                                            height="200px" width="100px"
                                                                            alt="<%= nombreProducto%>" />

                                                                        <div class="caption">
                                                                            <div class="clearfix">
                                                                                <span
                                                                                    class="pull-right label label-grey info-label">
                                                                                    <%= precioVenta%>
                                                                                </span>
                                                                            </div>
                                                                            <h4 class="search-title">
                                                                                <a href="<%= urlProducto%>"
                                                                                    class="blue">
                                                                                    <%= nombreProducto%>
                                                                                </a>
                                                                            </h4>
                                                                            <p>
                                                                                <%=categoriaProducto%>
                                                                            </p>

                                                                            <div class="ace-spinner middle touch-spinner"
                                                                                style="width: 125px;">
                                                                                <div class="input-group">
                                                                                    <div
                                                                                        class="spinbox-buttons input-group-btn">
                                                                                        <button type="button"
                                                                                            class="btn spinbox-down btn-sm btn-danger">
                                                                                            <i
                                                                                                class="icon-only ace-icon ace-icon fa fa-minus bigger-110"></i>
                                                                                        </button>
                                                                                    </div>
                                                                                    <input type="text"
                                                                                        id="spinner3-<%=idproducto%>"
                                                                                        name="cantidad"
                                                                                        class="spinbox-input form-control text-center"
                                                                                        value="0">
                                                                                    <div
                                                                                        class="spinbox-buttons input-group-btn">
                                                                                        <button type="button"
                                                                                            class="btn spinbox-up btn-sm btn-success">
                                                                                            <i
                                                                                                class="icon-only ace-icon ace-icon fa fa-plus bigger-110"></i>
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <input type="hidden" name="idproducto"
                                                                                value="<%=idproducto%>" />
                                                                            <a href="#"
                                                                                onclick="addToCart(<%=idproducto%>)"
                                                                                class="btn btn-info">Agregar</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <% } %>
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

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var spinners = document.querySelectorAll('.ace-spinner');

                    spinners.forEach(function (spinner) {
                        var spinnerInput = spinner.querySelector('.spinbox-input');
                        var incrementButton = spinner.querySelector('.spinbox-up');
                        var decrementButton = spinner.querySelector('.spinbox-down');

                        incrementButton.addEventListener('click', function () {
                            var currentValue = parseFloat(spinnerInput.value) || 0;
                            spinnerInput.value = (currentValue + 1);
                        });

                        decrementButton.addEventListener('click', function () {
                            var currentValue = parseFloat(spinnerInput.value) || 0;
                            spinnerInput.value = (currentValue - 1);
                        });

                        spinnerInput.addEventListener('input', function () {
                            var value = parseFloat(this.value);
                            if (!isNaN(value)) {
                                this.value = value;
                            }
                        });

                        spinnerInput.value = parseFloat(spinnerInput.value);
                    });
                });

                function addToCart(idproducto) {
                    var spinnerInput = document.getElementById('spinner3-' + idproducto);
                    var cantidad = spinnerInput.value;
                    var url = 'ServletVenta?opc=22&idproducto=' + idproducto + '&cantidad=' + cantidad;
                    window.location.href = url;
                }
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