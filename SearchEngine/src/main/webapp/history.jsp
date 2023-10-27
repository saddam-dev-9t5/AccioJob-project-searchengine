<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Accio.HistoryResult" %>
<%--
  Created by IntelliJ IDEA.
  User: 91817
  Date: 26-10-2023
  Time: 07:51 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search History</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h3>My Search Engine</h3>
    <table border="1" class="resultTable">
        <tr>
            <th>Keyword</th>
            <th>Link</th>
        </tr>
        <%
            ArrayList<HistoryResult> results = (ArrayList<HistoryResult>)request.getAttribute("results");
            for(HistoryResult result: results) {
        %>
        <tr>
            <td><%out.println(result.getKeyword());%></td>
            <td><a href="<%out.println(result.getLink());%>"><%out.println(result.getLink());%></a></td>
        </tr>
        <% } %>
    </table>
</body>
</html>