/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets.projects;

import com.Dao.ProjectDao;
import com.Entity.Project;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "updateProject", urlPatterns = {"/updateProject"})
@MultipartConfig
public class updateProject extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id = Integer.parseInt(request.getParameter("id"));
            String pic_name = ProjectDao.getProjectById(id).getPicture();
            String Tittle = request.getParameter("Tittle");
            int client_id = Integer.parseInt(request.getParameter("Client"));
            int price = Integer.parseInt(request.getParameter("price"));
            short status = Short.parseShort(request.getParameter("status"));
            Date starting_date = Date.valueOf(request.getParameter("starting_date"));
            Date ending_date = Date.valueOf(request.getParameter("ending_date"));
            String demo_link = request.getParameter("demo_link");
            String deployed_link = request.getParameter("deployed_link");
            int order = Integer.parseInt(request.getParameter("order"));
            Part part = request.getPart("picture");
            String Description = request.getParameter("Description");
            String checkbox_display = request.getParameter("display");
            short display = -1;
            if (checkbox_display.equals("on")) {
                display = 1;
            } else {
                display = 0;
            }
            Project project = new Project(client_id, price, order, status, display, starting_date, ending_date, demo_link, deployed_link, Description, Tittle);
            try {
                if (part.getSize() == 0) {
                    project.setPicture(pic_name);
                    project.setId(id);
                    int res = ProjectDao.update(project);
                } else {
                    project.setPicture(part.getSubmittedFileName());
                    project.setId(id);
                    int res = ProjectDao.update(project);
                    if (res == 1) {
                        String path = request.getServletContext().getRealPath("/ProjectsPic");
                        File file = new File(path + File.separator + part.getSubmittedFileName());
                        FileOutputStream fileOutputStream = new FileOutputStream(file);
                        byte b[] = new byte[part.getInputStream().available()];
                        part.getInputStream().read(b);
                        fileOutputStream.write(b);
                        fileOutputStream.flush();
                        fileOutputStream.close();
//                        // delete old pic
                        path = request.getServletContext().getRealPath("/ProjectsPic");
                        file = new File(path + File.separator + pic_name);
                        file.delete();
                    }
                }

            } catch (Exception e) {
                response.getWriter().print(e.getMessage());
            }
            response.sendRedirect("./projectsViews/Project.jsp");
        } catch (Exception e) {
            response.getWriter().print(e.getMessage());
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
