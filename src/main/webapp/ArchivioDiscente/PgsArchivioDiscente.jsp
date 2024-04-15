<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Discente"%>
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
        <title>pgsArchivioDiscente.jsp</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
       <link rel="preconnect" href="https://fonts.googleapis.com">
       <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
       <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">

    </head>
    <body style="background:url('Applicazione/BG5.jpg') no-repeat; background-position:center; font-family:'Roboto', sans-serif;">

        <div class="container" style="margin-top:50px;">
            <h1 align="center">Archivio Discenti</h1>
        </div>
        <div align="center" class="container" style="margin-top:150px; width: 400px; height: 440px;box-shadow: 0 0 30px rgba(0, 0, 0, .5); background: transparent; padding:70px; border-radius: 20px; border: 2px solid rgba(255, 255, 255, .5); backdrop-filter: blur(20px);">
            <form method="post" action="/WebProjectMavenized/CtrlArchivioDiscente" name="ArchivioDiscente">
                <input type="submit" name="cmdAzione" value="Torna alla Home" class=" btn btn-primary">
            </form>
            <form method="post" action="/WebProjectMavenized/CtrlArchivioDiscente" name="ArchivioDiscente">
                    <table class="table table-hover table-dark table-responsive-sm mt-3" >
                        <tbody>
                            <tr>
                                <td> </td>
                                <td>Cognome</td>
                                <td>Nome</td>
                            </tr>
                            <tr>
                            <%
                              List<Discente> elenco= (List) request.getAttribute("elencoDiscenti");
                              if(!elenco.isEmpty()){
                                   for(Discente discente:elenco){
                            %>
                                <td><input type="radio" name="rdoIDDiscente" value="<%= discente.getChiave() %>" required ></td>
                                <td> <%= discente.getCognome() %></td>
                                <td> <%= discente.getNome() %></td>
                            </tr>
                            <%
                            } %>
                        </tbody>
                    </table>
                    <% } else{%> Non ci sono Discenti<% } %> <br>

                    <input type="submit" name="cmdAzione" value="Modifica" class=" btn btn-primary">
                    <input type="submit" name="cmdAzione" value="Elimina" class=" btn btn-primary">
            </form>
            <form method="post" action="/WebProjectMavenized/CtrlArchivioDiscente" name="ArchivioDiscente">
                <input type="submit" name="cmdAzione" value="Nuovo" class=" btn btn-primary">
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
