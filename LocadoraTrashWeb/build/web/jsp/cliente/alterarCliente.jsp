<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Cliente" %>
<%@page import="locadoratrash.controllers.ControllerCliente" %>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    Cliente cli = new Cliente(id);
    ControllerCliente cliCont = new ControllerCliente();
    cli = cliCont.buscar(cli);
    String pbusca = request.getParameter("PBUSCA");
%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../inc/materalizeWeb.inc" %>
        <meta content="text/html; charset=UTF-8">
        <title>Alterar Cliente - LocadoraTrash</title>
    </head>
    <body>
        <div class="container">
            <h1>ALTERAR CLIENTE</h1>
            <form clas="col s8" name="alterarCliente" action="validaAlterarCli.jsp" method="post">
                Nome: <input type="text" name="nome" value="<%=cli.getNome()%>" required><br>
                Email: <input type="text" name="email" value="<%=cli.getEmail()%>" required><br>
                Telefone: <input type="text" name="telefone" value="<%=cli.getTelefone()%>" required><br>
                Status: <input type="text" name="status" value="<%=cli.getStatus()%>" required><br>
                <input type="HIDDEN" name="ID" value="<%=cli.getId()%>"> <br>
                <input type="HIDDEN" name="PBUSCA" value="<%=pbusca%>"> <br>
                <input class="waves-effect waves-light btn blue darken-1" type="submit" name="enviar" value="Enviar">
                <a class="waves-effect waves-light btn grey darken-1" onClick="history.back()">Voltar</a>
            </form>
        </div>
        <%@include file="../../inc/frameDetector.inc" %>
    </body>
</html>
