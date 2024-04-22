<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Docente"%>
<html>
    <head>
        <%@ page
        language="java"
        contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"
        import="java.util.*"
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="GENERATOR" content="IBM WebSphere Studio">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Archivio Docente </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row mt-3 mb-3">
                <div class="col">
                    <h1>Archivio Docenti</h1>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <div class="container">
                        <form method="post" action="/WebProjectMavenized/CtrlArchivioDocente" name="ArchivioDocente">
                            <div class="d-grid">
                                <input type="submit" name="cmdAzione" value="Torna alla Home" class=" btn btn-primary btn-block">
                            </div>
                        </form>
                        <form method="post" action="/WebProjectMavenized/CtrlArchivioDocente" name="ArchivioDocente">
                                <table class="table table-hover table-dark table-responsive-sm">
                                    <tbody>
                                        <tr>
                                            <td> </td>
                                            <td>Cognome</td>
                                            <td>Nome</td>
                                        </tr>
                                        <tr>
                                        <%
                                           List<Docente> elenco = (List) request.getAttribute("elencoDocenti");
                                           if(!elenco.isEmpty()){
                                               for(Docente docente:elenco){
                                        %>
                                            <td><input type="radio" name="rdoIDDocente" value="<%= docente.getChiave() %>" required> </td>
                                            <td> <%= docente.getCognome() %></td>
                                            <td> <%= docente.getNome() %></td>
                                        </tr>
                                        <%
                                        } %>
                                    </tbody>
                                </table>
                                <% } else{%> Non ci sono Docenti<% } %> <br>

                                <div class="d-grid">
                                    <input type="submit" name="cmdAzione" value="Modifica" class=" btn btn-primary btn-block"><br>
                                    <input type="submit" name="cmdAzione" value="Elimina" class=" btn btn-primary btn-block">
                                </div>
                        </form>
                        <form method="post" action="/WebProjectMavenized/CtrlArchivioDocente" name="ArchivioDocente">
                            <div class="d-grid">
                                <input type="submit" name="cmdAzione" value="Nuovo" class=" btn btn-primary btn-block">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
