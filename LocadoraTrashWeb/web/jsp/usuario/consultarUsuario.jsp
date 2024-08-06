<%-- 
    Document   : consultarUsuario
    Created on : 23 de out. de 2022, 11:05:49
    Author     : raian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Usuario - LocadoraTrash</title>
    </head>
    <body>
        <div class="container"/>
        <h1>CONSULTAR USUÁRIO</h1>
        <form name="consultarUsuario" action="validaConsultarUsu.jsp" method="post">
            LOGIN <input type="text" name ="LOGIN" value=""> <br>
            <input class="waves-effect waves-light btn blue darken-1" type="submit" name="Enviar" value="Enviar">
            <a class="waves-effect waves-light btn grey darken-1" onClick="history.back()">Voltar</a>
        </form>
    </div>
    <%@include file="../../inc/frameDetector.inc" %>
</body>
</html>
