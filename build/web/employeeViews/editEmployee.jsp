<%-- 
    Document   : editEmployee
    Created on : Mar 21, 2021, 12:21:36 PM
    Author     : Bhatti
--%>

<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="com.Dao.DepartmentDao"%>
<%@page import="com.Entity.Department"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.Dao.EmployeeDao"%>
<%@page import="com.Entity.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Employee employee = EmployeeDao.getEmployeeById(id);
    request.setAttribute("employee", employee);
    List<Department> departments = DepartmentDao.GetAllDepartments();
    request.setAttribute("departments", departments);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Employee </title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">       <title>Department </title>

    </head>
    <body>
        <div class="row">
            <div class="col-md-8 offset-2">
                <form   id="departmentForm" action="updateEmployee" method="post" enctype="multipart/form-data">
                    <div class="card mt-3">
                        <div class="card-header text-center">
                            <h5 class="font-weight-bold">Update Employee </h5>
                        </div>
                        <div class="row">
                            <input type="hidden" class="form-control" name="Id" value="${employee.getId()}" id="id" aria-describedby="emailHelp">

                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Name</label>
                                <input type="text" class="form-control" name="Name" value="${employee.getName()}" placeholder="Name" id="Name" aria-describedby="emailHelp">
                            </div>
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Department</label>
                                <select class="form-control" name="department_id" id="inputGroupSelect04">
                                    <c:forEach var="department" items="${departments}">
                                        <c:choose>
                                            <c:when test="${employee.getDepartment_id()==department.getId()}">
                                                <option selected value="<c:out value="${department.getId()}"></c:out>"><c:out value="${department.getName()}"></c:out></option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="<c:out value="${department.getId()}"></c:out>"><c:out value="${department.getName()}"></c:out></option>
                                            </c:otherwise>
                                        </c:choose> 
                                    </c:forEach>

                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Email</label>
                                <input type="text" class="form-control" name="Email" value="${employee.getEmail()}" placeholder="Email" id="Email" aria-describedby="emailHelp">
                            </div>
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Password</label>
                                <input type="password" class="form-control"  value="${employee.getCNIC()}" name="password" placeholder="password" id="password" aria-describedby="emailHelp">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Contact</label>
                                <input type="text" class="form-control" name="contact"  value="${employee.getContact()}" placeholder="contact" id="contact" aria-describedby="emailHelp">
                            </div>
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter CNIC</label>
                                <input type="text" class="form-control" name="cnic" value="${employee.getCNIC()}" placeholder="cnic" id="whatsapp" aria-describedby="emailHelp">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Facebook</label>
                                <input type="text" class="form-control" name="facebook" value="${employee.getFacebook_link()}" placeholder="facebook" id="facebook" aria-describedby="emailHelp">
                            </div>
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Instagram</label>
                                <input type="text" class="form-control" name="instagram" value="${employee.getInstagram_link()}" placeholder="instagram" id="instagram" aria-describedby="emailHelp">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Joining Date</label>
                                <input type="date" class="form-control" value="${employee.getJoining_date()}" name="joining_date" placeholder="joining_date" id="joining_date" aria-describedby="emailHelp">
                            </div>
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Status</label>
                                <select  class="form-control"  name="status" placeholder="status" id="status"  id="exampleFormControlSelect2">
                                    <c:choose>
                                        <c:when test="${employee.getStatus()==1}">
                                            <option value="1" selected="">Permanent</option>
                                            <option value="2">Intern</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="1">Permanent</option>
                                            <option value="2" selected="">Intern</option>
                                        </c:otherwise>
                                    </c:choose> 

                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Order</label>
                                <input type="number" class="form-control" value="${employee.getDisplay_order()}" name="order" placeholder="order" id="order" aria-describedby="emailHelp">
                            </div>
                            <div class="col-6  ">
                                <img class="img-fluid " style="width: 200px; height: 80px;" src="./EmployeePics/<c:out value="${employee.getPicture()}"></c:out>"/>
                                    <input type="file" class="form-control" id="picture" name="new_picture">
                               
                                </div>
                            </div>
                            <div >
                                <label for="exampleInputPassword1" class="form-label">Enter Address</label>
                                <textarea class="form-control" rows="3" value="${employee.getAddress()}" name="address" placeholder="address" ><c:out value="${employee.getAddress()}"></c:out></textarea>
                            </div>
                            <div class="form-check">
                            <c:choose>
                                <c:when test="${employee.getDisplay()==1}">
                                    <input type="checkbox" checked="" class="form-check-input" id="display" name="display">
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox" class="form-check-input" id="display" name="display">
                                </c:otherwise>
                            </c:choose> 

                            <label class="form-check-label" for="exampleCheck1">Do You Want to Display it on landing?</label>
                        </div>
                        <div class="text-center " id="loader" style="display: none">
                            <i class="fa fa-refresh fa-lg fa-5x fa-spin" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="text-center">
                        <button  class="btn btn-primary" id="btn">Update Employee</button>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script    src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
    </body>
</html>
