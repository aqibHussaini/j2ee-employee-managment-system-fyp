
package com.servlets.task;

import com.Entity.Task;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "saveTask", urlPatterns = {"/saveTask"})
public class saveTask extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
       Task task=new Task();
       task.setTittle(request.getParameter("tittle"));
       task.setEmployee_id(Integer.parseInt(request.getParameter("employee_id")));
       task.setProject_id(Integer.parseInt(request.getParameter("project_id")));
       task.setStatus(Integer.parseInt(request.getParameter("status")));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm ");
      String datetimeLocal = request.getParameter("starting_date");
System.out.println("started "+Timestamp.valueOf(datetimeLocal.replace("T"," ")));
       task.setStarting_date(Timestamp.valueOf(sdf.format(request.getParameter("starting_date"))));
       task.setSubmitted_date(Timestamp.valueOf(sdf.format(request.getParameter("starting_date"))));
       task.setDeadline(Timestamp.valueOf(sdf.format(request.getParameter("deadline"))));
       task.setDescription((request.getParameter("description")));
        System.out.println(task);
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
        processRequest(request, response);
       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
