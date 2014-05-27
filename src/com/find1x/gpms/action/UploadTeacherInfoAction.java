package com.find1x.gpms.action;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadTeacherInfoAction extends ActionSupport {
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

	private File teacher_info; // 上传的文件
	private String teacher_infoFileName; // 文件名称
	private String teacher_infoContentType; // 文件类型

	@Override
	public String execute() throws Exception {
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/");
		if (teacher_info != null) {
			File savefile = new File(new File(realpath + "\\static\\upload"),
					teacher_infoFileName);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(teacher_info, savefile);
			ActionContext.getContext().put("message", "文件上传成功");
		}
		return SUCCESS;
	}

	public File getTeacher_info() {
		return teacher_info;
	}

	public void setTeacher_info(File teacher_info) {
		this.teacher_info = teacher_info;
	}

	public String getTeacher_infoFileName() {
		return teacher_infoFileName;
	}

	public void setTeacher_infoFileName(String teacher_infoFileName) {
		this.teacher_infoFileName = teacher_infoFileName;
	}

	public String getTeacher_infoContentType() {
		return teacher_infoContentType;
	}

	public void setTeacher_infoContentType(String teacher_infoContentType) {
		this.teacher_infoContentType = teacher_infoContentType;
	}
}
