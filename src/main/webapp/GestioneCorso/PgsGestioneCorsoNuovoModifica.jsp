<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Docente"%>
<%@page import="model.dao.DocenteService"%>
<%@page import="model.session.Discente"%>
<%@page import="model.dao.DiscenteService"%>
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
        <title>pgsGestioneCorsoNuovoModifica.jsp</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    </head>
    <body style="background:url('Applicazione/BG5.jpg') no-repeat; background-position:center; font-family:'Roboto', sans-serif;">

        <jsp:useBean id="beanCorso" scope="session"
            class="model.session.Corso">
            <jsp:setProperty name="beanCorso" property="*" />
        </jsp:useBean>

        <div class="container" style="margin-top:50px;">
            <h1 align="center">Crea nuovo Corso</h1>
        </div>

        <div class="container" style="margin-top:120px;width:50%; box-shadow: 0 0 30px rgba(0, 0, 0, .5); background: transparent; padding:70px; border-radius: 20px; border: 2px solid rgba(255, 255, 255, .5); backdrop-filter: blur(20px);">
            <form method="post" action="/WebProjectMavenized/CtrlGestioneCorso" class="was-validated">
                <div align="center" >
                    <div class="mb-3 mt-3" style="width:50%;">
                        <input type="text" class="form-control" name="txtNome" value="<%= beanCorso.getNome()%>" maxlength="50" placeholder="Nome Corso" required>
                            <div class="invalid-feedback">Per favore inserisci il nome</div>
                    </div><br>
                    <div class="mb-3" style="width:50%;">
                        <input type="number" class="form-control" name="txtDurata" value="<%= beanCorso.getDurata()%>" min="1" placeholder="Durata" required>
                        <div class="invalid-feedback">Per favore inserisci la durata</div>
                    </div>
                    <div class="container mb-3">
                        <table class="table table-hover table-dark table-responsive-sm mt-3">
                            <thead>
                                <th></th>
                                <th>Scegli il docente</th>
                                <th></th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td>Cognome</td>
                                    <td>Nome</td>
                                </tr>
                                <tr>
                                <%
                                   DocenteService oDocenteService = new DocenteService();
                                   List<Docente> elencoDocenti = oDocenteService.findAll();
                                   if(!elencoDocenti.isEmpty()){
                                      for(Docente doc:elencoDocenti){
                                %>
                                    <td><input type="radio" name="rdoIdDocente" value="<%= doc.getChiave() %>" required></td>
                                    <td><%= doc.getCognome() %></td>
                                    <td><%= doc.getNome() %></td>
                                </tr>
                            <%} %>
                            </tbody>
                        </table>
                        <% } else{%> Non ci sono Docenti<% } %>
                    </div>
                    <div class="container mb-3">
                        <table class="table table-hover table-dark table-responsive-sm mt-3">
                            <thead>
                                <th></th>
                                <th>Scegli il discente</th>
                                <th></th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td>Cognome</td>
                                    <td>Nome</td>
                                </tr>
                                <tr>
                                <%
                                   DiscenteService oDiscenteService = new DiscenteService();
                                   List<Discente> elencoDiscenti = oDiscenteService.findAll();
                                   if(!elencoDiscenti.isEmpty()){
                                      for(Discente discente:elencoDiscenti){
                                %>
                                    <td><input type="checkbox" name="checkIdDiscente" value="<%= discente.getChiave() %>"></td>
                                    <td><%= discente.getCognome() %></td>
                                    <td><%= discente.getNome() %></td>
                                </tr>
                            <%} %>
                            </tbody>
                        </table>
                        <% } else{%> Non ci sono Discenti<% } %>
                    </div>
                    <div class="container mt-3">
                        <input type="submit" name="cmdAzione" value="Registra" class=" btn btn-primary">
                    </div>
                </div>
            </form>
            <form method="post" action="/WebProjectMavenized/CtrlGestioneCorso">
                <div align="center">
                    <input type="submit" name="cmdAzione" value="Annulla" class=" btn btn-primary">
                </div>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
