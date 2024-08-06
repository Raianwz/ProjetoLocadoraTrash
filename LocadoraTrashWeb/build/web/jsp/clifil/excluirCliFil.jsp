<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.ClienteFilme" %>
<%@page import="locadoratrash.controllers.ControllerClienteFilme" %>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    String pbusca = request.getParameter("PBUSCA");
    ClienteFilme clifil = new ClienteFilme(id);
    ControllerClienteFilme cfCont = new ControllerClienteFilme();
    clifil = cfCont.excluir(clifil);

    // REDIRECIONA PARA A PAG validaConsultarCliFil.JSP
    String url = "validaConsultarCliFil.jsp?obs=" + pbusca;
    response.sendRedirect(url);

%>
