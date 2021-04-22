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
    request.setAttribute("page_number", page_number);
    List<Employee> list = EmployeeDao.GetAllEmployees(page_number);
    request.setAttribute("list", list);
    List<Department> departments = DepartmentDao.GetAllDepartments();
    request.setAttribute("departments", departments);
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
            <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal">Add Employee</button>

            <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                Search 
            </button>

            <div class="collapse mt-3" id="collapseExample">
                <div class="card card-body">
                    <form action="searchDepartment" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-3">
                                <input class="form-control" type="number" placeholder=" Enter Id" name="id"
                                       >
                            </div>
                            <div class="col-3">
                                <input class="form-control" type="text" placeholder="Enter Name"  name="Name"
                                       >
                            </div>
                            <div class="col-3">
                                <input class="form-control" type="text" placeholder="Enter Description"  name="Description"
                                       >
                            </div>
                            <div class="col-3">
                                <input class="btn btn-outline-success" type="submit"
                                       value="search">
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
                            <h5 class="modal-title" id="exampleModalLabel">Employee Form</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                        </div>
                        <form   id="departmentForm" action="saveEmployee" method="post" enctype="multipart/form-data">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Name</label>
                                        <input type="text" class="form-control" name="Name" placeholder="Name" id="Name" aria-describedby="emailHelp">
                                    </div>
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Department</label>
                                        <select class="form-control" name="department_id" id="inputGroupSelect04">
                                               <option selected value="0">Choose...</option>
                                            <c:forEach var="department" items="${departments}">
                                                <option value="<c:out value="${department.getId()}"></c:out>"><c:out value="${department.getName()}"></c:out></option>
                                            </c:forEach>
                                         
                                        </select>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Email</label>
                                        <input type="text" class="form-control" name="Email" placeholder="Email" id="Email" aria-describedby="emailHelp">
                                    </div>
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Password</label>
                                        <input type="password" class="form-control" name="password" placeholder="password" id="password" aria-describedby="emailHelp">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Contact</label>
                                        <input type="text" class="form-control" name="contact" placeholder="contact" id="contact" aria-describedby="emailHelp">
                                    </div>
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter CNIC</label>
                                        <input type="text" class="form-control" name="cnic" placeholder="cnic" id="whatsapp" aria-describedby="emailHelp">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Facebook</label>
                                        <input type="text" class="form-control" name="facebook" placeholder="facebook" id="facebook" aria-describedby="emailHelp">
                                    </div>
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Instagram</label>
                                        <input type="text" class="form-control" name="instagram" placeholder="instagram" id="instagram" aria-describedby="emailHelp">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Joining Date</label>
                                        <input type="date" class="form-control" name="joining_date" placeholder="joining_date" id="joining_date" aria-describedby="emailHelp">
                                    </div>
                                    <div class="col-6">
                                        <label for="exampleInputEmail1" class="form-label">Enter Status</label>
                                        <select  class="form-control"  name="status" placeholder="status" id="status"  id="exampleFormControlSelect2">
                                            <option value="1">Permanent</option>
                                            <option value="2">Intern</option>
                                        </select>
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
                                    <label for="exampleInputPassword1" class="form-label">Enter Address</label>
                                    <textarea class="form-control" rows="3" name="address" placeholder="address" ></textarea>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="display" name="display">
                                    <label class="form-check-label" for="exampleCheck1">Do You Want to Display it on landing?</label>
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
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Contact</th>
                                    <th scope="col">Picture</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="employee" varStatus="loop" >
                                    <tr>
                                        <th><c:out value="${loop.index+1}"></c:out></th>
                                        <td><c:out value="${employee.getName()}"></c:out></td>
                                        <td><c:out value="${employee.getEmail()}"></c:out></td>
                                        <td><c:out value="${employee.getContact()}"></c:out></td>
                                        <td><img class="img-fluid " style="width: 100px; height: 50px;" src="./EmployeePics/<c:out value="${employee.getPicture()}"></c:out>"/></td>

                                            <td>
                                                <a href="editDepartment.jsp?id=<c:out value="${employee.getId()}"></c:out>"><span class="fa fa-eye fa-lg text-info"></span></a>
                                                <a href="editEmployee.jsp?id=<c:out value="${employee.getId()}"></c:out>"><span class="fa fa-edit  fa-lg text-success"></span></a>
                                            <a onclick="return confirm('Are You Sure You want to delete?')" href="deleteEmployee?id=<c:out value="${employee.getId()}"></c:out>"><span class="fa fa-trash  fa-lg text-danger"></span></a>
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
                                                    $("#departmentForm").submit(function (event) {
                                                        event.preventDefault();
//                    var data = $("#departmentForm").serialize(); // without pic
                                                        let form = new FormData(this); // with pic
                                                        
                                                        $.ajax({
                                                            url: "saveEmployee",
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