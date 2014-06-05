package com.find1x.gpms.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.find1x.gpms.dao.IssueDAO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IssueInfoAction extends ActionSupport {

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

	private static final long serialVersionUID = 1L;
	private String firstChoice;
	private String secondChoice;
	private String thirdChoice;
	private String title;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

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

	@Override
	public String execute() throws Exception {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		if(firstChoice!=null){
			out.println(IssueDAO.getIssueJson(firstChoice));
		}else if(secondChoice!=null){
			out.println(IssueDAO.getIssueJson(secondChoice));
		}else if(thirdChoice!=null){
			out.println(IssueDAO.getIssueJson(thirdChoice));
		}
		out.flush();
		out.close();
		return SUCCESS;
	}

}
