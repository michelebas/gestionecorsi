<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Nuovo/Modifica Corso</title>
</head>
<body>
<h2>Nuovo/Modifica Corso</h2>
<form action="CtrlGestioneCorso" method="post">
    <input type="hidden" name="id" value="${beanCorso.id}">
    <table>
        <tr>
            <td>Nome:</td>
            <td><input type="text" name="txtNome" value="${beanCorso.nome}" required></td>
        </tr>
        <tr>
            <td>Ore:</td>
            <td><input type="number" name="txtOre" value="${beanCorso.ore}" required></td>
        </tr>
        <tr>
            <td>Docente:</td>
            <td>
                <select name="docente" required>
                    <c:forEach var="docente" items="${elencoDocenti}">
                        <option value="${docente.id}" <c:if test="${docente.id == beanCorso.docente.id}">selected</c:if>>
                            ${docente.cognome} ${docente.nome}
                        </option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>Discenti:</td>
            <td>
                <c:forEach var="discente" items="${elencoDiscenti}">
                    <input type="checkbox" name="discenti" value="${discente.id}" <c:if test="${beanCorso.discenti.contains(discente)}">checked</c:if>>
                    ${discente.cognome} ${discente.nome}<br>
                </c:forEach>
            </td>
        </tr>
    </table>
    <input type="submit" name="cmdAzione" value="Registra">
    <input type="submit" name="cmdAzione" value="Annulla">
</form>
</body>
</html>
