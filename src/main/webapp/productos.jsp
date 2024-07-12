<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*,Beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="head.jsp"%>
    <link href="css/estilop.css" rel="stylesheet" type="text/css"/>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .formulario {
            width: 45%;
        }

        .tabla-productos {
            width: 50%;
        }

        .tabla-productos table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .tabla-productos table, th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        .tabla-productos img {
            max-width: 50px;
            height: auto;
        }
    </style>
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
        <%@include file="menu.jsp"%>
        <div class="container">
            <div class="row">
                <a href="ServletVenta?opc=5">Cargar Lista de Productos</a>
            </div>
            <div class="formulario">
                <h2>Administración de Productos</h2>
                <form action="ServletVenta" method="post" enctype="multipart/form-data">
                    <!-- Formulario para agregar o actualizar producto -->
                    <input type="hidden" name="opc" value="6" id="opc">
                    <input type="hidden" name="idProducto" id="idProducto">
                    <label for="codigo">Código:</label>
                    <input type="text" id="codigo" name="codigo" required><br>
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" required><br>
                    <label for="stock">Stock:</label>
                    <input type="number" id="stock" name="stock" required><br>
                    <label for="precioVenta">Precio de Venta:</label>
                    <input type="number" step="0.01" id="precioVenta" name="precioVenta" required><br>
                    <label for="idCategoria">ID Categoría:</label>
                    <input type="number" id="idCategoria" name="idCategoria" required><br>
                    <label for="imagen">Imagen:</label>
                    <input type="file" id="imagen" name="imagen"><br>
                    <input type="submit" value="Guardar Producto">
                </form>
            </div>

            <div class="tabla-productos">
                <%
                    List<MProducto> lista = (ArrayList<MProducto>) request.getAttribute("dato");
                    if (lista != null && !lista.isEmpty()) {
                %>
                <h2>Lista de Productos</h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID Producto</th>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Stock</th>
                            <th>Precio de Venta</th>
                            <th>Imagen</th>
                            <th>ID Categoría</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (MProducto producto : lista) { %>
                        <tr>
                            <td><%= producto.getIdProducto() %></td>
                            <td><%= producto.getCodigo() %></td>
                            <td><%= producto.getNombre() %></td>
                            <td><%= producto.getStock() %></td>
                            <td><%= producto.getPrecioVenta() %></td>
                            <td>
                                <% if (producto.getImagen() != null && !producto.getImagen().isEmpty()) { %>
                                <img src="/EcomCLM/imagenes/<%=producto.getIdProducto()%>.jpg" alt="" width="50">
                                <% } else { %>
                                No image
                                <% } %>
                            </td>
                            <td><%= producto.getIdCategoria() %></td>
                            <td>
                                <form action="ServletVenta" method="post" style="display:inline;">
                                    <input type="hidden" name="opc" value="8">
                                    <input type="hidden" name="idProducto" value="<%= producto.getIdProducto() %>">
                                    <button type="submit">Eliminar</button>
                                </form>
                                <button onclick="cargarProducto('<%= producto.getIdProducto() %>', '<%= producto.getCodigo() %>', '<%= producto.getNombre() %>', '<%= producto.getStock() %>', '<%= producto.getPrecioVenta() %>', '<%= producto.getIdCategoria() %>')">Actualizar</button>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <% } else { %>
                <p>No hay productos registrados.</p>
                <% } %>
            </div>
        </div>

        <%@include file="footer.jsp"%>
    </div>

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

    <script>
        function cargarProducto(idProducto, codigo, nombre, stock, precioVenta, idCategoria) {
            document.getElementById('opc').value = 7; // Cambia a la opción de actualizar
            document.getElementById('idProducto').value = idProducto;
            document.getElementById('codigo').value = codigo;
            document.getElementById('nombre').value = nombre;
            document.getElementById('stock').value = stock;
            document.getElementById('precioVenta').value = precioVenta;
            document.getElementById('idCategoria').value = idCategoria;
        }
    </script>
</body>
</html>
