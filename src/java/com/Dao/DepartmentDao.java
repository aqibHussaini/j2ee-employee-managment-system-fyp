package com.Dao;

import com.Entity.Department;
import com.helper.connectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDao {

    public static int save(Department department) throws Exception {
        String sql = "insert into department(name,description) values(?,?)";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, department.getName());
        preparedStatement.setString(2, department.getDescription());
        int result = preparedStatement.executeUpdate();
        return result;
    }

    public static int update(Department department) throws Exception {
        String sql = "update department set name=?,description=? where id= ?";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, department.getName());
        preparedStatement.setString(2, department.getDescription());
        preparedStatement.setInt(3, department.getId());
        int result = preparedStatement.executeUpdate();
        return result;
    }

    public static int delete(int id) throws Exception {
        String sql = "delete from department where id =?";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        int result = preparedStatement.executeUpdate();
        return result;
    }

    public static Department getDepartmentById(int id) throws Exception {
        String sql = "select * from department where id =?";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        Department department = new Department();
        department.setId(resultSet.getInt(1));
        department.setName(resultSet.getString(2));
        department.setDescription(resultSet.getString(3));
        department.setTimestamp(resultSet.getTimestamp(4));
        return department;
    }

    public static List<Department> GetAllDepartments(int page_number) throws Exception {
        String sql = "select * from department order by id DESC limit " + page_number + ",10";
        Connection connection = connectionProvider.getConnection();
        ResultSet resultSet = connection.prepareStatement(sql).executeQuery();
        List<Department> departments = new ArrayList<>();
        while (resultSet.next()) {
            Department department = new Department();
            department.setId(resultSet.getInt(1));
            department.setName(resultSet.getString(2));
            department.setDescription(resultSet.getString(3));
            department.setTimestamp(resultSet.getTimestamp(4));
            departments.add(department);
        }
        return departments;
    }
    public static List<Department> GetAllDepartments() throws Exception {
        String sql = "select * from department ";
        Connection connection = connectionProvider.getConnection();
        ResultSet resultSet = connection.prepareStatement(sql).executeQuery();
        List<Department> departments = new ArrayList<>();
        while (resultSet.next()) {
            Department department = new Department();
            department.setId(resultSet.getInt(1));
            department.setName(resultSet.getString(2));
            department.setDescription(resultSet.getString(3));
            department.setTimestamp(resultSet.getTimestamp(4));
            departments.add(department);
        }
        return departments;
    }

    public static int GetTableRowCount() throws Exception {
        String sql = "select * from department";
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

    public static List<Department> searchByNames( String name) throws Exception {
        String sql = "";
     
            sql = "SELECT * FROM department WHERE name LIKE '%" + name + "%' ";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
      

        ResultSet resultSet = preparedStatement.executeQuery();
        List<Department> departments = new ArrayList<>();
        while (resultSet.next()) {
            Department department = new Department();
            department.setId(resultSet.getInt(1));
            department.setName(resultSet.getString(2));
            department.setDescription(resultSet.getString(3));
            department.setTimestamp(resultSet.getTimestamp(4));
            departments.add(department);
        }
        return departments;
    }
    public static List<String> getNames( String name) throws Exception {
        String sql = "";
            sql = "SELECT name FROM department WHERE name LIKE '%" + name + "%' " ;
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        List<String> departmentsNames = new ArrayList<>();
        while (resultSet.next()) {
           departmentsNames.add(resultSet.getString(1));
           
        }
        return departmentsNames;
    }
}
