package com.find1x.gpms.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.apache.struts2.ServletActionContext;

import com.find1x.gpms.dao.SysControlDAO;
import com.find1x.gpms.dao.TeacherDAO;
import com.find1x.gpms.pojos.SysControl;
import com.find1x.gpms.pojos.Teacher;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminSysControlAction extends ActionSupport {

	ActionContext context = ActionContext.getContext();
	HttpServletRequest request = (HttpServletRequest) context
			.get(ServletActionContext.HTTP_REQUEST);
	HttpServletResponse response = (HttpServletResponse) context
			.get(ServletActionContext.HTTP_RESPONSE);
	HttpSession session = request.getSession();

	private static final long serialVersionUID = 1L;

	private String s1;
	private String s2;
	private String s3;
	private String s4;
	private String s5;
	private String s6;
	private String s7;
	private String s8;
	private String s9;
	private String s10;
	private String s11;

	@Override
	public String execute() throws Exception {
		SysControl sysControl = SysControlDAO.GetSysControl();
		;
		sysControl.setS1("true".equals(s1));
		sysControl.setS2("true".equals(s2));
		sysControl.setS3("true".equals(s3));
		sysControl.setS4("true".equals(s4));
		sysControl.setS5("true".equals(s5));
		sysControl.setS6("true".equals(s6));
		sysControl.setS7("true".equals(s7));
		sysControl.setS8("true".equals(s8));
		sysControl.setS9("true".equals(s9));
		sysControl.setS10("true".equals(s10));
		sysControl.setS11("true".equals(s11));
		SysControlDAO.saveSysControl(sysControl);
		return SUCCESS;
	}

	/**
	 * @return the s1
	 */
	public String getS1() {
		return s1;
	}

	/**
	 * @param s1
	 *            the s1 to set
	 */
	public void setS1(String s1) {
		this.s1 = s1;
	}

	/**
	 * @return the s2
	 */
	public String getS2() {
		return s2;
	}

	/**
	 * @param s2
	 *            the s2 to set
	 */
	public void setS2(String s2) {
		this.s2 = s2;
	}

	/**
	 * @return the s3
	 */
	public String getS3() {
		return s3;
	}

	/**
	 * @param s3
	 *            the s3 to set
	 */
	public void setS3(String s3) {
		this.s3 = s3;
	}

	/**
	 * @return the s4
	 */
	public String getS4() {
		return s4;
	}

	/**
	 * @param s4
	 *            the s4 to set
	 */
	public void setS4(String s4) {
		this.s4 = s4;
	}

	/**
	 * @return the s5
	 */
	public String getS5() {
		return s5;
	}

	/**
	 * @param s5
	 *            the s5 to set
	 */
	public void setS5(String s5) {
		this.s5 = s5;
	}

	/**
	 * @return the s6
	 */
	public String getS6() {
		return s6;
	}

	/**
	 * @param s6
	 *            the s6 to set
	 */
	public void setS6(String s6) {
		this.s6 = s6;
	}

	/**
	 * @return the s7
	 */
	public String getS7() {
		return s7;
	}

	/**
	 * @param s7
	 *            the s7 to set
	 */
	public void setS7(String s7) {
		this.s7 = s7;
	}

	/**
	 * @return the s8
	 */
	public String getS8() {
		return s8;
	}

	/**
	 * @param s8
	 *            the s8 to set
	 */
	public void setS8(String s8) {
		this.s8 = s8;
	}

	/**
	 * @return the s9
	 */
	public String getS9() {
		return s9;
	}

	/**
	 * @param s9
	 *            the s9 to set
	 */
	public void setS9(String s9) {
		this.s9 = s9;
	}

	/**
	 * @return the s10
	 */
	public String getS10() {
		return s10;
	}

	/**
	 * @param s10
	 *            the s10 to set
	 */
	public void setS10(String s10) {
		this.s10 = s10;
	}

	/**
	 * @return the s11
	 */
	public String getS11() {
		return s11;
	}

	/**
	 * @param s11
	 *            the s11 to set
	 */
	public void setS11(String s11) {
		this.s11 = s11;
	}
}
