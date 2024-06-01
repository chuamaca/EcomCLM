<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.*,Beans.*"%>

<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
    <link href="css/estilo1.css" rel="stylesheet" type="text/css"/>

</head>
<body>
    <%
        DVenta obj = new DVenta();
        int an = 0;
        String tipo = "bar";  
        if (request.getParameter("tan") != null) {
            try {
                an = Integer.parseInt(request.getParameter("tan"));
            } catch (NumberFormatException e) {
                an = 0;  
            }
        }
        if (request.getParameter("opc") != null) {
            tipo = request.getParameter("opc");
        }
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
                            <div class="form-group">
                                <input type="radio" name="opc" value="bar" <%= "bar".equals(tipo) ? "checked" : "" %>>Barra
                                <input type="radio" name="opc" value="pie" <%= "pie".equals(tipo) ? "checked" : "" %>>Torta
                                <input type="radio" name="opc" value="line" <%= "line".equals(tipo) ? "checked" : "" %>>Lineal
                            </div>
                            <button class="btn btn-primary" type="submit">Enviar</button>
                            <br>
                            <table class="table table-bordered">
                                <tr><th>Mes</th><th>Monto</th></tr>
                                <%
                                    for (MVenta x : obj.lisMes(an)) {
                                        out.print("<tr><td>" + x.Lmes() + "</td><td>" + x.getTotal() + "</td></tr>");
                                    }
                                %>
                            </table>
                        </form>
                    </div>
                </div>
            </div>  
            <div class="col-sm-8">
                <div class="container">
                    <h2>Ventas del año <%=an%></h2>     
                </div> 
                <canvas id="myChart"></canvas>
            </div>
        </div>
    </div>

    <%
        StringBuilder label = new StringBuilder();
        StringBuilder data = new StringBuilder();
        for (MVenta x : obj.lisMes(an)) {
            label.append("'").append(x.Lmes()).append("',");
            data.append(x.getTotal()).append(",");
        }
        if (label.length() > 0) label.setLength(label.length() - 1);  
        if (data.length() > 0) data.setLength(data.length() - 1);   
    %>  

    <script>
        var ctx = document.getElementById("myChart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: "<%=tipo%>",
            data: {
                labels: [<%=label.toString()%>],
                datasets: [
                    {
                        label: "Ventas",
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
