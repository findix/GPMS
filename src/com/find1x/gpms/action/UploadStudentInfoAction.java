package com.find1x.gpms.action;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadStudentInfoAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6439953799272677115L;

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

	private File student_info; // 上传的文件
	private String student_infoFileName; // 文件名称
	private String student_infoContentType; // 文件类型

	@Override
	public String execute() throws Exception {
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/");
		if (student_info != null) {
			File savefile = new File(new File(realpath + "\\static\\upload"),
					student_infoFileName);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(student_info, savefile);
			ActionContext.getContext().put("message", "文件上传成功");
		}
		return SUCCESS;
	}

	public File getStudent_info() {
		return student_info;
	}

	public void setStudent_info(File student_infoFile) {
		this.student_info = student_infoFile;
	}

	public String getStudent_infoFileName() {
		return student_infoFileName;
	}

	public void setStudent_infoFileName(String student_infoFileName) {
		this.student_infoFileName = student_infoFileName;
	}

	public String getStudent_infoContentType() {
		return student_infoContentType;
	}

	public void setStudent_infoContentType(String student_infoContentType) {
		this.student_infoContentType = student_infoContentType;
	}

}
