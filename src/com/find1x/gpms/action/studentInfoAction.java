package com.find1x.gpms.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.find1x.gpms.dao.IssueDAO;
import com.find1x.gpms.dao.StudentDAO;
import com.find1x.gpms.pojos.Issue;
import com.find1x.gpms.pojos.Student;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class studentInfoAction extends ActionSupport {

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

	private static final long serialVersionUID = 1L;
	private Student student;
	private Issue issue;
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	
	public Issue getIssue() {
		return issue;
	}
	public void setIssue(Issue issue) {
		this.issue = issue;
	}
	
	@Override
	public String execute() throws Exception {
		String no=(String)session.getAttribute("username");
		student=StudentDAO.getStudentInfo(no);
		issue=IssueDAO.getIssueInfo(StudentDAO.hasIssue(no));
		return SUCCESS;
	}
}
