<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Filme" %>
<%@page import="locadoratrash.controllers.ControllerFilme" %>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    Filme fil = new Filme(id);
    ControllerFilme filCont = new ControllerFilme();
    fil = filCont.excluir(fil);
    String pbusca = request.getParameter("PBUSCA");

    // REDIRECIONARA PARA PÁGINA LOGIN.JSP
    String url = "validaConsultarFil.jsp?genero=" + pbusca;
    response.sendRedirect(url);

%>
