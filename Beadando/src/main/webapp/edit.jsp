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
        <title>Hirdetés szerkesztése</title>
    </head>
    <body bgcolor="white">
        <h1>Szerkessze az alábbi hirdetést!</h1>
        <c:if test="${param.id ne null}">            
            <sql:query var="lekerdezes" dataSource="${hirdetes}">
                SELECT * FROM Advertisements WHERE AdId = ${param.id}
            </sql:query>
        </c:if>  
        <c:choose>
            <c:when test="${param.content ne null && param.title ne null && (lekerdezes.rows[0].addedBy eq user.userId) || (user.role eq 'admin')}">


                <sql:update var="eredmeny" dataSource="${hirdetes}">
                    UPDATE Advertisements SET TITLE = '${param.title}', CONTENT = '${param.content}' WHERE AdId = ${param.id}
                </sql:update>

                <jsp:forward page="blog.jsp" />
            </c:when>
            <c:when test="${(lekerdezes.rows[0].addedBy ne user.userId) && (user.role ne 'admin')}">
                <h2>Nincs megfelelő jogosultsága a szerkesztéshez.</h2> 
            </c:when>
            <c:otherwise>
                <form action="edit.jsp" method="post">
                    <input name='id' value="${param.id}" hidden>
                    <table>
                        <tr>
                            <td>Téma:</td>
                            <td>
                                <input type="text" name="title" value='${lekerdezes.rows[0].title}'>
                            </td>
                        </tr>
                        <tr>
                            <td colspan=2>          
                                <textarea name="content" cols="50" rows="10">${lekerdezes.rows[0].content}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>          
                                <input type="submit" value="Hirdetés szerkesztése">
                            </td>
                            <td>          
                                <a href="blog.jsp">Vissza a főoldalra</a>
                            </td>
                        </tr>
                    </table>

                </form>
            </c:otherwise>
        </c:choose>



    </body>
</html>
