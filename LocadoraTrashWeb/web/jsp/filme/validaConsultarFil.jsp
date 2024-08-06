<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Usuario" %>
<%@page import="locadoratrash.models.beans.Filme" %>
<%@page import="locadoratrash.controllers.ControllerFilme" %>

<% 
    String genero = request.getParameter("genero");
    Filme fil = new Filme(genero);
    ControllerFilme filCont = new ControllerFilme();
    List<Filme> fils = filCont.listar(fil);
    Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");
    String url = "PBUSCA=" + genero + "&ID=";
%>

<!DOCTYPE html>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Filmes - Locadora Trash</title>
    </head>
    <body>
        <table class="striped responsive-table">
            <thead>
                <tr>
                    <th datalist id="Id">Id</th>
                    <th datalist id="Nome">Nome</th>
                    <th datalist id="Genero">Gênero</th>
                    <th datalist id="Ano">Ano</th>
                    <% if (usuLogado.getTipo().equals("ADM")) {%>
                    <th datalist id="Excluir">Excluir</th>
                    <th datalist id="Alterar">Alterar</th>
                    <% } %>  
                </tr>
            </thead>
            <%if (!(fils.isEmpty())) {%>
            <tbody>
                <% for (Filme listaFil : fils) {%>
                <tr>
                    <td><%=listaFil.getId()%></td>
                    <td><%=listaFil.getNome()%></td>
                    <td><%=listaFil.getGenero()%></td>
                    <td><%=listaFil.getAno()%></td>
                    <% if (usuLogado.getTipo().equals("ADM")) {%>
                    <td><a href="excluirFilme.jsp?<%=url + listaFil.getId()%>">Excluir</a></td>
                    <td><a href="alterarFilme.jsp?<%=url + listaFil.getId()%>">Alterar</a></td>
                    <% } %>     
                </tr>
                <% }%>     
            </tbody>
            <% }%>
        </table>
    </body>
</html>