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
				<%-- 在注释之间添加代码 --%>
				<div class="container" style="margin-top: 100px">
					<div class="container" style="max-width: 300px;">
						<%
							if (request.getParameter("status") != null
									&& request.getParameter("status").equals("error")) {
						%>
						<div class="alert alert-danger">用户名或密码错误</div>
						<%
							}
						%>
						<div class="panel panel-warning">
							<div class="panel-heading">修改密码</div>
							<div class="panel-body">
								<form action="ChangePasswd" method="post" class="form-signup">
									<input id="passwordS" name="oldPassword" type="password"
										class="form-control" placeholder="原密码" autofocus
										onkeydown="if(event.keyCode==13){checkChangePasswd();}" /><br />
									<input id="newPassword" name="password" type="password"
										class="form-control" placeholder="新的密码"
										onkeydown="if(event.keyCode==13){checkChangePasswd();}" /><br />
									<input id="reNewPasswordS" type="password" class="form-control"
										placeholder="请再输一遍您的新密码"
										onkeydown="if(event.keyCode==13){checkChangePasswd();}" /><br />
									<input class="btn btn-lg btn-primary btn-block" type="button"
										onclick="checkChangePasswd()" value="修改密码" />
								</form>
							</div>
						</div>
					</div>
				</div>
				<script>
					function checkChangePasswd() {
						with (document.all) {
							if (passwordS.value == ""
									|| newPassword.value == ""
									|| reNewPasswordS == "") {
								alert("对不起，密码不能为空，请重新输入。");
							} else if (newPassword.value != reNewPasswordS.value) {
								alert("对不起，您两次输入的密码不一致，请重新输入。");
								newPassword.value = "";
								reNewPasswordS.value = "";
							} else
								document.forms[0].submit();
						}
					}
				</script>
				<%-----------------%>
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