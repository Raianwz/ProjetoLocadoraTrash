<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="locadoratrash.models.beans.Cliente" %>
<%@page import="locadoratrash.controllers.ControllerCliente" %>
<%@page import="locadoratrash.models.beans.Filme" %>
<%@page import="locadoratrash.controllers.ControllerFilme" %>

<%
    ControllerFilme filCont = new ControllerFilme();
    Filme fil = new Filme("");
    List<Filme> fils = filCont.listar(fil);

    ControllerCliente cliCont = new ControllerCliente();
    Cliente cli = new Cliente("");
    List<Cliente> clis = cliCont.listar(cli);
%>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../inc/materalizeWeb.inc" %>
        <meta content="text/html; charset=UTF-8">
        <title>Inserir Aluguel - LocadoraTrash</title>
        <style> label.lblfont{
                font-size: 1.1em;
                color: #444444;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>INSERIR ALUGUEL</h1>
            <form name="inserirCliLiv" action="validaInserirCliFil.jsp" method="post">
                <label class="lblfont">Nome do Cliente</label>
                <select name="idC" class="browser-default" required>
                    <option value="" disabled selected>Selecione ...</option>
                    <% for (Cliente cliente : clis) {%>
                    <option value="<%=cliente.getId()%>"><%=cliente.getNome()%></option>
                    <% } %>
                </select>
                <br>
                <label class="lblfont">Nome do Filme</label>
                <select name="idF" class="browser-default" required>
                    <option value="" disabled selected>Selecione ...</option>
                    <% for (Filme filme : fils) {%>
                    <option value="<%=filme.getId()%>"><%=filme.getNome()%></option>
                    <% }%>
                </select>
                <div class="row">
                    <label class="lblfont input-field col s2" for="dtaluga">Data de Retirada</label>
                    <div class="input-field col s10">
                        <input id="dtaluga" name ="dtaluga" type="date" class="validate" required>
                    </div>
                    <br>
                    <label class="lblfont input-field col s2" for="dtdevolve">Data de Devolução</label>
                    <div class="input-field col s10">
                        <input id="dtdevolve" name ="dtdevolve" type="date" class="validate" required>
                    </div>
                    <label class="lblfont input-field col s2">Observação</label>
                    <div class="input-field col s9">
                        <input placeholder="Dentro ou Fora do Prazo / Aguardando" id="obs" name ="obs" type="text" class="validate" required>
                    </div>
                </div>
                <br>
                <button  class="waves-effect waves-light btn blue darken-1" type="submit" name="enviar">Enviar</button>
                <a class="waves-effect waves-light btn grey darken-1" onClick="history.back()">Voltar</a>
            </form>
        </div>
    </div>
    <%@include file="../../inc/frameDetector.inc" %>
</body>
</html>
