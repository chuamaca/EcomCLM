<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>

        <div id="sidebar" class="sidebar                  responsive                    ace-save-state">
            <script type="text/javascript">
                try {
                    ace.settings.loadState('sidebar')
                } catch (e) {
                }
            </script>

            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    <button class="btn btn-success">
                        <i class="ace-icon fa fa-signal"></i>
                    </button>

                    <button class="btn btn-info">
                        <i class="ace-icon fa fa-pencil"></i>
                    </button>

                    <button class="btn btn-warning">
                        <i class="ace-icon fa fa-users"></i>
                    </button>

                    <button class="btn btn-danger">
                        <i class="ace-icon fa fa-cogs"></i>
                    </button>
                </div>

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>
                    <span class="btn btn-info"></span>
                    <span class="btn btn-warning"></span>
                    <span class="btn btn-danger"></span>
                </div>
            </div><!-- /.sidebar-shortcuts -->

            <ul class="nav nav-list">
                <li class="">
                    <a href="#">
                        <i class="menu-icon fa fa-tachometer"></i>
                        <span class="menu-text"> Dashboard </span>
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-desktop"></i>
                        <span class="menu-text">
                            Administrador
                        </span>

                        <b class="arrow fa fa-angle-down"></b>
                    </a>

                    <b class="arrow"></b>

                    <ul class="submenu">

                        <li class="">
                            <a href="ServletVenta?opc=24">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Ventas
                            </a>

                            <b class="arrow"></b>
                        </li>

                        <li class="">
                            <a href="ServletVenta?opc=1">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Clientes
                            </a>
                            <b class="arrow"></b>
                        </li>

                        <li class="">
                            <a href="productos.jsp">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Productos
                            </a>
                            <b class="arrow"></b>
                        </li>



                        <li class="">
                            <a href="#" class="dropdown-toggle">
                                <i class="menu-icon fa fa-caret-right"></i>

                                Reportes
                                <b class="arrow fa fa-angle-down"></b>
                            </a>

                            <b class="arrow"></b>
                            <ul class="submenu">
                                <li class="">

                                    <a href="Grafico1.jsp">
                                        <i class="menu-icon fa fa-plus purple"></i>
                                        Ventas Totales
                                    </a>

                                    <b class="arrow"></b>
                                </li>
                                <li class="">
                                    <a href="Grafico2.jsp">
                                        <i class="menu-icon fa fa-leaf green"></i>
                                        Productos Mas Caros
                                    </a>
                                    <b class="arrow"></b>
                                </li>

                                <li class="">
                                    <a href="Grafico3.jsp">
                                        <i class="menu-icon fa fa-cube green"></i>
                                        Stock de productos
                                    </a>
                                    <b class="arrow"></b>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>

            </ul><!-- /.nav-list -->

            <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
                <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
            </div>
        </div>
    </body>
</html>