<%-- 
    Document   : inserirUsuario
    Created on : 23 de out. de 2022, 11:06:14
    Author     : raian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>INSERIR - USUÁRIO</title>
    <body>
        <div class="container"/>
        <h1>INSERIR USUÁRIO</h1>
        <form name="inserirUsuario" action="validaInserirUsu.jsp" method="post">
            Login: <input type="text" name="LOGIN" value=""> <br>
            Senha: <input type="password" name="SENHA" value=""> <br>
            Status: <input type="text" name="STATUS" value=""> <br>
            Tipo: <input type="text" name="TIPO" value=""> <br>
            <button  class="waves-effect waves-light btn blue darken-1" type="submit" name="enviar">Enviar</button>
            <a class="waves-effect waves-light btn grey darken-1" onClick="history.back()">Voltar</a>
        </form>
    </div>
    <%@include file="../../inc/frameDetector.inc" %>
</body>
</html>
