<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="locadoratrash.models.beans.ClienteFilme" %>
<%@page import="locadoratrash.controllers.ControllerClienteFilme" %>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    Integer idC = Integer.parseInt(request.getParameter("idC"));
    Integer idF = Integer.parseInt(request.getParameter("idF"));
    String dtAluga = request.getParameter("dtaluga");
    String dtDevolve = request.getParameter("dtdevolve");
    String obs = request.getParameter("obs");
    String pbusca = request.getParameter("PBUSCA");
    ClienteFilme clifil = new ClienteFilme(id, idC, idF, dtAluga, dtDevolve, obs);
    ControllerClienteFilme cfCont = new ControllerClienteFilme();
    clifil = cfCont.alterar(clifil);

    // REDIRECIONA PARA A PAG validaConsultarCliFil.JSP
    String url = "validaConsultarCliFil.jsp?obs=" + pbusca;
    response.sendRedirect(url);

%>

