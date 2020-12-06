<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : addnew
    Created on : 2020. dec. 6., 0:49:23
    Author     : Boroka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Új hirdetés</title>
  </head>
  <body bgcolor="white">
      <h1>Adjon hozzá új hirdetést!</h1>
      <c:choose>
        <c:when test="${pageContext.request.method eq 'POST'}">
            
            
        <%-- UserID-t még el kell tárolni, legjobb lenne sessionbe kiszedni, hogy ne kelljen sql--%>
        <sql:update var="eredmeny" dataSource="${hirdetes}">
            INSERT INTO news (category, content, userid) VALUES ('${param.category}', '${param.content}','USERID')
        </sql:update>
            
            
            
        <jsp:forward page="blog.jsp" />
        </c:when>
        <c:otherwise>
            <form action="addnew.jsp" method="post">
                <table>
                  <tr>
                    <td>Téma:</td>
                    <td>
                      <select name="category">
                        <option>autó</option>
                        <option>háztartási eszköz</option>
                        <option>ingatlan</option>
                        <option>egyéb</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td colspan=2>          
                      <textarea name="content" cols="50" rows="10"></textarea>
                    </td>
                  </tr>
                  <tr>
                    <td>          
                       <input type="submit" value="Hirdetés feladása">
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
