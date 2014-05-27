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
						<!--  		<select class="form-control">
							<option>题目1</option>
							<option>题目2</option>
							<option>题目3</option>
							<option>题目4</option>
							<option>题目5</option>
						</select> 
						<select class="form-control">
							<option>题目1</option>
							<option>题目2</option>
							<option>题目3</option>
							<option>题目4</option>
							<option>题目5</option>
						</select> 
						<select class="form-control">
							<option>题目1</option>
							<option>题目2</option>
							<option>题目3</option>
							<option>题目4</option>
							<option>题目5</option>
						</select>  -->
						<table class="table table-bordered">
							<tr>
								<th>题目名称</th>
								<th>第一志愿</th>
								<th>第二志愿</th> 	
								<th>第三志愿</th>
							</tr>
							<tr>
								<td>题目1</td>
								<td><input type="radio" name="subject1" /></td>
								<td><input type="radio" name="subject2" /></td>
								<td><input type="radio" name="subject3" /></td>
							</tr>
							<tr>
								<td>题目2</td>
								<td><input type="radio" name="subject1" /></td>
								<td><input type="radio" name="subject2" /></td>
								<td><input type="radio" name="subject3" /></td>
							</tr>
							<tr>
								<td>题目3</td>
								<td><input type="radio" name="subject1" /></td>
								<td><input type="radio" name="subject2" /></td>
								<td><input type="radio" name="subject3" /></td>
							</tr>
							<tr>
								<td>题目4</td>
								<td><input type="radio" name="subject1" /></td>
								<td><input type="radio" name="subject2" /></td>
								<td><input type="radio" name="subject3" /></td>
							</tr>
							<tr>
								<td>题目5</td>
								<td><input type="radio" name="subject1" /></td>
								<td><input type="radio" name="subject2" /></td>
								<td><input type="radio" name="subject3" /></td>
							</tr>
						</table>

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