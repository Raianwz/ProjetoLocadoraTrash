<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Filme" %>
<%@page import="locadoratrash.controllers.ControllerFilme" %>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    Filme fil = new Filme(id);
    ControllerFilme filCont = new ControllerFilme();
    fil = filCont.buscar(fil);
    String pbusca = request.getParameter("PBUSCA");

%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../inc/materalizeWeb.inc" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Filme - LocadoraTrash</title>
    </head>
    <body>
        <div class="container">
            <h1>ALTERAR FILME</h1>
            <form name="alterarFilme" action="validaAlterarFil.jsp" method="post">
                Nome: <input type="text" name="nome" value="<%=fil.getNome()%>" required><br>
                Gênero: <input type="text" name="genero" value="<%=fil.getGenero()%>" required><br>
                Ano: <input type="text" name="ano" value="<%=fil.getAno()%>" required><br>
                <input type="HIDDEN" name="ID" value="<%=fil.getId()%>"> <br>
                <input type="HIDDEN" name="PBUSCA" value="<%=pbusca%>"> <br>
                <input class="waves-effect waves-light btn blue darken-1" type="submit" name="enviar" value="Enviar">
                <a class="waves-effect waves-light btn grey darken-1" onClick="history.back()">Voltar</a>
            </form>
        </div>
        <%@include file="../../inc/frameDetector.inc" %>
    </body>
</html>