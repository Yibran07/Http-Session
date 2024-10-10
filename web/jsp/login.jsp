<%-- 
    Document   : login
    Created on : 08-oct-2024, 18:24:42
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
    </head>
    <body>
        <h1>Iniciar Sesion</h1>
        <form method="post" action="${pageContext.request.contextPath}/loginServlet">
            <label for="username">Nombre de usuario:</label>
            <input type="text" name="matricula" id="matricula" required><br>
            <label for="password">Password</label>
            <input type="password" name="password" id="password" required><br>

            <button type="submit">Iniciar Sesión</button>
        </form>
        
        <%
            String error = (String) request.getAttribute("error");
            if(error != null){
        %>
            <p style="color: red;"><%= error %></p>
        <% } %>
    </body>
</html>
