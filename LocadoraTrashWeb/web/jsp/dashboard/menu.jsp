<%-- 
    Document   : menu
    Created on : 23 de out. de 2022, 10:53:07
    Author     : raian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="locadoratrash.models.beans.Usuario"%>
<%@page import="locadoratrash.controllers.ControllerUsuario"%>

<%
    String login = request.getParameter("LOGIN");
    String senha = request.getParameter("SENHA");
    Usuario usuEntrada = new Usuario(login, senha);
    ControllerUsuario usucont = new ControllerUsuario();
    Usuario usuSaida = usucont.validarWEB(usuEntrada);
    session.setAttribute("UsuarioLogado", usuSaida);
%>

<!DOCTYPE html>
<html lang="pt-BR">
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>Sistema LocadoraTrash</title>
    <body>
        <nav>
            <div class="nav-wrapper teal lighten-1">
                <a href="#" class="brand-logo right">Locadora Trash</a>
                <ul id="nav-mobile" class="center hide-on-med-and-down">
                    <!-- Dropdown1 Trigger -->
                    <li><a class='dropdown-button' data-beloworigin="true" href='#' data-activates='dropdown1'>Gerênciar Usuário</a></li>        
                    <li><a class='dropdown-button' data-beloworigin="true" href='#' data-activates='dropdown2'>Gerênciar Cliente</a></li>       
                    <li><a class='dropdown-button' data-beloworigin="true" href='#' data-activates='dropdown3'>Gerênciar Filmes</a></li>       
                    <li><a class='dropdown-button' data-beloworigin="true" href='#' data-activates='dropdown4'>Gerênciar Aluguéis</a></li>   
                </ul>
            </div>
        </nav>
        <% if (usuSaida != null) { %>


        <% if (usuSaida.getTipo().equals("ADM")) { %>
        <!-- Dropdown1 Structure -->
        <ul id='dropdown1' class=' dropdown-content'>
            <li><a onClick="changeIframe('../usuario/inserirUsuario.jsp')">Inserir Usuário</a></li>
            <li><a onClick="changeIframe('../usuario/consultarUsuario.jsp')">Consultar Usuários</a></li>
            <!-- <li><a href="../usuario/inserirUsuario.jsp">Inserir Usuário</a></li>
                <li><a href="../usuario/consultarUsuario.jsp">Consultar Usuários</a></li> -->
        </ul>
        <% } else { %>
        <ul id='dropdown1' class=' dropdown-content'>
            <li><a onClick="changeIframe('../usuario/consultarUsuario.jsp')">Consultar Usuários</a></li>
            <!-- <li><a href="../usuario/consultarUsuario.jsp">Consultar Usuários</a></li> -->
        </ul>
        <% } %>
        <% if (usuSaida.getTipo().equals("ADM")) { %>
        <!-- Dropdown2 Structure -->
        <ul id='dropdown2' class=' dropdown-content'>
            <li><a onClick="changeIframe('../cliente/inserirCliente.jsp')">Inserir Cliente</a></li>
            <li><a onClick="changeIframe('../cliente/consultarCliente.jsp')">Consultar Clientes</a></li>
            <!-- <li><a href="../cliente/inserirCliente.jsp">Inserir Cliente</a></li>
                <li><a href="../cliente/consultarCliente.jsp">Consultar Clientes</a></li>-->
        </ul>
        <% } else { %>
        <ul id='dropdown2' class=' dropdown-content'>
            <li><a onClick="changeIframe('../cliente/consultarCliente.jsp')">Consultar Clientes</a></li>
            <!--<li><a href="../cliente/consultarCliente.jsp">Consultar Clientes</a></li>-->
        </ul>
        <% } %>
        <% if (usuSaida.getTipo().equals("ADM")) { %>
        <!-- Dropdown3 Structure -->
        <ul id='dropdown3' class=' dropdown-content'>
            <li><a onClick="changeIframe('../filme/inserirFilme.jsp')">Inserir Filme</a></li>
            <li><a onClick="changeIframe('../filme/consultarFilme.jsp')">Consultar Filmes</a></li>
            <!--<li><a href="../filme/inserirFilme.jsp">Inserir Filme</a></li>
            <li><a href="../filme/consultarFilme.jsp">Consultar Filmes</a></li>-->
        </ul>
        <% } else { %>
        <ul id='dropdown3' class=' dropdown-content'>
            <li><a onClick="changeIframe('../filme/consultarFilme.jsp')">Consultar Filmes</a></li>
            <!--<li><a href="../filme/consultarFilme.jsp">Consultar Filmes</a></li>-->
        </ul>
        <% } %>
        <% if (usuSaida.getTipo().equals("ADM")) { %>
        <!-- Dropdown3 Structure -->
        <ul id='dropdown4' class=' dropdown-content'>
            <li><a onClick="changeIframe('../clifil/inserirCliFil.jsp')">Inserir Aluguel</a></li>
            <li><a onClick="changeIframe('../clifil/consultarCliFil.jsp')">Consultar Aluguel</a></li>
            <!--<li><a href="../clifil/inserirCliFil.jsp">Inserir Aluguel</a></li>
            <li><a href="../clifil/consultarCliFil.jsp">Consultar Aluguel</a></li>-->
        </ul>
        <% } else { %>
        <ul id='dropdown4' class=' dropdown-content'>
            <li><a onClick="changeIframe('../clifil/consultarCliFil.jsp')">Consultar Aluguel</a></li>
            <!--<li><a href="../clifil/consultarCliFil.jsp">Consultar Aluguel</a></li>-->
        </ul>
        <% } %>

        <iframe id="frm" src=""  scrolling="no" style="width: 100%;height: 100vh;overflow: hidden;border: none;padding: 1em;" ></iframe>
        <script type="application/javascript">
            function changeIframe(url){
                var frm = document.querySelector('iframe#frm');
                frm.src = "" + url +"";
            }
        </script>

        <% } else { %>
        <div class="container">
            <h1>USUÁRIO INVÁLIDO</h1>
            <p class="flow-text">Redirecionando para login.</p>
            <script type="text/javascript">
                setTimeout(() => {
                    window.location.href = "./login.jsp";
                }, 5 * 1000)
            </script>
        </div>
        <% }%>
    </body>
</html>
