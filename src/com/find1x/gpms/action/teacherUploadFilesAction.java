package com.find1x.gpms.action;

import java.io.File;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.find1x.gpms.dao.ExcelPOI;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class teacherUploadFilesAction extends ActionSupport {

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

	private static final long serialVersionUID = 1L;

	private String name;
	private File issueFile; // 上传的文件
	private String issueFileFileName; // 文件名称
	private String issueFileContentType; // 文件类型

	@Override
	public String execute() throws Exception {
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/");
		if (issueFile != null) {
			File savefile = new File(new File(realpath + "\\static\\file"),
					name+".doc");
			System.out.println(savefile.getAbsolutePath());
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(issueFile, savefile);
			ActionContext.getContext().put("message", "文件上传成功");
		}
		return SUCCESS;
	}

	public File getIssueFile() {
		return issueFile;
	}

	public void setIssueFile(File issueFile) {
		this.issueFile = issueFile;
	}

	public String getIssueFileFileName() {
		return issueFileFileName;
	}

	public void setIssueFileFileName(String issueFileFileName) {
		this.issueFileFileName = issueFileFileName;
	}

	public String getIssueFileContentType() {
		return issueFileContentType;
	}

	public void setIssueFileContentType(String issueFileContentType) {
		this.issueFileContentType = issueFileContentType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
