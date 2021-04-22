package com.Dao;

import com.Entity.Department;
import com.Entity.Employee;
import com.helper.connectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {

    public static int save(Employee employee) throws Exception {
        String sql = "INSERT INTO `Employee`(`Name`,`department_id`, `Email`, `Password`, `contact`, `CNIC`, `facebook_link`, `instagram_link`, `address`, `picture`, `joining_date`, `display_order`, `status`, `display`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, employee.getName());
        preparedStatement.setInt(2, employee.getDepartment_id());
        preparedStatement.setString(3, employee.getEmail());
        preparedStatement.setString(4, employee.getPassword());
        preparedStatement.setString(5, employee.getContact());
        preparedStatement.setString(6, employee.getCNIC());
        preparedStatement.setString(7, employee.getFacebook_link());
        preparedStatement.setString(8, employee.getInstagram_link());
        preparedStatement.setString(9, employee.getAddress());
        preparedStatement.setString(10, employee.getPicture());
        preparedStatement.setDate(11, employee.getJoining_date());
        preparedStatement.setInt(12, employee.getDisplay_order());
        preparedStatement.setInt(13, employee.getStatus());
        preparedStatement.setInt(14, employee.getDisplay());
        int result = preparedStatement.executeUpdate();
        return result;
    }

    public static int update(Employee employee) throws Exception {
        String sql = "UPDATE `employee` SET `Name`=?,`department_id`=?,`Email`=?,`Password`=?,`contact`=?,`CNIC`=?,`facebook_link`=?,`instagram_link`=?,`address`=?,`picture`=?,`joining_date`=?,`display_order`=?,`status`=?,`display`=? WHERE id=?";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, employee.getName());
        preparedStatement.setInt(2, employee.getDepartment_id());
        preparedStatement.setString(3, employee.getEmail());
        preparedStatement.setString(4, employee.getPassword());
        preparedStatement.setString(5, employee.getContact());
        preparedStatement.setString(6, employee.getCNIC());
        preparedStatement.setString(7, employee.getFacebook_link());
        preparedStatement.setString(8, employee.getInstagram_link());
        preparedStatement.setString(9, employee.getAddress());
        preparedStatement.setString(10, employee.getPicture());
        preparedStatement.setDate(11, employee.getJoining_date());
        preparedStatement.setInt(12, employee.getDisplay_order());
        preparedStatement.setInt(13, employee.getStatus());
        preparedStatement.setInt(14, employee.getDisplay());
        preparedStatement.setInt(15, employee.getId());
        int result = preparedStatement.executeUpdate();
        return result;
    }

    public static int delete(int id) throws Exception {
        String sql = "delete from `Employee` where id =?";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        int result = preparedStatement.executeUpdate();
        return result;
    }

    public static Employee getEmployeeById(int id) throws Exception {
        String sql = "select * from Employee where id =?";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        Employee employee = new Employee();
        employee.setId(resultSet.getInt(1));
        employee.setName(resultSet.getString(2));
        employee.setDepartment_id(resultSet.getInt(3));
        employee.setEmail(resultSet.getString(4));
        employee.setPassword(resultSet.getString(5));
        employee.setContact(resultSet.getString(6));
        employee.setCNIC(resultSet.getString(7));
        employee.setFacebook_link(resultSet.getString(8));
        employee.setInstagram_link(resultSet.getString(9));
        employee.setAddress(resultSet.getString(10));
        employee.setPicture(resultSet.getString(11));
        employee.setJoining_date(resultSet.getDate(12));
        employee.setDisplay_order(resultSet.getInt(13));
        employee.setStatus(resultSet.getInt(14));
        employee.setDisplay(resultSet.getInt(15));
        employee.setTimestamp(resultSet.getTimestamp(16));
        return employee;
    }

    public static List<Employee> GetAllEmployees(int page_number) throws Exception {
        String sql = "select * from Employee limit " + page_number + ",10";
        Connection connection = connectionProvider.getConnection();
        ResultSet resultSet = connection.prepareStatement(sql).executeQuery();
        List<Employee> employees = new ArrayList<>();
        while (resultSet.next()) {
            Employee employee = new Employee();
            employee.setId(resultSet.getInt(1));
            employee.setName(resultSet.getString(2));
            employee.setDepartment_id(resultSet.getInt(3));
            employee.setEmail(resultSet.getString(4));
            employee.setPassword(resultSet.getString(5));
            employee.setContact(resultSet.getString(6));
            employee.setCNIC(resultSet.getString(7));
            employee.setFacebook_link(resultSet.getString(8));
            employee.setInstagram_link(resultSet.getString(9));
            employee.setAddress(resultSet.getString(10));
            employee.setPicture(resultSet.getString(11));
            employee.setJoining_date(resultSet.getDate(12));
            employee.setDisplay_order(resultSet.getInt(13));
            employee.setStatus(resultSet.getInt(14));
            employee.setDisplay(resultSet.getInt(15));
            employee.setTimestamp(resultSet.getTimestamp(16));
            employees.add(employee);
        }

        return employees;
    }
    public static List<Employee> GetAllEmployees() throws Exception {
        String sql = "select * from Employee ";
        Connection connection = connectionProvider.getConnection();
        ResultSet resultSet = connection.prepareStatement(sql).executeQuery();
        List<Employee> employees = new ArrayList<>();
        while (resultSet.next()) {
            Employee employee = new Employee();
            employee.setId(resultSet.getInt(1));
            employee.setName(resultSet.getString(2));
            employees.add(employee);
        }

        return employees;
    }

    public static int GetTableRowCount() throws Exception {
        String sql = "select * from Employee";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        int size = 0;
        if (resultSet != null) {
            resultSet.last();    // moves cursor to the last row
            size = resultSet.getRow(); // get row id 
        }
        return size;
    }

    public static List<Department> search(int id, String name, String description) throws Exception {
        String sql = "";
        if (id == 0) {
            sql = "SELECT * FROM department WHERE name LIKE '%" + name + "%' OR Description LIKE '%" + description + "%'";
        } else {
            sql = "SELECT * FROM department WHERE name LIKE '%" + name + "%' AND Description LIKE '%" + description + "%' AND id=?";
        }

        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        if (id == 0) {
        } else {
            preparedStatement.setInt(1, id);
        }

        ResultSet resultSet = preparedStatement.executeQuery();
        List<Department> departments = new ArrayList<>();
        while (resultSet.next()) {
            Department department = new Department();
            department.setId(resultSet.getInt(1));
//            department.setName(resultSet.getString(2));
//            department.set(resultSet.getString(3));
//            department.setName(resultSet.getString(4));
//            departments.add(department);
        }
        return departments;
    }
}
