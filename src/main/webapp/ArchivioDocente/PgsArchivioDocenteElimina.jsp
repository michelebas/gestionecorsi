<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <%@ page language="java"
        contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"
        %>
        <meta charset="ISO-8859-1">
        <title>pgsArchivioDocenteElimina</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <jsp:useBean id="beanDocente" scope="session"
            class="model.session.Docente">
            <jsp:setProperty name="beanDocente" property="*" />
        </jsp:useBean>

        <div class="container-fluid">
            <div class="row mt-3 mb-3">
                <div class="col">
                    <h1>Vuoi eliminare il Docente?</h1>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <div class="container">
                        <form method="post" action="/WebProjectMavenized/CtrlArchivioDocente">
                            <div class="d-grid">
                                <input type="submit" name="cmdAzione" value="Conferma" class=" btn btn-primary btn-block"><br>
                                <input type="submit" name="cmdAzione" value="Annulla" class=" btn btn-primary btn-block">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>