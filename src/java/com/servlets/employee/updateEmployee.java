package com.servlets.employee;

import com.Dao.EmployeeDao;
import com.Entity.Employee;
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

@WebServlet(name = "updateEmployee", urlPatterns = {"/updateEmployee"})
@MultipartConfig
public class updateEmployee extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            try {
                int Id = Integer.parseInt(request.getParameter("Id"));
                String Name = request.getParameter("Name");
                String Email = request.getParameter("Email");
                String password = request.getParameter("password");
                String contact = request.getParameter("contact");
                String cnic = request.getParameter("cnic");
                String facebook = request.getParameter("facebook");
                String instagram = request.getParameter("instagram");
                int order = Integer.parseInt(request.getParameter("order"));
                int status = Integer.parseInt(request.getParameter("status"));
                Part new_picture = request.getPart("new_picture");
                Part prev_picture = request.getPart("prev_picture");
                String address = request.getParameter("address");
                String checkbox_display = request.getParameter("display");
                int department_id = Integer.parseInt(request.getParameter("department_id"));
                Date joining_date = Date.valueOf(("" + request.getParameter("joining_date")));
                int display = -1;
                if (checkbox_display.equals("on")) {
                    display = 1;
                } else {
                    display = 0;
                }
                
                Employee employee = EmployeeDao.getEmployeeById(Id);
                String old_pic_name=employee.getPicture();
                employee.setId(Id);
                employee.setName(Name);
                employee.setDepartment_id(department_id);
                employee.setEmail(Email);
                employee.setPassword(password);
                employee.setContact(contact);
                employee.setCNIC(cnic);
                employee.setFacebook_link(facebook);
                employee.setInstagram_link(instagram);
                employee.setAddress(address);
                employee.setJoining_date(joining_date);
                employee.setDisplay_order(order);
                employee.setStatus(status);
                employee.setDisplay(display);
                if (new_picture.getSize() == 0) {
                    employee.setPicture(employee.getPicture());
                    int i = EmployeeDao.update(employee);
                } else {
                    employee.setPicture(new_picture.getSubmittedFileName());
                    int i = EmployeeDao.update(employee);
                    // saving new pic and removing old pic
                    String path = request.getServletContext().getRealPath("/EmployeePics");
                    File file = new File(path + File.separator + new_picture.getSubmittedFileName());
                    FileOutputStream fileOutputStream = new FileOutputStream(file);
                    byte b[] = new byte[new_picture.getInputStream().available()];
                    new_picture.getInputStream().read(b);
                    fileOutputStream.write(b);
                    fileOutputStream.flush();
                    fileOutputStream.close();
                    // delete old pic
                    path = request.getServletContext().getRealPath("/EmployeePics");
                    file = new File(path + File.separator + old_pic_name);
                    file.delete();
                     
                }
                response.sendRedirect("Employee.jsp");
            } catch (Exception e) {
                response.getWriter().print("error"+e.getMessage());
            }

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
