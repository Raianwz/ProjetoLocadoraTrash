<%-- 
    Document   : validaInserirUsu
    Created on : 23 de out. de 2022, 11:06:56
    Author     : raian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Usuario" %>
<%@page import="locadoratrash.controllers.ControllerUsuario" %>

<%
    String login = request.getParameter("LOGIN");
    String senha = request.getParameter("SENHA");
    String status = request.getParameter("STATUS");
    String tipo = request.getParameter("TIPO");
    Usuario usu = new Usuario(login,senha,status,tipo);
    ControllerUsuario usucont = new ControllerUsuario();
    usu = usucont.inserir(usu);

    // REDIRECIONA PARA A PAG LOGIN.JSP
    String url = "inserirUsuario.jsp";
    response.sendRedirect(url);
%>
<!DOCTYPE html>
<html>
    <body>
        <%=login%>  <BR>
        <%=senha%>  <BR>
        <%=status%> <BR>
        <%=tipo%>   <BR>
    </body>
</html>
