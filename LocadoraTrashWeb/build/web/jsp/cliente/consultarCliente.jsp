<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Cliente - LocadoraTrash</title>
    </head>
    <body>
        <div class="container"/>
        <h1>CONSULTAR CLIENTE</h1>
        <form name="consultarCliente" action="validaConsultarCli.jsp" method="post">
            NOME <input type="text" name ="nome" value=""> <br>
            <input class="waves-effect waves-light btn blue darken-1" type="submit" name="Enviar" value="Enviar">
            <a class="waves-effect waves-light btn grey darken-1" onClick="history.back()">Voltar</a>
        </form>
        <%@include file="../../inc/frameDetector.inc" %>
    </body>
</html>
