/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Entity;

import java.sql.Timestamp;

/**
 *
 * @author Bhatti
 */
public class Department {

    private int id;
    private String Name, Description;
    private Timestamp timestamp;

    public Department() {
    }

    public Department(String Name, String Description, Timestamp timestamp) {
        this.Name = Name;
        this.Description = Description;
        this.timestamp = timestamp;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Department{" + "id=" + id + ", Name=" + Name + ", Description=" + Description + ", timestamp=" + timestamp + '}';
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public Department(int id, String Name, String Description, Timestamp timestamp) {
        this.id = id;
        this.Name = Name;
        this.Description = Description;
        this.timestamp = timestamp;
    }

}
