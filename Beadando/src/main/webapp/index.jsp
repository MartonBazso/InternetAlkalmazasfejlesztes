<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : login
    Created on : 2020. dec. 6., 0:19:07
    Author     : Boroka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Belépés</title>
    </head>
    <body>
        <sql:setDataSource
            var="hirdetes"
            driver="org.apache.derby.jdbc.ClientDriver"
            url="jdbc:derby://localhost:1527/hirdetes"
            scope="application"
            user="valami"
            password="valami"
            />
        
        <h1>Üdvözöljük! A belépéshez kérjük adja meg adatait!</h1>
        <c:if test="${!empty param.errormsg}">
            <font color="red">${errormsg}</font>
        </c:if>

        <form action="check.jsp" method="POST">
            <p>Felhasználó név:</p> <input type="text" name="username" value="" size="15" />
            <p>Jelszó:</p> <input type="password" name="password" value="" size="15" />
            <input type="submit" value="Bejelentkezés" />
        </form>
      
        <a href="registration.jsp">Regisztráció</a>
        <c:if test="${!empty felhasznalok}">
            <font color="red">${felhasználok}</font>
        </c:if>
    </body>
</html>
