<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.celumax.ecomclm.Model.MVenta,com.celumax.ecomclm.Data.DVenta" %>

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
                            "rgba(153,205,1,0.6)", "lightblue", "lightred", "peru", "yellow", "orange", "blue", "green"
                        ],
                    },
                ],
            },
        });
    </script>
</body>
</html>
