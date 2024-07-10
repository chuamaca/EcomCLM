<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*,Beans.*,java.util.*"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="head.jsp"%>
        <link href="css/estilop.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="no-skin">
        <%@include file="header.jsp"%>

        <div class="main-container ace-save-state" id="main-container">
            <script type="text/javascript">
                try {
                    ace.settings.loadState('main-container')
                } catch (e) {
                }
            </script>

            <!-- CONTENIDO DE SECCION MENU -->
            <%@include file="menu.jsp"%>

            <div class="main-content">
                <div class="main-content-inner">
                    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                        <ul class="breadcrumb">
                            <li>
                                <i class="ace-icon fa fa-home home-icon"></i>
                                <a href="#">Administrador</a>
                            </li>
                            <li class="active">Clientes</li>
                        </ul><!-- /.breadcrumb -->

                        <div class="nav-search" id="nav-search">
                            <form class="form-search">
                                <span class="input-icon">
                                    <input type="text" placeholder="Buscar ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                                    <i class="ace-icon fa fa-search nav-search-icon"></i>
                                </span>
                            </form>
                        </div><!-- /.nav-search -->
                    </div>

                    <div class="page-content">
                        <div class="row">
                            <div class="col-xs-12 col-md-4">
                                <!-- Formulario para crear y actualizar cliente -->
                                <div class="side-content">
                                    <h3 id="form-title">Agregar Cliente</h3>
                                    <form action="ServletVenta" method="post" class="form-horizontal">
                                        <input type="hidden" name="opc" id="form-opc" value="2">
                                        <input type="hidden" name="idCliente" id="idCliente">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="nombre"> Nombre: </label>
                                            <div class="col-sm-9">
                                                <input type="text" id="nombre" name="nombre" class="col-xs-10 col-sm-5" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="numDoc"> Número de Documento: </label>
                                            <div class="col-sm-9">
                                                <input type="text" id="numDoc" name="numDoc" class="col-xs-10 col-sm-5" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="direccion"> Dirección: </label>
                                            <div class="col-sm-9">
                                                <input type="text" id="direccion" name="direccion" class="col-xs-10 col-sm-5" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="telefono"> Teléfono: </label>
                                            <div class="col-sm-9">
                                                <input type="text" id="telefono" name="telefono" class="col-xs-10 col-sm-5" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="correo"> Correo: </label>
                                            <div class="col-sm-9">
                                                <input type="email" id="correo" name="correo" class="col-xs-10 col-sm-5" required>
                                            </div>
                                        </div>
                                        <div class="col-md-offset-3 col-md-9">
                                            <input class="btn btn-info" type="submit" value="Guardar Cliente">
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="col-xs-12 col-md-8">
                                <div class="row">
                                    <a href="ServletVenta?opc=1">Cargar Lista de Clientes</a>
                                </div>
                                <div class="row">
                                    <%
                                        List<MCliente> lista = (ArrayList<MCliente>) request.getAttribute("dato");
                                        if (lista != null && !lista.isEmpty()) {
                                    %>
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID Cliente</th>
                                                <th>Nombre</th>
                                                <th>Número de Documento</th>
                                                <th>Dirección</th>
                                                <th>Teléfono</th>
                                                <th>Correo</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (MCliente cliente : lista) {%>
                                            <tr>
                                                <td><%= cliente.getIdCliente()%></td>
                                                <td><%= cliente.getNombre()%></td>
                                                <td><%= cliente.getNumeroDocumento()%></td>
                                                <td><%= cliente.getDireccion()%></td>
                                                <td><%= cliente.getTelefono()%></td>
                                                <td><%= cliente.getCorreo()%></td>
                                                <td>
                                                    <button onclick="editarCliente(<%= cliente.getIdCliente()%>, '<%= cliente.getNombre()%>', '<%= cliente.getNumeroDocumento()%>', '<%= cliente.getDireccion()%>', '<%= cliente.getTelefono()%>', '<%= cliente.getCorreo()%>')">Actualizar</button>
                                                    <form action="ServletVenta" method="post" style="display:inline;">
                                                        <input type="hidden" name="opc" value="4">
                                                        <input type="hidden" name="idCliente" value="<%= cliente.getIdCliente()%>">
                                                        <button type="submit">Eliminar</button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                    <% } else { %>
                                    <p>No hay clientes registrados.</p>
                                    <% }%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.main-content -->

            <!-- CONTENIDO DE SECCION FOOTER -->
            <%@include file="footer.jsp"%>

            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
            </a>
        </div><!-- /.main-container -->

        <!-- basic scripts -->
        <!--[if !IE]> -->
        <script src="assets/js/jquery-2.1.4.min.js"></script>
        <!-- <![endif]-->
        <!--[if IE]>
        <script src="assets/js/jquery-1.11.3.min.js"></script>
        <![endif]-->
        <script type="text/javascript">
                if ('ontouchstart' in document.documentElement)
                    document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
        </script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- page specific plugin scripts -->
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
        <script src="assets/js/dataTables.buttons.min.js"></script>
        <script src="assets/js/buttons.flash.min.js"></script>
        <script src="assets/js/buttons.html5.min.js"></script>
        <script src="assets/js/buttons.print.min.js"></script>
        <script src="assets/js/buttons.colVis.min.js"></script>
        <script src="assets/js/dataTables.select.min.js"></script>
        <!-- ace scripts -->
        <script src="assets/js/ace-elements.min.js"></script>
        <script src="assets/js/ace.min.js"></script>
        <!-- inline scripts related to this page -->

        <script type="text/javascript">
            function editarCliente(id, nombre, numDoc, direccion, telefono, correo) {
                document.getElementById('form-title').innerText = "Actualizar Cliente";
                document.getElementById('form-opc').value = "3";
                document.getElementById('idCliente').value = id;
                document.getElementById('nombre').value = nombre;
                document.getElementById('numDoc').value = numDoc;
                document.getElementById('direccion').value = direccion;
                document.getElementById('telefono').value = telefono;
                document.getElementById('correo').value = correo;
            }
        </script>
    </body>
</html>
