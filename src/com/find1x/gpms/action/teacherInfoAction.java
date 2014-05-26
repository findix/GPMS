package com.find1x.gpms.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.find1x.gpms.dao.StudentDAO;
import com.find1x.gpms.dao.TeacherDAO;
import com.find1x.gpms.pojos.Teacher;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class teacherInfoAction extends ActionSupport {

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

	private static final long serialVersionUID = 1L;

	private Teacher teacher;
	
	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	@Override
	public String execute() throws Exception {
		teacher=TeacherDAO.getTeacherInfo((String)session.getAttribute("username"));
		return SUCCESS;
	}

}
