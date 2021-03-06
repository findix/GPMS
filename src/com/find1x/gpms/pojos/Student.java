package com.find1x.gpms.pojos;

import org.bson.types.ObjectId;
import org.mongodb.morphia.annotations.Entity;
import org.mongodb.morphia.annotations.Id;

@Entity("students")
public class Student {
	@Id
	private ObjectId _id;
	private String name;
	private String sex;
	private String no;
	private String classno;
	private String department;
	private String specialty;
	private String telephone;
	private String email;
	private String teacher;
	private String issue;
	private String firstChoice;
	private String secondChoice;
	private String thirdChoice;
	
	public String getFirstChoice() {
		return firstChoice;
	}
	public void setFirstChoice(String firstChoice) {
		this.firstChoice = firstChoice;
	}
	public String getSecondChoice() {
		return secondChoice;
	}
	public void setSecondChoice(String secondChoice) {
		this.secondChoice = secondChoice;
	}
	public String getThirdChoice() {
		return thirdChoice;
	}
	public void setThirdChoice(String thirdChoice) {
		this.thirdChoice = thirdChoice;
	}
	public String getIssue() {
		return issue;
	}
	public void setIssue(String issue) {
		this.issue = issue;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public ObjectId get_id() {
		return _id;
	}
	public void set_id(ObjectId _id) {
		this._id = _id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getClassno() {
		return classno;
	}
	public void setClassno(String classno) {
		this.classno = classno;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getSpecialty() {
		return specialty;
	}
	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
