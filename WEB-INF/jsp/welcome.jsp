<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Welcome</title>
    </head>
    <body>
    <jsp:include page="header.jsp" />
    <jsp:include page="${WELCOME_PAGE}" />
    <jsp:include page="footer.jsp" />
    </body>
    </html>