<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="com.find1x.gpms.dao.SysControlDAO"%>
<%@page import="com.find1x.gpms.pojos.SysControl"%>
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
							SysControl sysControl = SysControlDAO.GetSysControl();
						%>
						<form method="post" action="AdminSysControl">
							<table class="table table-bordered" style="text-align: center">
								<tr>
									<td>阶段</td>
									<td>操作</td>
								</tr>
								<tr>
									<td>题目上传</td>
									<td><input name="s1" value="true" data-on-color="success"
										data-off-color="danger" data-on-text="开放" data-off-text="关闭"
										type="checkbox" /></td>
								</tr>
								<tr>
									<td>题目审查</td>
									<td><input name="s2" value="true" data-on-color="success"
										data-off-color="danger" data-on-text="开放" data-off-text="关闭"
										type="checkbox" /></td>
								</tr>
								<tr>
									<td>第一次选题</td>
									<td><input name="s3" value="true" data-on-color="success"
										data-off-color="danger" data-on-text="开放" data-off-text="关闭"
										type="checkbox" /></td>
								</tr>
								<tr>
									<td>第一次分配题目</td>
									<td><input name="s4" value="true" data-on-color="success"
										data-off-color="danger" data-on-text="开放" data-off-text="关闭"
										type="checkbox" /></td>
								</tr>
								<tr>
									<td>第二次选题</td>
									<td><input name="s5" value="true" data-on-color="success"
										data-off-color="danger" data-on-text="开放" data-off-text="关闭"
										type="checkbox" /></td>
								</tr>
								<tr>
									<td>第二次分配题目</td>
									<td><input name="s6" value="true" data-on-color="success"
										data-off-color="danger" data-on-text="开放" data-off-text="关闭"
										type="checkbox" /></td>
								</tr>
								<tr>
									<td>确定所有题目</td>
									<td><input name="s7" value="true" data-on-color="success"
										data-off-color="danger" data-on-text="开放" data-off-text="关闭"
										type="checkbox" /></td>
								</tr>
								<tr>
									<td>教师分组</td>
									<td><input name="s8" value="true" data-on-color="success"
										data-off-color="danger" data-on-text="开放" data-off-text="关闭"
										type="checkbox" /></td>
								</tr>
								<tr>
									<td>初评阶段</td>
									<td><input name="s9" value="true" data-on-color="success"
										data-off-color="danger" data-on-text="开放" data-off-text="关闭"
										type="checkbox" /></td>
								</tr>
								<tr>
									<td>评阅阶段</td>
									<td><input name="s10" value="true" data-on-color="success"
										data-off-color="danger" data-on-text="开放" data-off-text="关闭"
										type="checkbox" /></td>
								</tr>
								<tr>
									<td>答辩阶段</td>
									<td><input name="s11" value="true" data-on-color="success"
										data-off-color="danger" data-on-text="开放" data-off-text="关闭"
										type="checkbox" /></td>
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
		$("[name='s1']").bootstrapSwitch('state',<%=sysControl.isS1()%>);
		$("[name='s2']").bootstrapSwitch('state',<%=sysControl.isS2()%>);
		$("[name='s3']").bootstrapSwitch('state',<%=sysControl.isS3()%>);
		$("[name='s4']").bootstrapSwitch('state',<%=sysControl.isS4()%>);
		$("[name='s5']").bootstrapSwitch('state',<%=sysControl.isS5()%>);
		$("[name='s6']").bootstrapSwitch('state',<%=sysControl.isS6()%>);
		$("[name='s7']").bootstrapSwitch('state',<%=sysControl.isS7()%>);
		$("[name='s8']").bootstrapSwitch('state',<%=sysControl.isS8()%>);
		$("[name='s9']").bootstrapSwitch('state',<%=sysControl.isS9()%>);
		$("[name='s10']").bootstrapSwitch('state',<%=sysControl.isS10()%>);
		$("[name='s11']").bootstrapSwitch('state',<%=sysControl.isS11()%>);
		$("[type='checkbox']").on('switchChange.bootstrapSwitch',
				function(event, state) {
					$("form").submit();
				});
	</script>
</body>
</html>