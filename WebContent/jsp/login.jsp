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
<link href="css/main.css" rel="stylesheet" media="screen">
<link href="css/login.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<%
	// icon
%>
<link rel="icon" href="httP://www.find1x.com/favicon.ico"
	type="image/x-icon" />
<link rel="shortcut icon" href="http://www.find1x.com/favicon.ico"
	type="image/x-icon" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	<script src="../../assets/js/html5shiv.js"></script>
	<script src="../../assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<%
		String username = "";
		if (session.getAttribute("username") != null) {
			username = session.getAttribute("username").toString();
		}
	%>
	<!-- nav -->
	<%@ include file="nav.jsp"%>
	<%
		//如果已经登录则自动跳转到首页
		if (request.getSession().getAttribute("username") != null) {
			response.sendRedirect("/gpms/");
		}
	%>

	<div class="container" align="center">
			<div id="legend" class="">
				<legend>欢迎登录毕业设计管理系统</legend>
			</div>
			<%
				String status = request.getParameter("status");
				if (status != null && status.equals("error")) {
			%>
			<div class="alert alert-danger" style="max-width: 300px;">用户名或密码错误</div>
			<%
				}
			%>
		
	</div>
	<div class="container" id="login">

		<form action=Login method="post" class="form-login">
			<input id="usernameL" name="user.username" type="text"
				class="form-control" placeholder="用户名" autofocus
				onkeydown="if(event.keyCode==13){checkLogin();}" /> <input
				id="passwordL" name="user.password" type="password"
				class="form-control" placeholder="密码"
				onkeydown="if(event.keyCode==13){checkLogin();}" /> <label
				class="checkbox" style="display: none"> <input
				type="checkbox" value="remember-me" /> 记住我
			</label> <br /> <input class="btn btn-lg btn-primary btn-block"
				type="button" onclick="checkLogin()" value="登录" />
		</form>
	</div>
	<script>
		function checkLogin() {
			with (document.all) {
				if (usernameL.value == "" || passwordL.value == "") {
					alert("对不起，用户名和密码不能为空，请重新输入。");
				} else
					document.forms[0].submit();
			}
		}
	</script>
	<script>
		function checkSignUp() {
			with (document.all) {
				if (usernameS.value == "" || passwordS.value == ""
						|| repasswordS == "") {
					alert("对不起，用户名和密码不能为空，请重新输入。");
				} else if (passwordS.value != repasswordS.value) {
					alert("对不起，您两次输入的密码不一致，请重新输入。");
					passwordS.value = "";
					repasswordS.value = "";
				} else
					document.forms[1].submit();
			}
		}
	</script>
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>