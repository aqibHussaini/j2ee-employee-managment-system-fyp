package com.Entity;

import java.sql.Date;
import java.sql.Timestamp;

public class Employee {

    private int id, display_order,status, display,department_id;
    private String name, email, password, contact, CNIC, facebook_link, instagram_link, address, picture;
    private Date joining_date;
  private Timestamp timestamp;     

    @Override
    public String toString() {
        return "Employee{" + "id=" + id + ", display_order=" + display_order + ", status=" + status + ", display=" + display + ", department_id=" + department_id + ", name=" + name + ", email=" + email + ", password=" + password + ", contact=" + contact + ", CNIC=" + CNIC + ", facebook_link=" + facebook_link + ", instagram_link=" + instagram_link + ", address=" + address + ", picture=" + picture + ", joining_date=" + joining_date + ", timestamp=" + timestamp + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDisplay_order() {
        return display_order;
    }

    public void setDisplay_order(int display_order) {
        this.display_order = display_order;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getDisplay() {
        return display;
    }

    public void setDisplay(int display) {
        this.display = display;
    }

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getCNIC() {
        return CNIC;
    }

    public void setCNIC(String CNIC) {
        this.CNIC = CNIC;
    }

    public String getFacebook_link() {
        return facebook_link;
    }

    public void setFacebook_link(String facebook_link) {
        this.facebook_link = facebook_link;
    }

    public String getInstagram_link() {
        return instagram_link;
    }

    public void setInstagram_link(String instagram_link) {
        this.instagram_link = instagram_link;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Date getJoining_date() {
        return joining_date;
    }

    public void setJoining_date(Date joining_date) {
        this.joining_date = joining_date;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public Employee() {
    }

    public Employee(int display_order, int status, int display, int department_id, String name, String email, String password, String contact, String CNIC, String facebook_link, String instagram_link, String address, String picture, Date joining_date) {
        this.display_order = display_order;
        this.status = status;
        this.display = display;
        this.department_id = department_id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.CNIC = CNIC;
        this.facebook_link = facebook_link;
        this.instagram_link = instagram_link;
        this.address = address;
        this.picture = picture;
        this.joining_date = joining_date;
    }

    public Employee(int id, int display_order, int status, int display, int department_id, String name, String email, String password, String contact, String CNIC, String facebook_link, String instagram_link, String address, String picture, Date joining_date, Timestamp timestamp) {
        this.id = id;
        this.display_order = display_order;
        this.status = status;
        this.display = display;
        this.department_id = department_id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.CNIC = CNIC;
        this.facebook_link = facebook_link;
        this.instagram_link = instagram_link;
        this.address = address;
        this.picture = picture;
        this.joining_date = joining_date;
        this.timestamp = timestamp;
    }


}
