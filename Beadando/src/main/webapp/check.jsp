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
    <sql:query var="lekerdezes" dataSource="${hirdetes}">
        SELECT * FROM Users where UserName='${param.username}' and Password='${param.password}'
    </sql:query>
        
   <c:choose>
        <c:when test="${lekerdezes.rowCount ne 0}">
            <c:set var = "user" scope = "application" value = "${lekerdezes.rows[0]}"/>
            <jsp:forward page="blog.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:forward page="index.jsp">
                <jsp:param name="errormsg" value="Hibás jelszó/vagy felhasználói név"/>
            </jsp:forward>
        </c:otherwise>
    </c:choose>
    </body>
</html>

