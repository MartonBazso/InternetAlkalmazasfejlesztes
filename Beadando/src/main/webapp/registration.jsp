<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : registration
    Created on : 2020. dec. 6., 0:23:18
    Author     : Boroka
--%>
<% request.setCharacterEncoding("UTF-8");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Regisztráció</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${pageContext.request.method eq 'POST'}">
                <sql:update var="eredmeny" dataSource="${hirdetes}">
                    INSERT INTO Users (UserName, Password, Name, Role) VALUES ('${param.username}', '${param.password}','${param.name}','user')
                </sql:update>
                A regisztráció sikeresen megtörtént. A bejelentkezéshez kattintson <a href="index.jsp">ide</a>.
            </c:when>
            <c:otherwise>
                <div class = "stilusform"  > <h1>Regisztráció</h1>
                    <form action="registration.jsp" method="POST">
                        Felhasználó név: <input type="text" name="username" value="" size="20" /><p/>
                        Jelszó: <input type="password" name="password" value="" size="20" /><p/>
                        Név: <input type="text" name="name" value="" size="20" /><p/>
                        <input type="submit" value="Regisztrálok!" /><p/>
                    </form> </div>
                </c:otherwise>
            </c:choose>
    </body>
</html>

