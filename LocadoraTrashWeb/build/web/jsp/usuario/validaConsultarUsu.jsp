<%-- 
    Document   : validaConsultarUsu
    Created on : 23 de out. de 2022, 11:06:44
    Author     : raian
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Usuario" %>
<%@page import="locadoratrash.controllers.ControllerUsuario" %>

<% 
    String login = request.getParameter("LOGIN");
    Usuario  usu = new Usuario(login);
    ControllerUsuario usucont = new ControllerUsuario();
    List<Usuario> usus = usucont.listar(usu);
    Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");
    String url = "PBUSCA=" + usu.getLogin()+"&ID=" ;

%>

<!DOCTYPE html>
<html>
     <%@include file="../../inc/materalizeWeb.inc" %>
    <title>LISTA USUÁRIOS - Locadora Trash</title>
    <body>
        <table class="striped responsive-table">
            <thead>
              <tr>
                  <th data-field="Id">Id</th>
                  <th data-field="Login">Login</th>
                  <th data-field="Senha">Senha</th>
                  <th data-field="Status">Status</th>
                  <th data-field="Tipo">Tipo</th>
                  <% if (usuLogado.getTipo().equals("ADM")) {%>
                  <th data-field="Excluir">Excluir</th>
                  <th data-field="Alterar">Alterar</th>
                  <% } %> 
              </tr>
            </thead>
            <% if (!(usus.isEmpty())) { %>    
                <tbody>
                    <% for (Usuario listaUsuario : usus) { %>
                        <tr>
                            <td><%=listaUsuario.getId()%></td>
                            <td><%=listaUsuario.getLogin()%></td>
                            <td><%=listaUsuario.getSenha()%></td>
                            <td><%=listaUsuario.getStatus()%></td>
                            <td><%=listaUsuario.getTipo()%></td>
                            <% if (usuLogado.getTipo().equals("ADM")) { %>
                                <td><a href="excluirUsuario.jsp?<%=url + listaUsuario.getId()%>">Excluir</a></td>
                                <td><a href="alterarUsuario.jsp?<%=url + listaUsuario.getId()%>">Alterar</a></td>
                            <% } %>
                        </tr>
                    <% } %>
                </tbody>
            <% } %>
        </table>    
    </body>
</html>
