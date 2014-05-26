<?xml version="1.0" encoding="UTF-8" ?>
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
					<!-- 	<table class="table table-bordered">
						<tr><td>工号</td><td></td><td>姓名</td><td></td></tr>
						<tr><td>学院</td><td></td><td>职务</td><td></td></tr>
						<tr><td>性别</td><td></td><td>联系电话</td><td></td></tr>
						<tr><td>邮箱</td><td colspan="3"></td></tr>					
						</table>
						-->	
				
					<form action="#" method="post">
					<div class="col-xs-4">
					工号：<input type="text" class="form-control" name="tno"/><br/>					 
					姓名 ：<input type="text" class="form-control"  name="name" /><br/>
					学院：<select><option selected="selected">计算机科学与技术学院</option><option>电子与信息工程学院</option><option>电气工程学院</option><option>自动化工程学院</option></select><br/><br/>
					职务：<select><option selected="selected">教师</option><option>系主任</option></select><br/><br/>
					性别：<select><option selected="selected">男</option><option>女</option></select><br/><br/>
					联系电话：<input type="text" class="form-control" name="tel" /><br/>
					邮箱：<input type="text" class="form-control" name="mail" /><br/>
					<input type="submit" value="确定">
					</div>
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