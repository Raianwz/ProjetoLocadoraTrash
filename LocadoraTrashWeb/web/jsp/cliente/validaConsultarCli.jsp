<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Usuario" %>
<%@page import="locadoratrash.models.beans.Cliente" %>
<%@page import="locadoratrash.controllers.ControllerCliente" %>

<%
    String nome = request.getParameter("nome");
    Cliente cli = new Cliente(nome);
    ControllerCliente cliCont = new ControllerCliente();
    List<Cliente> clis = cliCont.listar(cli);
    Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");
    String url = "PBUSCA=" + nome + "&ID=";
%>

<!DOCTYPE html>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Clientes - Locadora Trash</title>
    </head>
    <body>
        <table class="striped responsive-table">
            <thead>
                <tr>
                    <th datalist id="Id">Id</th>
                    <th datalist id="Nome">Nome</th>
                    <th datalist id="Email">Email</th>
                    <th datalist id="Telefone">Telefone</th>
                    <th datalist id="Status">Status</th>
                    <th datalist id="Excluir">Excluir</th>
                    <th datalist id="Alterar">Alterar</th>
                </tr>
            </thead>
            <%if (!(clis.isEmpty())) {%>
            <tbody>
                <% for (Cliente listaCli : clis) {%>
                <tr>
                    <td><%=listaCli.getId()%></td>
                    <td><%=listaCli.getNome()%></td>
                    <td><%=listaCli.getEmail()%></td>
                    <td><%=listaCli.getTelefone()%></td>
                    <td><%=listaCli.getStatus()%></td>
                    <% if (usuLogado.getTipo().equals("ADM")) {%>
                    <td><a href="excluirCliente.jsp?<%=url + listaCli.getId()%>">Excluir</a></td>
                    <td><a href="alterarCliente.jsp?<%=url + listaCli.getId()%>">Alterar</a></td>
                    <% } %>     
                </tr>
                <% }%>     
            </tbody>
            <% }%>
        </table>
    </body>
</html>
