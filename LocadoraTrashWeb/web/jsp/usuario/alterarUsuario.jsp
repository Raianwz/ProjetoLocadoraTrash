<%-- 
    Document   : alterarUsuario
    Created on : 23 de out. de 2022, 11:05:33
    Author     : raian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Usuario" %>
<%@page import="locadoratrash.controllers.ControllerUsuario" %>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    Usuario usu = new Usuario(id);
    ControllerUsuario usuCont = new ControllerUsuario();
    usu = usuCont.buscar(usu);
    String pbusca = request.getParameter("PBUSCA");

%>

<!DOCTYPE html>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Usuario - LocadoraTrash</title>
    </head>
    <body>
        <div class="container"/>
        <h1>ALTERAR USUÁRIO</h1>
        <form name="alterarUsuario" action="validaAlterarUsu.jsp" method="post">
            Login: <input type="text" name="LOGIN" value="<%=usu.getLogin()%>"> <br>
            Senha: <input type="password" name="SENHA" value="<%=usu.getSenha()%>"> <br>
            Status: <input type="text" name="STATUS" value="<%=usu.getStatus()%>"> <br>
            Tipo: <input type="text" name="TIPO" value="<%=usu.getTipo()%>"> <br>
            <input type="HIDDEN" name="ID" value="<%=usu.getId()%>"> <br>
            <input type="HIDDEN" name="PBUSCA" value="<%=pbusca%>"> <br>
            <input type="submit" name="Enviar" value="OK">
        </form>
        <div>
            <%@include file="../../inc/frameDetector.inc" %>
    </body>
</html>
