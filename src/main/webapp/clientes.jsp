<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*,Beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="head.jsp"%>
</head>
<body>
    <%@include file="header.jsp"%>

    <div class="container">
        <h2>Lista de Clientes</h2>
        <div class="main-content">
            <a href="ServletVenta?opc=1">Cargar Lista de Clientes</a>
            
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
                    <% for (MCliente cliente : lista) { %>
                    <tr>
                        <td><%= cliente.getIdCliente() %></td>
                        <td><%= cliente.getNombre() %></td>
                        <td><%= cliente.getNumeroDocumento() %></td>
                        <td><%= cliente.getDireccion() %></td>
                        <td><%= cliente.getTelefono() %></td>
                        <td><%= cliente.getCorreo() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <% } else { %>
                <p>No hay clientes registrados.</p>
            <% } %>
        </div>
        
        <div class="side-content">
            <!-- Formulario para agregar cliente -->
            <h3>Agregar Cliente</h3>
            <form action="ServletVenta" method="post">
                <input type="hidden" name="opc" value="2">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required><br>
                <label for="numDoc">Número de Documento:</label>
                <input type="text" id="numDoc" name="numDoc" required><br>
                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion" required><br>
                <label for="telefono">Teléfono:</label>
                <input type="text" id="telefono" name="telefono" required><br>
                <label for="correo">Correo:</label>
                <input type="email" id="correo" name="correo" required><br>
                <input type="submit" value="Agregar Cliente">
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

    <%@include file="footer.jsp"%>
</body>
</html>
