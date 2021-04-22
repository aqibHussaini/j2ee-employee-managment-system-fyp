/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Dao;

import com.Entity.Department;
import com.Entity.Employee;
import com.Entity.Project;
import com.helper.connectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Bhatti
 */
public class ProjectDao {

    public static int save(Project project) throws Exception {
        String sql = "INSERT INTO `project`(`tittle`, `client_id`, `price`, `status`, `starting_date`, `ending_date`, `demo_link`, `deployed_link`, `display_order`, `picture`, `description`, `display`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, project.getTittle());
        preparedStatement.setInt(2, project.getClient_id());
        preparedStatement.setInt(3, project.getPrice());
        preparedStatement.setShort(4, project.getStatus());
        preparedStatement.setDate(5, project.getStarting_date());
        preparedStatement.setDate(6, project.getEnding_date());
        preparedStatement.setString(7, project.getDemo_link());
        preparedStatement.setString(8, project.getDeployed_link());
        preparedStatement.setInt(9, project.getDisplay_order());
        preparedStatement.setString(10, project.getPicture());
        preparedStatement.setString(11, project.getDescription());
        preparedStatement.setShort(12, project.getDisplay());
        int result = preparedStatement.executeUpdate();
        return result;
    }

    public static int update(Project project) throws Exception {
        String sql = "UPDATE `project` SET `tittle`=?,`client_id`=?,`price`=?,`status`=?,`starting_date`=?,`ending_date`=?,`demo_link`=?,`deployed_link`=?,`display_order`=?,`picture`=?,`description`=?,`display`=? WHERE id=?";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, project.getTittle());
        preparedStatement.setInt(2, project.getClient_id());
        preparedStatement.setInt(3, project.getPrice());
        preparedStatement.setShort(4, project.getStatus());
        preparedStatement.setDate(5, project.getStarting_date());
        preparedStatement.setDate(6, project.getEnding_date());
        preparedStatement.setString(7, project.getDemo_link());
        preparedStatement.setString(8, project.getDeployed_link());
        preparedStatement.setInt(9, project.getDisplay_order());
        preparedStatement.setString(10, project.getPicture());
        preparedStatement.setString(11, project.getDescription());
        preparedStatement.setShort(12, project.getDisplay());
        preparedStatement.setInt(13, project.getId());
        int result = preparedStatement.executeUpdate();
        return result;
    }

    public static int delete(int id) throws Exception {
        String sql = "delete from `project` where id =?";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        int result = preparedStatement.executeUpdate();
        return result;
    }

    public static Project getProjectById(int id) throws Exception {
        String sql = "select * from project where id =?";
        Connection connection = connectionProvider.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        Project project = new Project();
        project.setId(resultSet.getInt(1));
        project.setClient_id(resultSet.getInt(3));
        project.setTittle(resultSet.getString("tittle"));
        project.setPrice(resultSet.getInt("price"));
        project.setStatus(resultSet.getShort("status"));
        project.setStarting_date(resultSet.getDate("starting_date"));
        project.setEnding_date(resultSet.getDate("ending_date"));
        project.setDemo_link(resultSet.getString("demo_link"));
        project.setDisplay_order(resultSet.getInt("display_order"));
        project.setDemo_link(resultSet.getString("demo_link"));
        project.setPicture(resultSet.getString("picture"));
        project.setDescription(resultSet.getString("description"));
        project.setDisplay(resultSet.getShort("display"));
        project.setTime(resultSet.getTimestamp("time"));
        return project;
    }

    public static List<Project> GetAllProjects(int page_number) throws Exception {
        String sql = "select * from project limit " + page_number + ",10";
        Connection connection = connectionProvider.getConnection();
        ResultSet resultSet = connection.prepareStatement(sql).executeQuery();
        List<Project> projects = new ArrayList<>();
        while (resultSet.next()) {
            Project project = new Project();
            project.setId(resultSet.getInt(1));
            project.setTittle(resultSet.getString("tittle"));
            project.setDescription(resultSet.getString("description"));
            project.setPrice(resultSet.getInt("price"));
            project.setStarting_date(resultSet.getDate("starting_date"));
            project.setEnding_date(resultSet.getDate("ending_date"));
            project.setPicture(resultSet.getString("picture"));
            projects.add(project);
        }
        return projects;
    }
    public static List<Project> GetAllProjects() throws Exception {
        String sql = "select * from project ";
        Connection connection = connectionProvider.getConnection();
        ResultSet resultSet = connection.prepareStatement(sql).executeQuery();
        List<Project> projects = new ArrayList<>();
        while (resultSet.next()) {
            Project project = new Project();
            project.setId(resultSet.getInt(1));
            project.setTittle(resultSet.getString("tittle"));
            projects.add(project);
        }
        return projects;
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
