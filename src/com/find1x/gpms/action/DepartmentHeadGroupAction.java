package com.find1x.gpms.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.apache.struts2.ServletActionContext;

import com.find1x.gpms.dao.TeacherDAO;
import com.find1x.gpms.pojos.Teacher;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DepartmentHeadGroupAction extends ActionSupport {

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

	private static final long serialVersionUID = 1L;
	private Teacher teacher;
	private String isLeader;

	@Override
	public String execute() throws Exception {
		Teacher t = TeacherDAO.getTeacherInfo(teacher.getNo());
		t.setGroup(teacher.getGroup());
		t.setLeader("true".equals(isLeader) ? true : false);
		TeacherDAO.saveTeacher(t);
		return SUCCESS;
	}

	/**
	 * @return the teacher
	 */
	public Teacher getTeacher() {
		return teacher;
	}

	/**
	 * @param teacher
	 *            the teacher to set
	 */
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	/**
	 * @return the isLeader
	 */
	public String getIsLeader() {
		return isLeader;
	}

	/**
	 * @param isLeader
	 *            the isLeader to set
	 */
	public void setIsLeader(String isLeader) {
		this.isLeader = isLeader;
	}

}
