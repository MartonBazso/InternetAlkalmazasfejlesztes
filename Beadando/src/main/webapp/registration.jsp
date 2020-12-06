<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : registration
    Created on : 2020. dec. 6., 0:23:18
    Author     : Boroka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Regisztráció</title>
    </head>
    <body>
    <c:choose>
        <c:when test="${pageContext.request.method eq 'POST'}">
        <sql:update var="eredmeny" dataSource="${hirdetes}">
            INSERT INTO users (userid, password, name, role) VALUES ('${param.userid}', '${param.password}','${param.name}','member')
        </sql:update>
         A regisztráció sikeresen megtörtént. A bejelentkezéshez kattintson <a href="login.jsp">ide</a>.
        </c:when>
        <c:otherwise>
            <h1>Regisztráció</h1>
            <form action="registration.jsp" method="POST">
                Felhasználó név: <input type="text" name="userid" value="" size="20" /><p/>
                Jelszó: <input type="password" name="password" value="" size="20" /><p/>
                Név: <input type="text" name="name" value="" size="20" /><p/>
                <input type="submit" value="Regisztrálok!" /><p/>
            </form>
        </c:otherwise>
    </c:choose>
    </body>
</html>

