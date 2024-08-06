<%-- 
    Document   : inserirCliente
    Created on : 30 de out. de 2022, 14:42:59
    Author     : raian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../inc/materalizeWeb.inc" %>
        <title>Inserir Cliente - LocadoraTrash</title>
    </head>
    <body>
        <div class="container"/>
        <h1>INSERIR CLIENTE</h1>
        <form name="inserirCliente" action="validaInserirCli.jsp" method="post">
            Nome: <input type="text" name="NOME" value=""> <br>
            Email: <input type="text" name="EMAIL" value=""> <br>
            Telefone: <input type="text" name="TELEFONE" value=""> <br>
            Status: <input type="text" name="STATUS" value=""> <br>
            <input class="waves-effect waves-light btn blue darken-1" type="submit" name="Enviar" value="Enviar">
            <a class="waves-effect waves-light btn grey darken-1" onClick="history.back()">Voltar</a>
        </form>
    </div>
    <%@include file="../../inc/frameDetector.inc" %>
</body>
</html>

