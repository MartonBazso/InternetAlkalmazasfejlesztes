<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : addnew
    Created on : 2020. dec. 6., 0:49:23
    Author     : Boroka
--%>
<% request.setCharacterEncoding("UTF-8");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Törlés</title>
    </head>
    <body bgcolor="white">
        <h1>Törlés...</h1>

        <sql:query var="del" dataSource="${hirdetes}">
            SELECT * FROM Advertisements WHERE AdId = ${param.id}
        </sql:query>    

        <c:choose>
            <c:when test="${(del.rows[0].addedBy eq user.userId) || (user.role eq 'admin')}">

                <sql:update var="torles" dataSource="${hirdetes}">
                    DELETE FROM Advertisements
                    WHERE AdId =  ${param.id}
                </sql:update>
                <jsp:forward page="blog.jsp" />
            </c:when>
            <c:otherwise>
                   Sajnáljuk, de nincs megfelelő jogosultsága a bejegyzés törléséhez.
            </c:otherwise>
        </c:choose>
    </body>
</html>
