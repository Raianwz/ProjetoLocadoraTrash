<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Usuario" %>
<%@page import="locadoratrash.controllers.ControllerUsuario" %>

<%
    String cod = request.getParameter("ID");
    String pbusca = request.getParameter("PBUSCA");
    int id = Integer.parseInt(cod);
    Usuario usu = new Usuario(id);
    ControllerUsuario usuCont = new ControllerUsuario();
    usu = usuCont.excluir(usu);

    // REDIRECIONARA PARA PÁGINA LOGIN.JSP
    String url = "validaConsultarUsu.jsp?LOGIN=" + pbusca;
    response.sendRedirect(url);  
%>