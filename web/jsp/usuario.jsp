<%-- 
    Document   : usuario
    Created on : 08-oct-2024, 19:20:24
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    //obtener la sesion actual
    HttpSession session_web = request.getSession(false);
    //No crear una nueva sesion si no existe
    String matricula = null;
    if(session_web != null){
        matricula = (String) session_web.getAttribute("matricula");
    }
    
    // Obtener la duración de la sesión en minutos (desde web.xml o configuración)
    int sessionTimeout = session_web.getMaxInactiveInterval(); // Tiempo en segundos
    int remainingTime = sessionTimeout; // Lo convertimos en segundos para usarlo en el temporizador

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de bienvenida</title>
        <script>
            let remainingTime = <%= remainingTime %>; // Tiempo en segundos desde el servidor

            function startTimer() {
                const timerElement = document.getElementById('timer');
                const interval = setInterval(function() {
                    let minutes = Math.floor(remainingTime / 60);
                    let seconds = remainingTime % 60;

                    // Formatear los números para que siempre tengan 2 dígitos
                    minutes = minutes < 10 ? '0' + minutes : minutes;
                    seconds = seconds < 10 ? '0' + seconds : seconds;

                    // Mostrar el tiempo restante en el elemento HTML
                    timerElement.textContent = minutes + ":" + seconds;

                    // Reducir el tiempo en 1 segundo
                    if (--remainingTime < 0) {
                        clearInterval(interval);
                        alert("Tu sesión ha expirado.");
                        window.location.href = '<%= request.getContextPath() %>/jsp/login.jsp'; // Redirige al login
                    }
                }, 1000); // Actualiza cada segundo
            }

            window.onload = startTimer;
        </script>
    </head>
    <body>
        <h1>Bienvenido, <%= (matricula != null)? matricula: "Invitado"%></h1>
        <% if(matricula != null){ %>
                <p>Has iniciado sesion correctamente.</p>
                <p>Tiempo restante de la sesión: <span id="timer"></span></p>
                <a href="${pageContext.request.contextPath}/loginServlet">Cerrar Sesion</a>
        <% } else {%>
            <p>No has iniciado Sesion <a href="${pageContext.request.contextPath}/jsp/login.jsp">Iniciar Sesion</a></p>
        <% } %>
    </body>
</html>