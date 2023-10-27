<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Accio.SearchResult" %>
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
    <title>Search Result</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h3>My Search Engine</h3>
    <table border="2" class="resultTable">
        <tr>
            <th>S.No.</th>
            <th>Tile</th>
            <th>Link</th>
        </tr>
        <%
            int count = 1;
            ArrayList<SearchResult> results = (ArrayList<SearchResult>)request.getAttribute("results");
            for(SearchResult result: results) {
        %>
        <tr>
            <td><%out.println(count++);%></td>
            <td><%out.println(result.getTitle());%></td>
            <td><a href="<%out.println(result.getLink());%>"><%out.println(result.getLink());%></a></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
