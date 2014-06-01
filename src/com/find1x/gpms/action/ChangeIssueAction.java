package com.find1x.gpms.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.find1x.gpms.dao.IssueDAO;
import com.find1x.gpms.pojos.Issue;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ChangeIssueAction extends ActionSupport{
	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();
	
	private Issue issue;
	private String _id;
	private List<Issue> issues;

	public List<Issue> getIssues() {
		return issues;
	}

	public void setIssues(List<Issue> issues) {
		this.issues = issues;
	}
	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public Issue getIssue() {
		return issue;
	}

	public void setIssue(Issue issue) {
		this.issue = issue;
	}

	@Override
	public String execute() throws Exception {
		if (IssueDAO.changeIssue(_id,issue.getTitle(), issue.getInfo(), issue.getRequirement(),
				issue.getSpecialty(), issue.getTotal(), issue.getTeacher())) {
			issues = IssueDAO.getList((String)session.getAttribute("username"));
			return SUCCESS;
		} else {
			return ERROR;
		}
	}
}
