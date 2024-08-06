<%-- 
    Document   : validaAlterarUsu
    Created on : 23 de out. de 2022, 11:06:33
    Author     : raian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Usuario" %>
<%@page import="locadoratrash.controllers.ControllerUsuario" %>
<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    String login = request.getParameter("LOGIN");
    String senha = request.getParameter("SENHA");
    String status = request.getParameter("STATUS");
    String tipo = request.getParameter("TIPO");
    String pbusca = request.getParameter("PBUSCA");

    Usuario usu = new Usuario(id, login, senha, status, tipo);
    ControllerUsuario usuCont = new ControllerUsuario();
    usu = usuCont.alterar(usu);
    // REDIRECIONA PARA A PAG LOGIN.JSP
    String url = "validaConsultarUsu.jsp?LOGIN=" + pbusca;
    response.sendRedirect(url);

%>
