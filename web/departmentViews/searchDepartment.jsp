<%-- 
    Document   : searchDepartment
    Created on : Mar 22, 2021, 7:46:53 PM
    Author     : Bhatti
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Department"%>
<%@page import="com.Dao.DepartmentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("name");

    List<String> names = DepartmentDao.getNames(name);
    request.setAttribute("names", names);

%>
<ul class="list-group">
    <c:forEach items="${names}" var="name" varStatus="loop" >
        <a class="list-group-item list-group-item-action" onclick="doSearch('${name}')"><c:out value="${name}"></c:out></a>
    </c:forEach>

</ul>