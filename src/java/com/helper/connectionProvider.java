/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Bhatti
 */
public class connectionProvider {
 public static Connection  getConnection()throws Exception
 {
     Class.forName("com.mysql.jdbc.Driver");
     Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/employeemanagmentsystem","root","");
     return connection;
 }
}
