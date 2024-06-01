<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*,Beans.*,java.util.*"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <%@include file="head.jsp"%>
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
                                    <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                                    <i class="ace-icon fa fa-search nav-search-icon"></i>
                                </span>
                            </form>
                        </div><!-- /.nav-search -->
                    </div>

                    <div class="page-content">
                        <div class="row">
                            <div class="col-xs-12">
                                <!-- CONTENIDO DE SECCION INICIO BODY -->


                                <div class="row">
                                    <a href="ServletVenta?opc=1">Cargar Lista de Clientes</a>

                                </div>


                                <div class="row">
                                    <div class="side-content">
                                        <!-- Formulario para agregar cliente -->
                                        <h3>Agregar Cliente</h3>
                                        <form action="ServletVenta" method="post" class="form-horizontal">
                                            <input type="hidden" name="opc" value="2">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Nombre: </label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="nombre" name="nombre"  class="col-xs-10 col-sm-5" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Número de Documento: </label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="numDoc" name="numDoc"  class="col-xs-10 col-sm-5" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Dirección: </label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="direccion" name="direccion"  class="col-xs-10 col-sm-5" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Teléfono: </label>
                                                <div class="col-sm-9">
                                                    <input type="text" id="telefono" name="telefono"  class="col-xs-10 col-sm-5" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Correo:: </label>
                                                <div class="col-sm-9">
                                                    <input type="email" id="correo" name="correo"  class="col-xs-10 col-sm-5" required>
                                                </div>
                                            </div>

                                            <div class="col-md-offset-3 col-md-9">
                                                <input class="btn btn-info" text=" Guardar Cliente" type="submit">
                                            </div>
                                        </form>

                                        <!-- Formulario para actualizar cliente -->
                                        <h3>Actualizar Cliente</h3>
                                        <form action="ServletVenta" method="post">
                                            <input type="hidden" name="opc" value="3">
                                            <input type="text" name="idCliente" placeholder="ID Cliente" required>
                                            <input type="text" name="nombre" placeholder="Nombre" required>
                                            <input type="text" name="numDoc" placeholder="Número de Documento" required>
                                            <input type="text" name="direccion" placeholder="Dirección" required>
                                            <input type="text" name="telefono" placeholder="Teléfono" required>
                                            <input type="email" name="correo" placeholder="Correo" required>
                                            <button type="submit">Actualizar</button>
                                        </form>

                                        <!-- Formulario para eliminar cliente -->
                                        <h3>Eliminar Cliente</h3>
                                        <form action="ServletVenta" method="post">
                                            <input type="hidden" name="opc" value="4">
                                            <input type="text" name="idCliente" placeholder="ID Cliente" required>
                                            <button type="submit">Eliminar</button>
                                        </form>
                                    </div>
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
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                    <% } else { %>
                                    <p>No hay clientes registrados.</p>
                                    <% }%>

                                </div>
                                <!-- CONTENIDO DE SECCION FIN BODY -->
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.page-content -->
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


        <!-- inline scripts related to this page -->
        <script type="text/javascript">
                jQuery(function ($) {
                    //initiate dataTables plugin
                    var myTable =
                            $('#dynamic-table')
                            //.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
                            .DataTable({
                                bAutoWidth: false,
                                "aoColumns": [
                                    {"bSortable": false},
                                    null, null, null, null, null,
                                    {"bSortable": false}
                                ],
                                "aaSorting": [],

                                //"bProcessing": true,
                                //"bServerSide": true,
                                //"sAjaxSource": "http://127.0.0.1/table.php"	,

                                //,
                                //"sScrollY": "200px",
                                //"bPaginate": false,

                                //"sScrollX": "100%",
                                //"sScrollXInner": "120%",
                                //"bScrollCollapse": true,
                                //Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
                                //you may want to wrap the table inside a "div.dataTables_borderWrap" element

                                //"iDisplayLength": 50


                                select: {
                                    style: 'multi'
                                }
                            });



                    $.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';

                    new $.fn.dataTable.Buttons(myTable, {
                        buttons: [
                            {
                                "extend": "colvis",
                                "text": "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>Show/hide columns</span>",
                                "className": "btn btn-white btn-primary btn-bold",
                                columns: ':not(:first):not(:last)'
                            },
                            {
                                "extend": "copy",
                                "text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>Copy to clipboard</span>",
                                "className": "btn btn-white btn-primary btn-bold"
                            },
                            {
                                "extend": "csv",
                                "text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>Export to CSV</span>",
                                "className": "btn btn-white btn-primary btn-bold"
                            },
                            {
                                "extend": "excel",
                                "text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>Export to Excel</span>",
                                "className": "btn btn-white btn-primary btn-bold"
                            },
                            {
                                "extend": "pdf",
                                "text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>Export to PDF</span>",
                                "className": "btn btn-white btn-primary btn-bold"
                            },
                            {
                                "extend": "print",
                                "text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>Print</span>",
                                "className": "btn btn-white btn-primary btn-bold",
                                autoPrint: false,
                                message: 'This print was produced using the Print button for DataTables'
                            }
                        ]
                    });
                    myTable.buttons().container().appendTo($('.tableTools-container'));

                    //style the message box
                    var defaultCopyAction = myTable.button(1).action();
                    myTable.button(1).action(function (e, dt, button, config) {
                        defaultCopyAction(e, dt, button, config);
                        $('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
                    });


                    var defaultColvisAction = myTable.button(0).action();
                    myTable.button(0).action(function (e, dt, button, config) {

                        defaultColvisAction(e, dt, button, config);


                        if ($('.dt-button-collection > .dropdown-menu').length == 0) {
                            $('.dt-button-collection')
                                    .wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
                                    .find('a').attr('href', '#').wrap("<li />")
                        }
                        $('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
                    });

                    ////

                    setTimeout(function () {
                        $($('.tableTools-container')).find('a.dt-button').each(function () {
                            var div = $(this).find(' > div').first();
                            if (div.length == 1)
                                div.tooltip({container: 'body', title: div.parent().text()});
                            else
                                $(this).tooltip({container: 'body', title: $(this).text()});
                        });
                    }, 500);





                    myTable.on('select', function (e, dt, type, index) {
                        if (type === 'row') {
                            $(myTable.row(index).node()).find('input:checkbox').prop('checked', true);
                        }
                    });
                    myTable.on('deselect', function (e, dt, type, index) {
                        if (type === 'row') {
                            $(myTable.row(index).node()).find('input:checkbox').prop('checked', false);
                        }
                    });




                    /////////////////////////////////
                    //table checkboxes
                    $('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);

                    //select/deselect all rows according to table header checkbox
                    $('#dynamic-table > thead > tr > th input[type=checkbox], #dynamic-table_wrapper input[type=checkbox]').eq(0).on('click', function () {
                        var th_checked = this.checked;//checkbox inside "TH" table header

                        $('#dynamic-table').find('tbody > tr').each(function () {
                            var row = this;
                            if (th_checked)
                                myTable.row(row).select();
                            else
                                myTable.row(row).deselect();
                        });
                    });

                    //select/deselect a row when the checkbox is checked/unchecked
                    $('#dynamic-table').on('click', 'td input[type=checkbox]', function () {
                        var row = $(this).closest('tr').get(0);
                        if (this.checked)
                            myTable.row(row).deselect();
                        else
                            myTable.row(row).select();
                    });



                    $(document).on('click', '#dynamic-table .dropdown-toggle', function (e) {
                        e.stopImmediatePropagation();
                        e.stopPropagation();
                        e.preventDefault();
                    });



                    //And for the first simple table, which doesn't have TableTools or dataTables
                    //select/deselect all rows according to table header checkbox
                    var active_class = 'active';
                    $('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function () {
                        var th_checked = this.checked;//checkbox inside "TH" table header

                        $(this).closest('table').find('tbody > tr').each(function () {
                            var row = this;
                            if (th_checked)
                                $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
                            else
                                $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
                        });
                    });

                    //select/deselect a row when the checkbox is checked/unchecked
                    $('#simple-table').on('click', 'td input[type=checkbox]', function () {
                        var $row = $(this).closest('tr');
                        if ($row.is('.detail-row '))
                            return;
                        if (this.checked)
                            $row.addClass(active_class);
                        else
                            $row.removeClass(active_class);
                    });



                    /********************************/
                    //add tooltip for small view action buttons in dropdown menu
                    $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});

                    //tooltip placement on right or left
                    function tooltip_placement(context, source) {
                        var $source = $(source);
                        var $parent = $source.closest('table')
                        var off1 = $parent.offset();
                        var w1 = $parent.width();

                        var off2 = $source.offset();
                        //var w2 = $source.width();

                        if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2))
                            return 'right';
                        return 'left';
                    }




                    /***************/
                    $('.show-details-btn').on('click', function (e) {
                        e.preventDefault();
                        $(this).closest('tr').next().toggleClass('open');
                        $(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
                    });
                    /***************/





                    /**
                     //add horizontal scrollbars to a simple table
                     $('#simple-table').css({'width':'2000px', 'max-width': 'none'}).wrap('<div style="width: 1000px;" />').parent().ace_scroll(
                     {
                     horizontal: true,
                     styleClass: 'scroll-top scroll-dark scroll-visible',//show the scrollbars on top(default is bottom)
                     size: 2000,
                     mouseWheelLock: true
                     }
                     ).css('padding-top', '12px');
                     */


                })
        </script>
    </body>
</html>


