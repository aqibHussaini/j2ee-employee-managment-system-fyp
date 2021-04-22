
package com.Entity;

import java.sql.Timestamp;

public class Task {
    private int id,employee_id,project_id,status;
    private String tittle,link,description;
    private Timestamp starting_date,deadline,submitted_date,time;

    @Override
    public String toString() {
        return "Task{" + "id=" + id + ", employee_id=" + employee_id + ", project_id=" + project_id + ", status=" + status + ", tittle=" + tittle + ", link=" + link + ", description=" + description + ", starting_date=" + starting_date + ", deadline=" + deadline + ", submitted_date=" + submitted_date + ", time=" + time + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getStarting_date() {
        return starting_date;
    }

    public void setStarting_date(Timestamp starting_date) {
        this.starting_date = starting_date;
    }

    public Timestamp getDeadline() {
        return deadline;
    }

    public void setDeadline(Timestamp deadline) {
        this.deadline = deadline;
    }

    public Timestamp getSubmitted_date() {
        return submitted_date;
    }

    public void setSubmitted_date(Timestamp submitted_date) {
        this.submitted_date = submitted_date;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Task() {
    }

    public Task(int employee_id, int project_id, int status, String tittle, String link, String description, Timestamp starting_date, Timestamp deadline, Timestamp submitted_date, Timestamp time) {
        this.employee_id = employee_id;
        this.project_id = project_id;
        this.status = status;
        this.tittle = tittle;
        this.link = link;
        this.description = description;
        this.starting_date = starting_date;
        this.deadline = deadline;
        this.submitted_date = submitted_date;
        this.time = time;
    }

    public Task(int id, int employee_id, int project_id, int status, String tittle, String link, String description, Timestamp starting_date, Timestamp deadline, Timestamp submitted_date, Timestamp time) {
        this.id = id;
        this.employee_id = employee_id;
        this.project_id = project_id;
        this.status = status;
        this.tittle = tittle;
        this.link = link;
        this.description = description;
        this.starting_date = starting_date;
        this.deadline = deadline;
        this.submitted_date = submitted_date;
        this.time = time;
    }
}
