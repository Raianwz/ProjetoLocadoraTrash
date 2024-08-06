<%-- 
    Document   : validaInserirCli
    Created on : 30 de out. de 2022, 15:07:02
    Author     : raian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Cliente" %>
<%@page import="locadoratrash.controllers.ControllerCliente" %>
<%
    String nome = request.getParameter("NOME");
    String email = request.getParameter("EMAIL");
    String telefone = request.getParameter("TELEFONE");
    String status = request.getParameter("STATUS");
    Cliente cli = new Cliente(nome, email, telefone, status);
    ControllerCliente cliCont = new ControllerCliente();
    cli = cliCont.inserir(cli);
    
    String url = "inserirCliente.jsp";
    response.sendRedirect(url);
%>
