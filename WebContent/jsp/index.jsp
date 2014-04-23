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

			<%-- header导航条--%>
			<%@ include file="/jsp/nav.jsp"%>

			<div class="container bs-docs-container">
				<div class="row">
					<div class="col-md-3">
						<div class="container">
							<%@ include file="login.jsp"%>
						</div>
					</div>
					<div class="col-md-9" id="content">
						<%-- 在注释之间添加代码 --%>
						<%
							if (session.getAttribute("username") == null) {
						%>
						<div class="jumbotron">
							<div class="well">
								<h2>欢迎使用毕业设计管理系统!</h2>
							</div>
							<a class="btn btn-primary btn-large">公告栏</a>
							<p>
								全体本科、高职学生: <br />
								本学期考试安排信息现将通过教学管理系统陆续发布，请同学登录到教学管理系统进行查询（信息查询－>考试安排）。
								如有疑问，请咨询所在校区选考中心。
								注：重修班及本学期毕业学生的免听选考课程考试的安排已经通过教学管理系统发布，请相关学生及时查询。 <br />
							</p>
						</div>
						<%
							} else {
								if (session.getAttribute("type") != null
										&& session.getAttribute("type").toString().equals("0")) {
									response.sendRedirect("/gpms/student");
								} else {
									response.sendRedirect("/gpms/teacher");
								}
							}
						%>
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