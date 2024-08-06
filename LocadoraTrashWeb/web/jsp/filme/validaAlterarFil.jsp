<%@page import="locadoratrash.models.beans.Filme" %>
<%@page import="locadoratrash.controllers.ControllerFilme" %>

<!DOCTYPE html>
<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    String nome = request.getParameter("nome");
    String genero = request.getParameter("genero");
    String ano = request.getParameter("ano");
    String pbusca = request.getParameter("PBUSCA");

    Filme fil = new Filme(id, nome, genero, ano);
    ControllerFilme filCont = new ControllerFilme();
    fil = filCont.alterar(fil);

    // REDIRECIONA PARA A PAG validaConsultaCliente
    String url = "validaConsultarFil.jsp?genero=" + pbusca;
    response.sendRedirect(url);
%>