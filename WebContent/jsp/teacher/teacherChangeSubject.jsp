<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Expires" content="0">
<meta http-equiv="kiben" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>毕业设计管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%
	// stylesheet
%>
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/main.css" rel="stylesheet" media="screen">
<%
	// icon
%>
<link rel="icon" href="image/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="image/favicon.ico" type="image/x-icon" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="../../assets/js/html5shiv.js"></script>
	<script src="../../assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<div id="wrap">
		<div id="main" class="clearfix">
			<%-- 此行控制是否该页面未登录无法访问 --%>  
		<%@ include file="/jsp/authentication.jsp"%>

			<%-- header导航条--%>
			<%@ include file="/jsp/nav.jsp"%>

			<div class="container bs-docs-container">
				<div class="row">
					<div class="col-md-3" id="side">
						<%--导入侧边栏 --%>
						<%@ include file="side.jsp"%></div>
					<div class="col-md-9" id="content">
						<%-- 在注释之间添加代码 --%>
						<form action="ChangeIssue" method="post">
						题目编号:<input type="text" class="form-control" name="_id" value="${issue._id}" readonly="readonly" /><br/><br/>
						题目名称:<input type="text" class="form-control" name="issue.title" value="${issue.title}" /><br/><br/>
						题目简介:<br/><TEXTAREA name="issue.info" class="form-control" rows="3">${issue.info}</TEXTAREA><br/>
						题目要求:<br/><TEXTAREA name="issue.requirement" class="form-control" rows="5">${issue.requirement}</TEXTAREA><br/><br/>
						面向专业:&nbsp;
						<select name="issue.specialty">
						<s:if test="#request.issue.specialty=='软件工程'">
							<option selected="selected">软件工程</option>
							<option>信息安全</option>
							<option>计算机科学与技术</option>
						</s:if>
						<s:if test="#request.issue.specialty=='信息安全'">
							<option>软件工程</option>
							<option selected="selected">信息安全</option>
							<option>计算机科学与技术</option>
						</s:if>
						<s:if test="#request.issue.specialty=='计算机科学与技术'">
							<option>软件工程</option>
							<option>信息安全</option>
							<option selected="selected">计算机科学与技术</option>
						</s:if>
						</select><br/><br/>
						可选人数：<input type="text" name="issue.total" value="${issue.total}" />  <br/>
						<div class="submit"><input type="submit" value="修改" />	</div>
						</form>
						<%-----------------%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%--页脚版权信息 --%>
	<%@ include file="/jsp/footer.jsp"%>
	<%--js脚本 --%>
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>