<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Cliente" %>
<%@page import="locadoratrash.controllers.ControllerCliente" %>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String telefone = request.getParameter("telefone");
    String status = request.getParameter("status");
    String pbusca = request.getParameter("PBUSCA");

    Cliente cli = new Cliente(id, nome, email, telefone, status);
    ControllerCliente cliCont = new ControllerCliente();
    cli = cliCont.alterar(cli);

    // REDIRECIONA PARA A PAG validaConsultaCliente
    String url = "validaConsultarCli.jsp?nome=" + pbusca;
    response.sendRedirect(url);
%>