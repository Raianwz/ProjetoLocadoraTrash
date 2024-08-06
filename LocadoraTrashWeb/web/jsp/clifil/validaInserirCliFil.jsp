<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.ClienteFilme" %>
<%@page import="locadoratrash.controllers.ControllerClienteFilme" %>

<%
    Integer idC = Integer.parseInt(request.getParameter("idC"));
    Integer idF = Integer.parseInt(request.getParameter("idF"));
    String dtAluga = request.getParameter("dtaluga");
    String dtDevolve = request.getParameter("dtdevolve");
    String obs = request.getParameter("obs");
    ClienteFilme clifil = new ClienteFilme(idC, idF, dtAluga, dtDevolve, obs);
    ControllerClienteFilme cfCont = new ControllerClienteFilme();
    clifil = cfCont.inserir(clifil);

    // REDIRECIONA PARA A PAG LOGIN.JSP
    String url = "inserirCliFil.jsp";
    response.sendRedirect(url);

%>
