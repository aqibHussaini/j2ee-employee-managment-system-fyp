<%-- 
    Document   : searchDepartmentBynames
    Created on : Mar 22, 2021, 8:49:14 PM
    Author     : Bhatti
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Department"%>
<%@page import="com.Dao.DepartmentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String name = request.getParameter("name");

    List<Department> list = DepartmentDao.searchByNames(name);
    request.setAttribute("list", list);

%>
<thead>
    <tr>
        <th scope="col">Sr.no</th>
        <th scope="col">Name</th>
        <th scope="col">Description</th>
        <th scope="col">Time</th>
        <th scope="col">Actions</th>
    </tr>
</thead>
<tbody>
    <c:forEach items="${list}" var="department" varStatus="loop" >
        <tr>
            <th scope="row"><c:out value="${loop.index+1}"></c:out></th>
            <td><c:out value="${department.getName()}"></c:out></td>
            <td><c:out value="${department.getDescription()}"></c:out></td>
            <td><c:out value="${sdf.format(department.getTimestamp())}"></c:out></td>
                <td>
                    <a href="editDepartment.jsp?id=<c:out value="${department.getId()}"></c:out>"><span class="fa fa-edit fa-2x  fa-lg text-success"></span></a>
                <a onclick="return confirm('Are You Sure You want to delete?')" href="delete/<c:out value="${department.getId()}"></c:out>"><span class="fa fa-trash fa-2x fa-lg text-danger"></span></a>
                </td>
            </tr>
    </c:forEach>
</tbody>