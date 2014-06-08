<?xml version="1.0" encoding="UTF-8" ?>
<%@page
	import="com.find1x.gpms.pojos.Teacher,com.find1x.gpms.dao.TeacherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="css/bootstrap-switch.min.css" rel="stylesheet">
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
						<%
							Teacher teacher = TeacherDAO.getTeacherInfo(request
									.getParameter("no"));
						%>
						<form action="DepartmentHeadGroup" method="post">
							<table class="table table-bordered">
								<tr>
									<th>导师</th>
									<th>所在小组</th>
									<th>是否组长</th>
								</tr>
								<tr>
									<td><input type="hidden" name="teacher.no"
										value="<%=teacher.getNo()%>" /><%=teacher.getName()%></td>
									<td><input id="group" name="teacher.group" type="text"
										value="<%=teacher.getGroup() == null ? "" : teacher.getGroup()%>" /></td>
									<td><input data-on-color="success" data-off-color="danger"
										data-on-text="是" data-off-text="否" type="checkbox"
										name="isLeader" value="true" /></td>
									<td align="center"><input class="btn btn-normal"
										value="修改" type="submit" /></td>
								</tr>
							</table>
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
	<script src="js/bootstrap-switch.min.js"></script>
	<script>
		$("[type='checkbox']").bootstrapSwitch();
		$("[name='isLeader']").bootstrapSwitch('state',<%=teacher.isLeader()%>);
	</script>
</body>
</html>