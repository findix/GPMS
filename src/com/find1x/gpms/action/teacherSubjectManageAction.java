package com.find1x.gpms.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.find1x.gpms.dao.IssueDAO;
import com.find1x.gpms.dao.UserDAO;
import com.find1x.gpms.pojos.Issue;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class teacherSubjectManageAction extends ActionSupport {

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

	private static final long serialVersionUID = 1L;
	
	private List<Issue> issues;

	public List<Issue> getIssues() {
		return issues;
	}

	public void setIssues(List<Issue> issues) {
		this.issues = issues;
	}

	@Override
	public String execute() throws Exception {
		if(UserDAO.getType((String)session.getAttribute("username"))==3)
			issues = IssueDAO.getList();
		else
			issues = IssueDAO.getList((String)session.getAttribute("username"));
		return SUCCESS;
	}

}
