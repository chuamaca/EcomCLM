<%@page import="DAO.*,Beans.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>


<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
    <link href="css/estilo3.css" rel="stylesheet" type="text/css"/>
   
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
                        "rgba(153,205,1,0.6)", "lightblue", "lightcoral", "peru", "yellow", "orange", "blue", "green",
                        "rgba(75, 192, 192, 0.6)", "rgba(255, 99, 132, 0.6)", "rgba(54, 162, 235, 0.6)", 
                        "rgba(255, 206, 86, 0.6)", "rgba(75, 192, 192, 0.6)", "rgba(153, 102, 255, 0.6)", 
                        "rgba(255, 159, 64, 0.6)", "rgba(255, 105, 180, 0.6)", "rgba(139, 69, 19, 0.6)", 
                        "rgba(0, 255, 127, 0.6)", "rgba(64, 224, 208, 0.6)", "rgba(220, 20, 60, 0.6)"
                         ],
                    },
                ],
            },
        });
    </script>
</body>
</html>
