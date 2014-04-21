package com.find1x.gpms.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.find1x.gpms.dao.UserDAO;
import com.find1x.gpms.util.MongoDBUtil;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ChangePasswdAction extends ActionSupport {

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

	private static final long serialVersionUID = 1L;
	private String oldPassword;
	private String password;
	private String message;

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	@Override
	public String execute() throws Exception {
		List<DBObject> list = UserDAO.getList(session.getAttribute("username")
				.toString(), oldPassword);
		System.out.println(oldPassword);
		if (list.size() == 0) {
			return ERROR;
		} else {
			DBCollection user = MongoDBUtil.getCollection("users");
			DBObject queryObject = new BasicDBObject();
			queryObject.put("username", session.getAttribute("username")
					.toString());
			DBObject updateObject = user.findOne(queryObject);
			updateObject.put("password", password);
			user.findAndModify(queryObject, updateObject);
			message = "您已成功修改密码！";
			return SUCCESS;
		}
	}

}
