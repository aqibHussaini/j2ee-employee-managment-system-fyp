<%@page import="com.Dao.ProjectDao"%>
<%@page import="com.Entity.Project"%>
<%@page import="com.Entity.Employee"%>
<%@page import="com.Entity.Department"%>
<%@page import="java.util.List"%>
<%@page import="com.Dao.EmployeeDao"%>
<%@page import="com.Dao.DepartmentDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    List<Project> list = ProjectDao.GetAllProjects(page_number);
    request.setAttribute("list", list);
    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a");
    request.setAttribute("sdf", sdf);
    int size = EmployeeDao.GetTableRowCount();
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <title>Employee </title>
    </head>
    <body>
        <div class="container mt-4">
            <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal">Add Project</button>

            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                Search 
            </button>

            <div class="collapse mt-3" id="collapseExample">
                <div class="card card-body">
                    <form action="" method="post" >
                        <div class="row">
                            <div class="col-3">
                                <input class="form-control" type="text" placeholder="Enter Name"  name="Name"  >
                            </div>
                        </div>

                    </form>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header bg-primary text-white ">
                            <h5 class="modal-title" id="exampleModalLabel">Project Form</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                        </div>
                        <form   id="projectForm"  action="../saveProject" method="post" enctype="multipart/form-data">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Tittle</label>
                                        <input type="text" class="form-control" name="Tittle" placeholder="Tittle" id="Tittle" aria-describedby="emailHelp">
                                    </div>
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Client</label>
                                        <input type="text" class="form-control" name="Client" placeholder="Client" id="Client" aria-describedby="emailHelp">

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Price</label>
                                        <input type="number" class="form-control" name="price" id="price"  aria-describedby="emailHelp">
                                    </div>
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Status</label>
                                        <select  class="form-control"  name="status" placeholder="status" id="status"  id="exampleFormControlSelect2">
                                            <option value="1">Initiated</option>
                                            <option value="2">Pending</option>
                                            <option value="3">Deployed</option>
                                            <option value="4">Delivered</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Starting Date</label>
                                        <input type="date" class="form-control" name="starting_date"  id="starting_date" aria-describedby="emailHelp">
                                    </div>
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Ending Date</label>
                                        <input type="date" class="form-control" name="ending_date" id="ending_date"   aria-describedby="emailHelp">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Demo Link</label>
                                        <input type="text" class="form-control" name="demo_link"  id="demo_link"   placeholder="demo_link"  aria-describedby="emailHelp">
                                    </div>
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Deployed Link</label>
                                        <input type="text" class="form-control" name="deployed_link"  id="deployed_link"  placeholder="deployed_link" aria-describedby="emailHelp">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Order</label>
                                        <input type="number" class="form-control" name="order" placeholder="order" id="order" aria-describedby="emailHelp">
                                    </div>
                                    <div class="col-6  ">
                                        <label for="exampleInputEmail1" class="form-label">Picture</label>
                                        <input type="file" class="form-control" id="picture" name="picture">

                                    </div>
                                </div>
                                <div >
                                    <label for="exampleInputPassword1" class="form-label">Enter Description</label>
                                    <textarea class="form-control" rows="3" name="Description"  id="Description"  placeholder="Description" ></textarea>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="display" name="display">
                                    <label class="form-check-label" for="exampleCheck1" >Do You Want to Display it on landing?</label>
                                </div>
                                <div class="text-center " id="loader" style="display: none">
                                    <i class="fa fa-refresh fa-lg fa-5x fa-spin" aria-hidden="true"></i>
                                </div>
                            </div>
                            <div class="modal-footer">

                                <button  class="btn btn-primary" id="btn">Save Employee</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">Sr.no</th>
                                    <th scope="col">Tittle</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Start Date</th>
                                    <th scope="col">End Date</th>
                                    <th scope="col">Picture</th>
                                    <th scope="col">Actions </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="project" varStatus="loop" >
                                    <tr>
                                        <th><c:out value="${loop.index+1}"></c:out></th>
                                        
                                        <td><c:out value="${project.getTittle()}"></c:out></td>
                                         <td><c:out value="${project.getDescription()}"></c:out></td>
                                        <td><c:out value="${project.getPrice()}"></c:out></td>
                                        <td><c:out value="${project.getStarting_date()}"></c:out></td>
                                        <td><c:out value="${project.getEnding_date()}"></c:out></td>
                                        <td><img class="img-fluid " style="width: 100px; height: 100px;" src="../ProjectsPic/<c:out value="${project.getPicture()}"></c:out>"/></td>

                                            <td>
                                                <a href="editDepartment.jsp?id=<c:out value="${project.getId()}"></c:out>"><span class="fa fa-eye fa-lg text-info"></span></a>
                                            <a href="./editProduct.jsp?id=<c:out value="${project.getId()}"></c:out>"><span class="fa fa-edit  fa-lg text-success"></span></a>
                                            <a onclick="return confirm('Are You Sure You want to delete?')" href="../deleteProject?id=<c:out value="${project.getId()}"></c:out>"><span class="fa fa-trash  fa-lg text-danger"></span></a>
                                            </td>
                                        </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-end">

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
        <script type="text/javascript">
                                                    $("document").ready(function () {
                                                        $("#projectForm").submit(function (event) {
                                                            event.preventDefault();
    //                    var data = $("#departmentForm").serialize(); // without pic
                                                            let form = new FormData(this); // with pic             
                                                            $.ajax({
                                                                url: "../saveProject",
                                                                type: 'POST',
                                                                data: form,
                                                                success: function (message) {
                                                                    console.log("in success " + message);
                                                                },
                                                                error: function (message) {
                                                                    console.log("in error " + message);
                                                                },
                                                                processData: false,
                                                                contentType: false
                                                            });
                                                        });
                                                    });
        </script>


    </body>
</html>