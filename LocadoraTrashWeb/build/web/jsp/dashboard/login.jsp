<%-- 
    Document   : login
    Created on : 23 de out. de 2022, 10:49:50
    Author     : raian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>LOGIN - LocadoraTrash</title>
    <body>
        <div class="container"/>
        <h1>LOGIN</h1>
        <form class="col s12" name="FORMLOGIN" action="menu.jsp" method="post">
            <div class="row">
                <div class="input-field col s8">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="login" name ="LOGIN" type="text" class="validate" required>
                    <label for="login">LOGIN</label>
                </div>
                <div class="input-field col s8">
                     <i class="material-icons prefix">lock</i>
                    <input id="senha" name ="SENHA" type="password" class="validate" required>
                    <label for="senha">SENHA</label>
                </div>
            </div>
            <button  class="waves-effect waves-light btn blue darken-1" type="submit" name="enviar">Entrar</button>
        </form>
    </div>
</body>
</html>
