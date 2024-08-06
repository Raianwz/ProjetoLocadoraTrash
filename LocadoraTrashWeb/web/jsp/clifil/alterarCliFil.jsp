<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="locadoratrash.models.beans.Cliente" %>
<%@page import="locadoratrash.controllers.ControllerCliente" %>
<%@page import="locadoratrash.models.beans.Filme" %>
<%@page import="locadoratrash.controllers.ControllerFilme" %>
<%@page import="locadoratrash.models.beans.ClienteFilme" %>
<%@page import="locadoratrash.controllers.ControllerClienteFilme" %>

<%
    ControllerFilme filCont = new ControllerFilme();
    Filme fil = new Filme("");
    List<Filme> fils = filCont.listar(fil);

    ControllerCliente cliCont = new ControllerCliente();
    Cliente cli = new Cliente("");
    List<Cliente> clis = cliCont.listar(cli);

    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    ClienteFilme clifil = new ClienteFilme(id);
    ControllerClienteFilme clifilCont = new ControllerClienteFilme();
    clifil = clifilCont.buscar(clifil);
    String pbusca = request.getParameter("PBUSCA");
%>

<html>
    <head>
        <%@include file="../../inc/materalizeWeb.inc" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Aluguel - LocadoraTrash</title>
        <style> label.lblfont{
                font-size: 1.1em;
                color: #444444;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>ALTERAR ALUGUEL</h1>
            <form name="alterarCliFil" action="validaAlterarCliFil.jsp" method="post">
                <label class="lblfont">Nome do Cliente</label>
                <select name="idC" class="browser-default" required>
                    <% for (Cliente cliente : clis) {%>
                    <% if (cliente.getId() == clifil.getIdCliente()) {%>
                    <option selected value="<%=cliente.getId()%>"><%=cliente.getNome()%></option>
                    <% } else {%>
                    <option value="<%=cliente.getId()%>"><%=cliente.getNome()%></option>
                    <% } %>
                    <% } %>
                </select>
                <br>
                <label class="lblfont">Nome do Filme</label>
                <select name="idF" class="browser-default" required>
                    <% for (Filme filme : fils) {%>
                    <% if (filme.getId() == clifil.getIdFilme()) {%>
                    <option selected value="<%=filme.getId()%>"><%=filme.getNome()%></option>
                    <% } else {%>
                    <option value="<%=filme.getId()%>"><%=filme.getNome()%></option>
                    <% } %>
                    <% }%>
                </select>
                <div class="row">
                    <label class="lblfont input-field col s2" for="dtaluga">Data de Retirada</label>
                    <div class="input-field col s10">
                        <input id="dtaluga" name ="dtaluga" type="text" value="<%= clifil.getDtaluga()%>" class="validate" required>
                    </div>
                    <br>
                    <label class="lblfont input-field col s2" for="dtdevolve">Data de Devolução</label>
                    <div class="input-field col s10">
                        <input id="dtdevolve" name ="dtdevolve" type="text" value="<%= clifil.getDtdevolve()%>" class="validate" required>
                    </div>
                    <label class="lblfont input-field col s2">Observação</label>
                    <div class="input-field col s9">
                        <input value="<%=clifil.getObservacao()%>" id="obs" name ="obs" type="text" class="validate" required>
                    </div>
                </div>
                <input type="HIDDEN" name="ID" value="<%=clifil.getId()%>"> <br>
                <input type="HIDDEN" name="PBUSCA" value="<%=pbusca%>">
                <br>
                <button  class="waves-effect waves-light btn blue darken-1" type="submit" name="enviar">Enviar</button>
                <a class="waves-effect waves-light btn grey darken-1" onClick="history.back()">Voltar</a>
            </form>
        </div>
        <%@include file="../../inc/frameDetector.inc" %>
    </body>
</html>
