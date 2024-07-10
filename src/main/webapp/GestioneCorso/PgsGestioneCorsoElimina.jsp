<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Elimina Corso</title>
</head>
<body>
<h2>Elimina Corso</h2>
<p>Sei sicuro di voler eliminare il corso ${beanCorso.nome}?</p>
<form action="CtrlGestioneCorso" method="post">
    <input type="hidden" name="id" value="${beanCorso.id}">
    <input type="submit" name="cmdAzione" value="Conferma">
    <input type="submit" name="cmdAzione" value="Annulla">
</form>
</body>
</html>
