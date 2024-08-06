<%-- 
    Document   : excluirCliente
    Created on : 30 de out. de 2022, 14:56:47
    Author     : raian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Cliente" %>
<%@page import="locadoratrash.controllers.ControllerCliente" %>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    Cliente cli = new Cliente(id);
    ControllerCliente cliCont = new ControllerCliente();
    cli = cliCont.excluir(cli);
    String pbusca = request.getParameter("PBUSCA");

    // REDIRECIONARA PARA PÁGINA LOGIN.JSP
    String url = "validaConsultarCli.jsp?nome=" + pbusca;
    response.sendRedirect(url);

%>
