<%-- 
    Document   : updateDepartment
    Created on : Mar 14, 2021, 11:40:34 AM
    Author     : Bhatti
--%>

<%@page import="com.Entity.Department"%>
<%@page import="com.Dao.DepartmentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Department department = DepartmentDao.getDepartmentById(id);
    request.setAttribute("department", department);
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Department</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">       <title>Department </title>

    </head>
    <body>
        <div class="container">
            <div class="row mt-5">
                <div class="col-6 offset-3">
                    <form  method="post" action="../updateDepartment" id="departmentForm">
                        <input type="hidden" class="form-control" name="id" value="${department.getId()}" placeholder="id" id="id" aria-describedby="emailHelp">
                        <div class="form-group ">
                            <label for="exampleInputEmail1" class="form-label font-weight-bold">Enter Name</label>
                            <input type="text" class="form-control" name="Name" value="${department.getName()}" placeholder="Name" id="Name" aria-describedby="emailHelp"required="">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1" class="form-label font-weight-bold">Description</label>
                            <textarea class="form-control" rows="5" name="Description"  placeholder="Description" required="">${department.getDescription()}</textarea>
                        </div>
                        <div class="text-center " id="loader" style="display: none">
                            <i class="fa fa-refresh fa-lg fa-5x fa-spin" aria-hidden="true"></i>
                        </div>
                        <div  class="form-group text-center mt-2"id="btn">
                            <button  class="btn btn-primary font-weight-bold" id="btn">Update Department</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script    src="https://code.jquery.com/jquery-3.6.0.min.js"
               integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"></script>
   
</html>
