<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Filme" %>
<%@page import="locadoratrash.controllers.ControllerFilme" %>

<!DOCTYPE html>
<%
    String nome = request.getParameter("nome");
    String genero = request.getParameter("genero");
    String ano = request.getParameter("ano");
    Filme fil = new Filme(nome, genero, ano);
    ControllerFilme filCont = new ControllerFilme();
    fil = filCont.inserir(fil);
    
    String url = "inserirFilme.jsp";
    response.sendRedirect(url);
%>
