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
        <link rel="stylesheet" href="style.css">
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

        <div class = "stilusform"  > Üdvözöljük! A belépéshez kérjük adja meg adatait!
            
            <c:if test="${!empty param.errormsg}">
                <font color="red">${errormsg}</font>
            </c:if>

            <form action="check.jsp" method="POST">
                <p>Felhasználó név:</p> <input type="text" name="username" value="" size="15" />
                <p>Jelszó:</p> <input type="password" name="password" value="" size="15" /> <br>
                <button type="submit" > Bejelentkezés </button>
            </form>

                <a href= "registration.jsp"> <button> Regisztráció </button></a>
            <c:if test="${!empty felhasznalok}">
                <font color="red">${felhasználok}</font>
            </c:if>
        </div>
    </body>
</html>
