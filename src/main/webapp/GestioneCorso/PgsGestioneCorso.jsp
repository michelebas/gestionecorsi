<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="model.session.Corso"%>
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
        <title>Gestione Corso</title>
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
                <h1>Gestione Corso</h1>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col">
                <div class="container mt-3">
                    <form method="post" action="/WebProjectMavenized/CtrlGestioneCorso" name="GestioneCorso">
                        <div class="d-grid">
                            <input type="submit" name="cmdAzione" value="Torna alla Home" class=" btn btn-primary btn-block">
                        </div>
                    </form>
                    <form method="post" action="/WebProjectMavenized/CtrlGestioneCorso" name="GestioneCorso">
                        <table class="table table-hover table-dark table-responsive-sm">
                            <thead>
                            <th> </th>
                            <th>Nome</th>
                            <th>Durata</th>
                            <th></th>
                            </thead>
                            <tbody>
                            <%
                                List<Corso> elenco = (List) request.getAttribute("elencoCorsi");
                                if(!elenco.isEmpty()){
                                    for(Corso corso : elenco){
                            %>
                            <tr>
                                <td><input type="radio" name="rdoIDCorso" value="<%= corso.getChiave() %>" required ></td>
                                <td> <%= corso.getNome() %></td>
                                <td> <%= corso.getDurata() %></td>
                                <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#<%= corso.getChiave()%>">
                                    Dettagli
                                </button>
                                    <div class="modal" id="<%= corso.getChiave()%>">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title text-dark">Liste</h4>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div>
                                                        <p>Docente</p>
                                                        <table class="table table-hover table-dark table-responsive-sm">
                                                            <thead>
                                                            <th>Nome</th>
                                                            <th>Cognome</th>
                                                            </thead>
                                                            <tbody>
                                                            <tr>
                                                                <td> <%= corso.getObjDocente().getNome()%> </td>
                                                                <td> <%= corso.getObjDocente().getCognome()%> </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div>
                                                        <p>Discenti</p>
                                                        <table class="table table-hover table-dark table-responsive-sm">
                                                            <thead>
                                                            <th>Nome</th>
                                                            <th>Cognome</th>
                                                            </thead>
                                                            <%
                                                                for(Discente discente : corso.getDiscenti()){
                                                            %>
                                                            <tbody>
                                                            <tr>
                                                                <td> <%= discente.getNome() %> </td>
                                                                <td> <%= discente.getCognome() %> </td>

                                                            </tr>
                                                            </tbody>
                                                            <% } %>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Chiudi</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <%
                                    }%>
                            </tr>
                            </tbody>
                            <%
                            } else{%> <h2>Non ci sono Corsi</h2><% } %>
                        </table>
                        <div class="d-grid">
                            <input type="submit" name="cmdAzione" value="Modifica" class=" btn btn-primary btn-block"><br>
                            <input type="submit" name="cmdAzione" value="Elimina" class=" btn btn-primary btn-block">
                        </div>
                    </form>
                    <form method="post" action="/WebProjectMavenized/CtrlGestioneCorso" name="GestioneCorso">
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