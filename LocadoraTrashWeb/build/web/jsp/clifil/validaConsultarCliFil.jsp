<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="locadoratrash.models.beans.Usuario" %>
<%@page import="locadoratrash.models.beans.Cliente" %>
<%@page import="locadoratrash.controllers.ControllerCliente" %>
<%@page import="locadoratrash.models.beans.Filme" %>
<%@page import="locadoratrash.controllers.ControllerFilme" %>
<%@page import="locadoratrash.models.beans.ClienteFilme" %>
<%@page import="locadoratrash.controllers.ControllerClienteFilme" %>

<%

    ControllerFilme filCont = new ControllerFilme();
    Filme filme = new Filme("");
    List<Filme> filmes = filCont.listar(filme);

    ControllerCliente cliCont = new ControllerCliente();
    Cliente cliente = new Cliente("");
    List<Cliente> clientes = cliCont.listar(cliente);

    String obs = request.getParameter("obs");
    ClienteFilme clifil = new ClienteFilme(obs);
    ControllerClienteFilme clifilCont = new ControllerClienteFilme();
    List<ClienteFilme> clifils = clifilCont.listar(clifil);

    Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");
    String url = "PBUSCA=" + obs + "&ID=";
%>

<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Aluguéis - Locadora Trash</title>
    </head>
    <body>
        <table class="striped responsive-table">
            <thead>
                <tr>
                    <th datalist id="Id">Id</th>
                    <th datalist id="idC">Nome Cliente</th>
                    <th datalist id="idF">Nome do Filme</th>
                    <th datalist id="dtaluga">Data da Retirada</th>
                    <th datalist id="dtdevolve">Data de Devolução</th>
                    <th datalist id="dtdevolve">Observação</th>
                        <% if (usuLogado.getTipo().equals("ADM")) {%>
                    <th datalist id="Excluir">Excluir</th>
                    <th datalist id="Alterar">Alterar</th>
                        <% } %>  
                </tr>
            </thead>
            <%if (!(clifils.isEmpty())) {%>
            <tbody>
                <% for (ClienteFilme listaCF : clifils) {%>
                <tr>
                    <td><%=listaCF.getId()%></td>
                    <%for (Cliente cli : clientes) {%>
                    <%if (cli.getId() == listaCF.getIdCliente()) {%>
                    <td><%=cli.getNome()%></td>
                    <%}%>
                    <%}%>
                    <% for (Filme fil : filmes) {%>
                    <%if (fil.getId() == listaCF.getIdFilme()) {%>
                    <td><%=fil.getNome()%></td>
                    <%}%>
                    <% }%>
                    <td><%= listaCF.getDtaluga()%></td>
                    <td><%=listaCF.getDtdevolve()%></td>
                    <td><%=listaCF.getObservacao()%></td>
                    <% if (usuLogado.getTipo().equals("ADM")) {%>
                    <td><a href="excluirCliFil.jsp?<%=url + listaCF.getId()%>">Excluir</a></td>
                    <td><a href="alterarCliFil.jsp?<%=url + listaCF.getId()%>">Alterar</a></td>
                    <% } %>
                </tr>
                <% } %>
            </tbody>
            <% }%>
    </body>
</html>
