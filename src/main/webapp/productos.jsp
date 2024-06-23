<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*,Beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="head.jsp"%>
</head>
<body>
<center>
    <%@include file="header.jsp"%>

    <div class="container">
        <h2>Lista de Productos</h2>
        <a href="ServletVenta?opc=5">Cargar Lista de Productos</a>

        <!-- Formulario para agregar producto -->
        <form action="ServletVenta" method="post" enctype="multipart/form-data">
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

        <!-- Formulario para actualizar producto -->
        <h3>Actualizar Producto</h3>
        <form action="ServletVenta" method="post" enctype="multipart/form-data">
            <input type="hidden" name="opc" value="7">
            <input type="text" name="idProducto" placeholder="ID Producto" required>
            <input type="text" name="codigo" placeholder="Código" required>
            <input type="text" name="nombre" placeholder="Nombre" required>
            <input type="number" name="stock" placeholder="Stock" required>
            <input type="number" step="0.01" name="precioVenta" placeholder="Precio de Venta" required>
            <input type="number" name="idCategoria" placeholder="ID Categoría" required>
            <input type="file" name="imagen" required>
            <button type="submit">Actualizar</button>
        </form>

        <!-- Formulario para eliminar producto -->
        <h3>Eliminar Producto</h3>
        <form action="ServletVenta" method="post">
            <input type="hidden" name="opc" value="8">
            <input type="text" name="idProducto" placeholder="ID Producto" required>
            <button type="submit">Eliminar</button>
        </form>

        <%
            List<MProducto> lista = (ArrayList<MProducto>) request.getAttribute("dato");
            if (lista != null && !lista.isEmpty()) {
        %>
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
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
            <p>No hay productos registrados.</p>
        <% } %>
    </div>

    <%@include file="footer.jsp"%>
</center>
</body>
</html>
