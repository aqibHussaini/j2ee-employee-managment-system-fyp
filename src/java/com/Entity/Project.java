/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Entity;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Bhatti
 */
public class Project {
    private int id,client_id,price,display_order;
    private short status,display;
    private  Date starting_date,ending_date;
    private String demo_link,deployed_link,picture,description,tittle;
    Timestamp time;

    @Override
    public String toString() {
        return "Project{" + "id=" + id + ", client_id=" + client_id + ", price=" + price + ", display_order=" + display_order + ", status=" + status + ", display=" + display + ", starting_date=" + starting_date + ", ending_date=" + ending_date + ", demo_link=" + demo_link + ", deployed_link=" + deployed_link + ", picture=" + picture + ", description=" + description + ", tittle=" + tittle + ", time=" + time + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClient_id() {
        return client_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDisplay_order() {
        return display_order;
    }

    public void setDisplay_order(int display_order) {
        this.display_order = display_order;
    }

    public Project(int client_id, int price, int display_order, short status, short display, Date starting_date, Date ending_date, String demo_link, String deployed_link, String description, String tittle) {
        this.client_id = client_id;
        this.price = price;
        this.display_order = display_order;
        this.status = status;
        this.display = display;
        this.starting_date = starting_date;
        this.ending_date = ending_date;
        this.demo_link = demo_link;
        this.deployed_link = deployed_link;
        this.description = description;
        this.tittle = tittle;
    }

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    public short getDisplay() {
        return display;
    }

    public void setDisplay(short display) {
        this.display = display;
    }

    public Date getStarting_date() {
        return starting_date;
    }

    public void setStarting_date(Date starting_date) {
        this.starting_date = starting_date;
    }

    public Date getEnding_date() {
        return ending_date;
    }

    public void setEnding_date(Date ending_date) {
        this.ending_date = ending_date;
    }

    public String getDemo_link() {
        return demo_link;
    }

    public void setDemo_link(String demo_link) {
        this.demo_link = demo_link;
    }

    public String getDeployed_link() {
        return deployed_link;
    }

    public void setDeployed_link(String deployed_link) {
        this.deployed_link = deployed_link;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Project(int client_id, int price, int display_order, short status, short display, Date starting_date, Date ending_date, String demo_link, String deployed_link, String picture, String description, String tittle) {
        this.client_id = client_id;
        this.price = price;
        this.display_order = display_order;
        this.status = status;
        this.display = display;
        this.starting_date = starting_date;
        this.ending_date = ending_date;
        this.demo_link = demo_link;
        this.deployed_link = deployed_link;
        this.picture = picture;
        this.description = description;
        this.tittle = tittle;
    }

    public Project(int id, int client_id, int price, int display_order, short status, short display, Date starting_date, Date ending_date, String demo_link, String deployed_link, String picture, String description, String tittle, Timestamp time) {
        this.id = id;
        this.client_id = client_id;
        this.price = price;
        this.display_order = display_order;
        this.status = status;
        this.display = display;
        this.starting_date = starting_date;
        this.ending_date = ending_date;
        this.demo_link = demo_link;
        this.deployed_link = deployed_link;
        this.picture = picture;
        this.description = description;
        this.tittle = tittle;
        this.time = time;
    }


    public Project() {
    }
}
