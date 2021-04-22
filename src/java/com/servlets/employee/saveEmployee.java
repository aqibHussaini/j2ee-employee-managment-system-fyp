
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

@WebServlet(name = "saveEmployee", urlPatterns = {"/saveEmployee"})
@MultipartConfig
public class saveEmployee extends HttpServlet {

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
        try {
            String Name = request.getParameter("Name");
            String Email = request.getParameter("Email");
            String password = request.getParameter("password");
            String contact = request.getParameter("contact");
            String cnic = request.getParameter("cnic");
            String facebook = request.getParameter("facebook");
            String instagram = request.getParameter("instagram");
            int order = Integer.parseInt(request.getParameter("order"));
            int status = Integer.parseInt(request.getParameter("status"));
            Part part = request.getPart("picture");
            String address = request.getParameter("address");
            String checkbox_display = request.getParameter("display");
            int department_id = Integer.parseInt(request.getParameter("department_id"));
            int display = -1;
            if (checkbox_display.equals("on")) {
                display = 1;
            } else {
                display = 0;
            }
            Date joining_date = Date.valueOf(("" + request.getParameter("joining_date")));
            Employee employee = new Employee(order, status, display, department_id, Name, Email, password, contact, cnic, facebook, instagram,address , part.getSubmittedFileName(), joining_date);
            int i = EmployeeDao.save(employee);
            if (i == 1) {
                String path = request.getServletContext().getRealPath("/EmployeePics");
                File file = new File(path + File.separator + part.getSubmittedFileName());
                FileOutputStream fileOutputStream = new FileOutputStream(file);
                byte b[] = new byte[part.getInputStream().available()];
                part.getInputStream().read(b);
                fileOutputStream.write(b);
                fileOutputStream.flush();
                fileOutputStream.close();
                response.getWriter().print("data saved!!!");
            }

        } catch (Exception e) {
            response.getWriter().print("error " + e.getMessage());
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
