<%-- 
    Document   : editProduct
    Created on : Mar 23, 2021, 1:22:22 PM
    Author     : Bhatti
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.Entity.Project"%>
<%@page import="com.Dao.ProjectDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Project project = ProjectDao.getProjectById(id);
    request.setAttribute("project", project);
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
                <form   id="projectForm"  action="../updateProject" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="row">
                            <input type="hidden" class="form-control" value="${project.getId()}" name="id"  id="id" aria-describedby="emailHelp">

                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Tittle</label>
                                <input type="text" class="form-control" value="${project.getTittle()}" name="Tittle" placeholder="Tittle" id="Tittle" aria-describedby="emailHelp">
                            </div>
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Client</label>
                                <input type="text" class="form-control" name="Client" value="${project.getClient_id()}" placeholder="Client" id="Client" aria-describedby="emailHelp">

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Price</label>
                                <input type="number" class="form-control" value="${project.getPrice()}" name="price" id="price"  aria-describedby="emailHelp">
                            </div>
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Status</label>
                                <select  class="form-control"  name="status"  placeholder="status" id="status"  id="exampleFormControlSelect2">
                                    <c:choose>

                                        <c:when test = "${project.getStatus()==1}">
                                            <option value="1" selected="">Initiated</option>
                                            <option value="2">Pending</option>
                                            <option value="3">Deployed</option>
                                            <option value="4">Delivered</option>
                                        </c:when>

                                        <c:when  test = "${project.getStatus()==2}">
                                          <option value="1" >Initiated</option>
                                            <option value="2" selected="">Pending</option>
                                            <option value="3">Deployed</option>
                                            <option value="4">Delivered</option>
                                        </c:when>
                                        <c:when  test = "${project.getStatus()==3}">
                                          <option value="1" >Initiated</option>
                                            <option value="2" >Pending</option>
                                            <option value="3" selected="">Deployed</option>
                                            <option value="4">Delivered</option>
                                        </c:when>

                                        <c:otherwise>
                                            <option value="1" >Initiated</option>
                                            <option value="2" >Pending</option>
                                            <option value="3">Deployed</option>
                                            <option value="4"  selected="">Delivered</option>
                                        </c:otherwise>
                                    </c:choose>


                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Starting Date</label>
                                <input type="date" class="form-control"  value="${project.getStarting_date()}"  name="starting_date"  id="starting_date" aria-describedby="emailHelp">
                            </div>
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Ending Date</label>
                                <input type="date" class="form-control"  value="${project.getEnding_date()}" name="ending_date" id="ending_date"   aria-describedby="emailHelp">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Demo Link</label>
                                <input type="text" class="form-control"  value="${project.getDemo_link()}" name="demo_link"  id="demo_link"   placeholder="demo_link"  aria-describedby="emailHelp">
                            </div>
                            <div class="col-6">
                                <label for="exampleInputEmail1" class="form-label">Enter Deployed Link</label>
                                <input type="text" class="form-control"  value="${project.getDeployed_link()}" name="deployed_link"  id="deployed_link"  placeholder="deployed_link" aria-describedby="emailHelp">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <label for="exampleInputEmail1" class="form-label">Order</label>
                                <input type="number" class="form-control"  value="${project.getDisplay_order()}" name="order" placeholder="order" id="order" aria-describedby="emailHelp">
                            </div>
                          
                        </div>
                              <div class="form-group mt-2">
                                <img src="../ProjectsPic/<c:out value="${project.getPicture()}"></c:out>" height="100px" width="200px">
                                <input type="file" class="form-control" id="picture" name="picture">

                            </div>
                        <div >
                            <label for="exampleInputPassword1" class="form-label">Enter Description</label>
                            <textarea class="form-control" rows="3"  value="${project.getDescription()}" name="Description"  id="Description"  placeholder="Description" >${project.getDescription()}</textarea>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="display" name="display">
                            <c:choose>
                                <c:when test="${project.getDisplay()==1}">
                                    <input type="checkbox" checked="" class="form-check-input" id="display" name="display">
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox" class="form-check-input" id="display" name="display">
                                </c:otherwise>
                            </c:choose> 
                            <label class="form-check-label" for="exampleCheck1" >Do You Want to Display it on landing?</label>
                        </div>

                    </div>
                    <div class="modal-footer">

                        <button  class="btn btn-primary" id="btn">Update </button>
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

