<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*,Beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="head.jsp"%>
        <link href="css/estilop.css" rel="stylesheet" type="text/css"/>
        <style>
            /* Estilos para alinear formularios y tabla */
            .container {
                display: flex;
                justify-content: space-between; /* Para separar los elementos a los lados */
                align-items: flex-start; /* Alinea los elementos arriba */
                max-width: 1200px; /* Ancho máximo para la página */
                margin: 0 auto; /* Centra el contenido */
                padding: 20px; /* Espaciado interno */
            }

            .formularios {
                width: 45%; /* Ancho del lado izquierdo para los formularios */
            }

            .tabla-productos {
                width: 50%; /* Ancho del lado derecho para la tabla de productos */
            }

            .tabla-productos table {
                width: 100%; /* Ancho completo de la tabla dentro del contenedor */
                margin-top: 20px; /* Espacio superior */
                border-collapse: collapse; /* Colapso de bordes de la tabla */
            }

            .tabla-productos table, th, td {
                border: 1px solid #ccc; /* Borde de las celdas */
                padding: 8px; /* Espaciado interno de las celdas */
                text-align: left; /* Alineación del texto a la izquierda */
            }

            .tabla-productos img {
                max-width: 50px; /* Tamaño máximo de las imágenes de producto */
                height: auto; /* Altura automática */
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
                <div class="formularios">
                    <!-- Formularios para agregar, actualizar y eliminar productos -->
                    <h2>Administración de Productos</h2>
                    <form action="ServletVenta" method="post" enctype="multipart/form-data">
                        <!-- Formulario para agregar producto -->
                        <input type="hidden" name="opc" value="6">
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
                        <input type="file" id="imagen" name="imagen" required><br>
                        <input type="submit" value="Agregar Producto">
                    </form>

                    <h3>Actualizar Producto</h3>
                    <form action="ServletVenta" method="post" enctype="multipart/form-data">
                        <!-- Formulario para actualizar producto -->
                        <input type="hidden" name="opc" value="7">
                        <input type="text" name="idProducto" placeholder="ID Producto" required><br>
                        <input type="text" name="codigo" placeholder="Código" required><br>
                        <input type="text" name="nombre" placeholder="Nombre" required><br>
                        <input type="number" name="stock" placeholder="Stock" required><br>
                        <input type="number" step="0.01" name="precioVenta" placeholder="Precio de Venta" required><br>
                        <input type="number" name="idCategoria" placeholder="ID Categoría" required><br>
                        <input type="file" name="imagen" required><br>
                        <button type="submit">Actualizar</button>
                    </form>

                    <h3>Eliminar Producto</h3>
                    <form action="ServletVenta" method="post">
                        <!-- Formulario para eliminar producto -->
                        <input type="hidden" name="opc" value="8">
                        <input type="text" name="idProducto" placeholder="ID Producto" required><br>
                        <button type="submit">Eliminar</button>
                    </form>
                </div>

                <div class="tabla-productos">
                    <%
                        List<MProducto> lista = (ArrayList<MProducto>) request.getAttribute("dato");
                        if (lista != null && !lista.isEmpty()) {
                    %>
                    <!-- Lista de productos -->
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
                            </tr>
                        </thead>
                        <tbody>
                            <% for (MProducto producto : lista) {%>
                            <tr>
                                <td><%= producto.getIdProducto()%></td>
                                <td><%= producto.getCodigo()%></td>
                                <td><%= producto.getNombre()%></td>
                                <td><%= producto.getStock()%></td>
                                <td><%= producto.getPrecioVenta()%></td>
                                <td>
                                    <% if (producto.getImagen() != null && !producto.getImagen().isEmpty()) {%>
                                    <img src="/EcomCLM/imagenes/<%=producto.getIdProducto()%>.jpg" alt="" width="50">
                                    <% } else { %>
                                    No image
                                    <% }%>
                                </td>
                                <td><%= producto.getIdCategoria()%></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <% } else { %>
                    <p>No hay productos registrados.</p>
                    <% }%>
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
    </body>
</html>
