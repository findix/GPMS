<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (request.getSession().getAttribute("username") == null) {
		response.sendRedirect("/gpms/jsp");
	}
%>