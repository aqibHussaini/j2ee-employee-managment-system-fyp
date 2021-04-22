
package com.servlets.department;

import com.Dao.DepartmentDao;
import com.Entity.Department;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class updateDepartment extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int id=Integer.parseInt(request.getParameter("id"));
           String name=request.getParameter("Name");
            String description=request.getParameter("Description");
            Department department=new Department();
            department.setId(id);
            department.setName(name);
            department.setDescription(description);
           try
           {
            DepartmentDao.update(department);
            response.sendRedirect("departmentViews/Departments.jsp");
           }
           catch(Exception e)
           {
           }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
