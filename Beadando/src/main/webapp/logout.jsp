<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : check
    Created on : 2020. dec. 6., 0:20:41
    Author     : Boroka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adatellenőrzés</title>
    </head>
    <body>

        <c:set var = "user" scope = "application" value = "${null}"/>
        <jsp:forward page="index.jsp"/>

    </body>
</html>

