<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../inc/materalizeWeb.inc" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Aluguel - LocadoraTrash</title>
    </head>
    <body>
        <div class="container">
            <h1>CONSULTAR ALUGUEL</h1>
            <form name="consultarClienteFilme" action="validaConsultarCliFil.jsp" method="post">
                OBSERVAÇÃO <input type="text" name ="obs" value=""> <br>
                <button  class="waves-effect waves-light btn blue darken-1" type="submit" name="enviar">Enviar</button>
                <a class="waves-effect waves-light btn grey darken-1" onClick="history.back()">Voltar</a>
            </form>
        </div>
        <%@include file="../../inc/frameDetector.inc" %>
    </body>
</html>
