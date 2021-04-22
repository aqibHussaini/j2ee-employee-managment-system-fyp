
<%@page import="com.Entity.Project"%>
<%@page import="com.Dao.ProjectDao"%>
<%@page import="com.Entity.Employee"%>
<%@page import="com.Dao.EmployeeDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Department"%>
<%@page isELIgnored="false" %>
<%
    int page_number = 0;
    try {
        page_number = Integer.parseInt(request.getParameter("page"));
        if (page_number > 1) {
            page_number = (page_number - 1) * 10;
        } else {
            page_number = 0;
        }
    } catch (Exception e) {
    }
    request.setAttribute("page_number", page_number);
    List<Employee> employees = EmployeeDao.GetAllEmployees();
    request.setAttribute("employees", employees);
    List<Project> projects = ProjectDao.GetAllProjects();
    request.setAttribute("projects", projects);
    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
    request.setAttribute("sdf", sdf);
%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">       <title>Department </title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">       <title>Department </title>
    </head>
    <body>
        <div class="container mt-4">
            <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal">Add Task</button>

            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                Search
            </button>

            <div class="collapse mt-3" id="collapseExample">
                <form action="searchDepartment" method="post">
                    <div class="row" >

                        <div class="col-3">
                            <input class="form-control" placeholder="Search" type="text"  id="name"  autocomplete="off"
                                   >
                            <div id="searchContent" >

                            </div>
                        </div>

                    </div>
                </form>
            </div>

            <!-- Modal -->
            <div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header ">
                            <h5 class="modal-title" id="exampleModalLabel">Task Form</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                        </div>
                        <form  method="post" id="taskForm" >
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="tittle">Email Tittle</label>
                                    <input type="text" name="tittle" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Tittle">
                                </div>
                                <div class="row"> 
                                    <div class="col-md-6"> 
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Employee</label>
                                            <select class="form-control" name="employee_id" id="exampleFormControlSelect1">
                                                <c:forEach items="${employees}" var="employee">
                                                    <option value="${employee.getId()}">${employee.getName()}</option>    
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6"> 
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect1">Project</label>
                                            <select class="form-control"  name="project_id" id="exampleFormControlSelect1">
                                                  <c:forEach items="${projects}" var="project">
                                                    <option value="${project.getId()}">${project.getTittle()}</option>    
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-6"> 
                                        <div class="form-group">
                                            <label for="tittle">Link</label>
                                            <input type="text" class="form-control" name="link" id="link" aria-describedby="emailHelp" placeholder="Enter Link">
                                        </div>
                                    </div>
                                    <div class="col-md-6"> 
                                        <label for="exampleFormControlSelect1">Status</label>
                                        <select class="form-control" name="status" id="exampleFormControlSelect1">
                                            <option value="1">Assigned</option>
                                            <option value="2">Submitted</option>
                                            <option value="3">Cancelled</option>
                                            <option value="4">Delivered</option>
                                            <option value="5">Testing</option>
                                            <option value="6">Deployed</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-6"> 
                                           <div class="form-group">
                                            <label for="tittle">Starting Date</label>
                                            <input type="datetime-local" name="starting_date" class="form-control" id="link" aria-describedby="emailHelp" placeholder="Enter Link">
                                        </div>
                                    </div>
                                    <div class="col-md-6"> 
                                           <div class="form-group">
                                            <label for="tittle">Deadline</label>
                                            <input type="datetime-local" name="deadline" class="form-control" id="link" aria-describedby="emailHelp" placeholder="Enter Link">
                                        </div>
                                    </div>
                                </div>
                                        <div class="form-group">
                                            <label for="tittle">Email Description</label>
                                            <textarea class="form-control" name="description" id="exampleFormControlTextarea1" placeholder="Enter Description" rows="3"></textarea>

                                        </div>
                                    </div>
                                    <div class="modal-footer">

                                        <button  class="btn btn-primary" id="btn">Save Task</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered" id="myTable">
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

                                    </tbody>
                                </table>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-end">
                                        <c:set var="j" value="1"></c:set>

                                    </ul>
                                </nav>   
                            </div>
                        </div>
                    </div>

                </div>

                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                <script    src="https://code.jquery.com/jquery-3.6.0.min.js"
                           integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

                <script type="text/javascript">
                    function doSearch(name)
                    {
                        $.ajax({
                            url: "searchDepartmentBynames.jsp?name=" + name,
                            type: 'GET',
                            success: function (data, textStatus, jqXHR) {
                                $("#myTable").html(data);
                                $("#searchContent").html(null);

                            },
                            error: function (jqXHR, textStatus, errorThrown) {

                            }
                        });
                    }
                    $("document").ready(function () {
                        $("#name").keypress(function () {
                            var name = $("#name").val();
                            $.ajax({
                                url: "searchDepartment.jsp?name=" + name,
                                type: 'GET',
                                success: function (data, textStatus, jqXHR) {
                                    $("#searchContent").html(data);

                                },
                                error: function (jqXHR, textStatus, errorThrown) {

                                }
                            });

                        });

                        $("#taskForm").submit(function (event) {
                            event.preventDefault();
                            var data = $("#taskForm").serialize(); // without pic
                            
                            //                    let form = new FormData(this); // with pic
                            $("#loader").show();
                            $("#btn").hide();
                            $.ajax({
                                url: "../saveTask",
                                type: 'POST',
                                data: data,
                             
                                success: function (message) {
                                    swal("Good job!", "data saved ", "success", {
                                        button: false,
                                    });
                                    $("#loader").hide();
                                    $("#btn").show();
                                    setTimeout(function () {
                                        window.location.reload();
                                    }, 2000);

                                },
                                error: function (message) {
                                    swal("oh no!", "something went wrong ", "failure");
                                    $("#loader").hide();
                                    $("#btn").show();
                                }

                            });
                        });
                    });
                </script>


                </body>
                </html>