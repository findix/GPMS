<?xml version="1.0" encoding="UTF-8" ?>
<%@page
	import="com.find1x.gpms.dao.IssueDAO,com.find1x.gpms.pojos.Issue,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
						<%
							List<Issue> list = IssueDAO.getList();
																			request.setAttribute("subject",list);
						%>
						<form action="SelectIssue" method="post" role="form">
							<table id="selectSuject" class="table table-bordered">
								<tr>

									<th>第一志愿</th>
									<th><select id="firstChoice" name="firstChoice">
											<%
												for (Issue i : list) {
											%>
											<option><%=i.getTitle()%></option>
											<%
												}
											%>
									</select></th>
									<th>第二志愿</th>
									<th><select id="secondChoice" name="secondChoice">
											<%
												for (Issue i : list) {
											%>
											<option><%=i.getTitle()%></option>
											<%
												}
											%>
									</select></th>
									<th>第三志愿</th>
									<th><select id="thirdChoice" name="thirdChoice">
											<%
												for (Issue i : list) {
											%>
											<option><%=i.getTitle()%></option>
											<%
												}
											%>
									</select></th>
								</tr>
								<tr>
									<td>题目简介：</td>
									<td></td>
									<td>题目简介：</td>
									<td></td>
									<td>题目简介：</td>
									<td></td>
								</tr>
								<tr>
									<td>题目要求：</td>
									<td></td>
									<td>题目要求：</td>
									<td></td>
									<td>题目要求：</td>
									<td></td>
								</tr>
								<tr>
									<td>面向专业：</td>
									<td></td>
									<td>面向专业：</td>
									<td></td>
									<td>面向专业：</td>
									<td></td>
								</tr>
								<tr>
									<td>可选人数：</td>
									<td></td>
									<td>可选人数：</td>
									<td></td>
									<td>可选人数：</td>
									<td></td>
								</tr>
								<tr>
									<td>指导老师：</td>
									<td></td>
									<td>指导老师：</td>
									<td></td>
									<td>指导老师：</td>
									<td></td>
								</tr>
							</table>
							<div class="submit">
								<input type="submit" value="提交" />
							</div>
						</form>
						<script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
						<script type="text/javascript">
							$(function() {
								$("#firstChoice").change(function() {
									//$("#firstChoice").value()
									$.post("IssueInfo",$("#firstChoice").serialize(),
											function(data) {
												//document.getElementById("selectSuject").rows[1].cells[1].innerHTML = data.title;
												document.getElementById("selectSuject").rows[1].cells[1].innerHTML = data.info;
												document.getElementById("selectSuject").rows[2].cells[1].innerHTML = data.requirement;
												document.getElementById("selectSuject").rows[3].cells[1].innerHTML = data.specialty;
												document.getElementById("selectSuject").rows[4].cells[1].innerHTML = data.total;
												document.getElementById("selectSuject").rows[5].cells[1].innerHTML = data.teacher;
									},"json");
								});
							});
							$(function() {
								$("#secondChoice").change(function() {
									//$("#firstChoice").value()
									$.post("IssueInfo",$("#secondChoice").serialize(),
											function(data) {
												//document.getElementById("selectSuject").rows[1].cells[1].innerHTML = data.title;
												document.getElementById("selectSuject").rows[1].cells[3].innerHTML = data.info;
												document.getElementById("selectSuject").rows[2].cells[3].innerHTML = data.requirement;
												document.getElementById("selectSuject").rows[3].cells[3].innerHTML = data.specialty;
												document.getElementById("selectSuject").rows[4].cells[3].innerHTML = data.total;
												document.getElementById("selectSuject").rows[5].cells[3].innerHTML = data.teacher;
									},"json");
								});
							});
							$(function() {
								$("#thirdChoice").change(function() {
									//$("#firstChoice").value()
									$.post("IssueInfo",$("#thirdChoice").serialize(),
											function(data) {
												//document.getElementById("selectSuject").rows[1].cells[1].innerHTML = data.title;
												document.getElementById("selectSuject").rows[1].cells[5].innerHTML = data.info;
												document.getElementById("selectSuject").rows[2].cells[5].innerHTML = data.requirement;
												document.getElementById("selectSuject").rows[3].cells[5].innerHTML = data.specialty;
												document.getElementById("selectSuject").rows[4].cells[5].innerHTML = data.total;
												document.getElementById("selectSuject").rows[5].cells[5].innerHTML = data.teacher;
									},"json");
								});
							});
						</script>
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