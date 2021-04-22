
<%@page import="com.Dao.DepartmentDao"%>
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
        }
        else
        {
           page_number = 0; 
        }
    } catch (Exception e) {
    }
    request.setAttribute("page_number", page_number);
    List<Department> list = DepartmentDao.GetAllDepartments(page_number);
    request.setAttribute("list", list);
    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
    request.setAttribute("sdf", sdf);
  int size=  DepartmentDao.GetTableRowCount();
  request.setAttribute("size", size);
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
            <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal">Add Department</button>

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
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header ">
                            <h5 class="modal-title" id="exampleModalLabel">Department Form</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                        </div>
                        <form  method="post" id="departmentForm">
                            <div class="modal-body">

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Enter Name</label>
                                    <input type="text" class="form-control" name="Name" placeholder="Name" id="Name" aria-describedby="emailHelp"required="">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Description</label>
                                    <textarea class="form-control" rows="5" name="Description" placeholder="Description" required=""></textarea>
                                </div>
                                <div class="text-center " id="loader" style="display: none">
                                    <i class="fa fa-refresh fa-lg fa-5x fa-spin" aria-hidden="true"></i>
                                </div>
                            </div>
                            <div class="modal-footer">

                                <button  class="btn btn-primary" id="btn">Save Department</button>
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
                                <c:forEach items="${list}" var="department" varStatus="loop" >
                                    <tr>
                                        <th scope="row"><c:out value="${loop.index+1}"></c:out></th>
                                        <td><c:out value="${department.getName()}"></c:out></td>
                                        <td><c:out value="${department.getDescription()}"></c:out></td>
                                        <td><c:out value="${sdf.format(department.getTimestamp())}"></c:out></td>
                                            <td>
                                                <a href="./editDepartment.jsp?id=<c:out value="${department.getId()}"></c:out>"><span class="fa fa-edit fa-2x  fa-lg text-success"></span></a>
                                            <a onclick="return confirm('Are You Sure You want to delete?')" href="../DeleteDepartment?id=<c:out value="${department.getId()}"></c:out>"><span class="fa fa-trash fa-2x fa-lg text-danger"></span></a>
                                            </td>
                                        </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-end">
                                <c:set var="j" value="1"></c:set>
                                <c:forEach var = "i" begin = "1" end = "${size}" step="10" >
                                    <li class="page-item"><a class="page-link" href="Departments.jsp?page=<c:out value="${j}"></c:out>"><c:out value="${j}"></c:out></a></li>  
                                 <c:set var="j" value="${j+1}"></c:set>  
                                </c:forEach>
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
                       url:"searchDepartmentBynames.jsp?name="+name,
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
                $("#name").keypress(function(){
                    var name=$("#name").val();
                    $.ajax({
                       url:"searchDepartment.jsp?name="+name,
                       type: 'GET',
                       success: function (data, textStatus, jqXHR) {
                           $("#searchContent").html(data);
                         
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        
                    }
                    });
                   
                });
            
                $("#departmentForm").submit(function (event) {
                    event.preventDefault();
                    var data = $("#departmentForm").serialize(); // without pic
//                    let form = new FormData(this); // with pic
                    $("#loader").show();
                    $("#btn").hide();
                    $.ajax({
                        url: "../add-department",
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