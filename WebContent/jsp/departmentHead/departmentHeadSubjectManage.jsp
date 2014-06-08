<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
						<table class="table table-bordered" style="text-align: center">
							<tr>
								<td>题目名称</td>
								<td>题目简介</td>
								<td>面向专业</td>
								<td colspan="2">其他</td>
							</tr>
							<s:iterator value="#request.issues" var="subject">
								<tr>
									<td>${subject.title}</td>
									<td>${subject.info}</td>
									<td>${subject.specialty}</td>
									<td><button type="button" class="btn btn-success"
											onclick='changeSubject("${subject._id}")'>修改</button></td>
									<td><button type="button" class="btn btn-danger"
											onclick='deleteSubject("${subject._id}")'>删除</button></td>
								</tr>
							</s:iterator>
						</table>
						<script>
							function changeSubject(_id) {
								window.location.href = ('teacherChangeSubject?_id='
										+ _id + '');
							}
							function deleteSubject(_id) {
								window.location.href = ('DeleteIssue?_id='
										+ _id + '');
							}
						</script>
						<div class="submit">
							<button type="button" class="btn btn-success"
								onclick="window.location='teacherSubject'">继续添加</button>
						</div>
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