<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Filme - LocadoraTrash</title>
    </head>
    <body>
        <div class="container"/>
        <h1>INSERIR FILME</h1>
        <form name="inserirFilme" action="validaInserirFil.jsp" method="post">
            Nome: <input type="text" name="nome" value=""/> <br>
            Gênero: <input type="text" name="genero" value=""/> <br>
            Ano: <input type="text" name="ano" value=""/> <br>
            <button  class="waves-effect waves-light btn blue darken-1" type="submit" name="enviar">Enviar</button>
            <a class="waves-effect waves-light btn grey darken-1" onClick="history.back()">Voltar</a>
        </form>
    </div>
    <%@include file="../../inc/frameDetector.inc" %>
</body>
</html>