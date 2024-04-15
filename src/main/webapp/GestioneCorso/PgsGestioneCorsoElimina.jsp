<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>pgsGestioneCorsoElimina</title>
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

    <div align="center" class="container" style="margin-top:150px; width: 400px; height: 440px;box-shadow: 0 0 30px rgba(0, 0, 0, .5); background: transparent; padding:70px; border-radius: 20px; border: 2px solid rgba(255, 255, 255, .5); backdrop-filter: blur(20px);">
	    <form method="post" action="/WebProjectMavenized/CtrlGestioneCorso">
            <h1>Vuoi eliminare il Corso?</h1>
            <div class="d-grid">
                <input type="submit" name="cmdAzione" value="Conferma" class=" btn btn-primary btn-block"><br>
                <input type="submit" name="cmdAzione" value="Annulla" class=" btn btn-primary btn-block">
            </div>
        </form>
    </div>
</body>
</html>