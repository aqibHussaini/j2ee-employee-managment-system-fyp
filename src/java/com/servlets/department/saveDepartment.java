/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets.department;

import com.Dao.DepartmentDao;
import com.Entity.Department;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class saveDepartment extends HttpServlet {
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
//        processRequest(request, response);
          String name=request.getParameter("Name");
            String description=request.getParameter("Description");
            Department department=new Department();
            department.setName(name);
            department.setDescription(description);
            try
            {
                Thread.sleep(1000);
           int i= DepartmentDao.save(department);
           if(i==1)
           {
               response.getWriter().print("obj saved");
           }
           else
           {
               response.getWriter().print("something went wrong!!!");  
           }
            }
            catch(Exception e)
            {
                response.getWriter().print("obj saved"+e.getMessage()); 
            }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
