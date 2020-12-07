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
        <link rel="stylesheet" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Főoldal</title>
    </head>
    <body>
       
        <h1>Üdvözlünk a főoldalon!</h1>
        <a href="addnew.jsp"> <button> Adj fel új hirdetést! </button> </a>


        <sql:query var="lekerdezes" dataSource="${hirdetes}">
            SELECT * FROM ADVERTISEMENTS
        </sql:query>

        <table>
            <tr >
                <th>
                    Cím
                </th>
                <th>
                    Tartalom
                </th>
                <th>
                    Hozzáadva
                </th>
                <th>
                    Akciók
                </th>

            </tr>
            <c:forEach var="blog" items="${lekerdezes.rows}">

                <tr>
                    <td><h1><c:out value="${blog.title}" /></h1></td>

                    <td><h4><c:out value="${blog.content}" /></h4></td>

                    <td><c:out value="${blog.addedAt}" /> </td>

                    <td> 
                        <c:if test="${(blog.addedBy eq user.userId) || (user.role eq 'admin')}">
                            <p>
                                <a href='edit.jsp?id=${blog.AdId}'>
                                    <button>Szerkesztés</button>
                                </a>
                            </p>
                        </c:if>
                        <c:if test="${(blog.addedBy eq user.userId) || (user.role eq 'admin')}">
                            <p>
                                <a href='delete.jsp?id=${blog.AdId}'>
                                    <button>Törlés</button>
                                </a>
                            </p>
                        </c:if>
                    </td>


                </tr>

            </c:forEach>

        </table>


        <a href="logout.jsp"> <button>Kijelentkezés </button></a>

    </body>
</html>
