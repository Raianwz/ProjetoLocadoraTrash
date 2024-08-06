<%-- 
    Document   : conlsutarFilme
    Created on : 2 de nov. de 2022, 13:23:17
    Author     : raian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <%@include file="../../inc/materalizeWeb.inc" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Filme - LocadoraTrash</title>
    </head>
</head>
<body>
    <div class="container">
        <h1>CONSULTAR FILME</h1>
        <form name="consultarCliente" action="validaConsultarFil.jsp" method="post">
            GÊNERO <input type="text" name ="genero" value=""> <br>
            <button  class="waves-effect waves-light btn blue darken-1" type="submit" name="enviar">Enviar</button>
            <a class="waves-effect waves-light btn grey darken-1" onClick="history.back()">Voltar</a>
        </form>
        <%@include file="../../inc/frameDetector.inc" %>
    </div>
</body>
</html>
