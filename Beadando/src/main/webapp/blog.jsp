<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : blog
    Created on : 2020. dec. 6., 0:46:49
    Author     : Boroka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Főoldal</title>
    </head>
    <body>
        <h1>Üdvözlünk a főoldalon!</h1>
        <a href="addnew.jsp">Adj fel új hirdetést!</a>
        
        
        <sql:query var="lekerdezes" dataSource="${hirdetes}">
        SELECT * FROM news
        </sql:query>
        
        
        
        
        
        
    </body>
</html>
