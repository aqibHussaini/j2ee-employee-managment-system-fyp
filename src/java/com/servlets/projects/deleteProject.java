
package com.servlets.projects;

import com.Dao.EmployeeDao;
import com.Dao.ProjectDao;
import com.Entity.Project;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "deleteProject", urlPatterns = {"/deleteProject"})
public class deleteProject extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
              int id=Integer.parseInt(request.getParameter("id"));
           try
           {
               Project project=ProjectDao.getProjectById(id);
               String pic=project.getPicture();
              int result= ProjectDao.delete(id); 
              if(result==1)
              {
              String path=request.getServletContext().getRealPath("/ProjectsPic");
                File file=new File(path+File.separator+pic);
                boolean res=file.delete();
              }
           }
           catch(Exception e)
           {
               System.out.println("error "+e.getMessage());
           }
         
           response.sendRedirect("projectsViews/Project.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
