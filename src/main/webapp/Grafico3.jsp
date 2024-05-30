<%@page import="com.celumax.ecomclm.Model.MProducto"%>
<%@page import="com.celumax.ecomclm.Data.DProducto"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>


<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
    <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
    <style>
        .container {
            width: 100%;
            margin: 15px auto;
        }
        body {
            text-align: center;
            color: green;
        }
        h2 {
            text-align: center;
            font-family: "Verdana", sans-serif;
            font-size: 30px;
        }
    </style>
</head>
<body>
    <%
        DProducto obj = new DProducto();
        int an = 0;
        String tipo = "bar";  
        if (request.getParameter("tan") != null) {
            try {
                an = Integer.parseInt(request.getParameter("tan"));
            } catch (NumberFormatException e) {
                an = 0;  
            }
        }

        List<MProducto> listaProductos = obj.lisStockPorAnio(an);
    %>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <form name="fr" method="get">
                            <div class="form-group">
                                <label>Ingrese año</label>
                                <input name="tan" class="form-control" value="<%=an%>">
                            </div>
                            <button class="btn btn-primary" type="submit">Enviar</button>
                            <br>
                            <table class="table table-bordered">
                                <tr><th>Producto</th><th>Stock</th></tr>
                                <% 
                                    for (MProducto producto : listaProductos) {
                                        out.print("<tr><td>" + producto.getNombre() + "</td><td>" + producto.getStock() + "</td></tr>");
                                    }
                                %>
                            </table>
                        </form>
                    </div>
                </div>
            </div>  
            <div class="col-sm-8">
                <div class="container">
                    <h2>Stock de productos del año <%=an%></h2>     
                </div> 
                <canvas id="myChart"></canvas>
            </div>
        </div>
    </div>

    <%
        StringBuilder label = new StringBuilder();
        StringBuilder data = new StringBuilder();
        for (MProducto producto : listaProductos) {
            label.append("'").append(producto.getNombre()).append("',");
            data.append(producto.getStock()).append(",");
        }
        if (label.length() > 0) label.setLength(label.length() - 1);  
        if (data.length() > 0) data.setLength(data.length() - 1);   
    %>  

    <script>
        var ctx = document.getElementById("myChart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: "bar",
            data: {
                labels: [<%=label.toString()%>],
                datasets: [
                    {
                        label: "Stock",
                        data: [<%=data.toString()%>],
                        backgroundColor: [
                            "rgba(153,205,1,0.6)", "lightblue", "lightred", "peru", "yellow", "orange", "blue", "green"
                        ],
                    },
                ],
            },
        });
    </script>
</body>
</html>
