<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="kiben" content="no-cache">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>毕业设计管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<!-- stylesheet -->
	<link href="css/dianfan.css" rel="stylesheet" media="screen" />
	<link href="css/bootstrap.min.css" rel="stylesheet" media="screen" />
	<!-- icon -->
	<!--  link rel="icon" href="httP://www.find1x.com/favicon.ico"
	type="image/x-icon" /-->
	<!-- link rel="shortcut icon" href="http://www.find1x.com/favicon.ico"
	type="image/x-icon" /-->

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
		if (username == "") {
	%>
	<div class="container">
		<div class="jumbotron">
			<h2>欢迎使用毕业设计管理系统</h2>
			<table>
				<tr>
					<td>
						<a class="btn btn-primary btn-large">公告栏</a> <font size=3><p>
								全体本科、高职学生:
								<br>
								本学期考试安排信息现将通过教学管理系统陆续发布，请同学登录到教学管理系统进行查询（信息查询－>考试安排）。 
 						 如有疑问，请咨询所在校区选考中心。
								<br>注：重修班及本学期毕业学生的免听选考课程考试的安排已经通过教学管理系统发布，请相关学生及时查询。</p></font> 
					</td>
					<td>
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</p>
					</td>
					<td>
						<a class="btn btn-primary btn-large">现系统阶段</a>

						<p>毕业设计管理系统还未开放</p>
					</td>
				</tr>
			</table>

		</div>
	</div>
	<%
		} else {
	%>
	<div class="container">
		<div class="row" align="center" style="margin:20px">
			<div class="col-md-4">
				<button type="button" class="btn btn-primary"
					style="width: 200px; height: 200px;" data-toggle="modal"
					data-target="#videoModal">
					<span class="glyphicon glyphicon-user"></span>
					<br />
					<br />
					人脸识别点餐
				</button>
			</div>
			<div class="col-md-4">
				<button type="button" onclick="window.location.href='order'" class="btn btn-default"
					style="width: 200px; height: 200px;" data-toggle="modal">
					<span class="glyphicon glyphicon-log-in"></span>
					<br />
					<br />
					直接点餐
				</button>
			</div>
			<div class="col-md-4">
				<button type="button" onclick="window.location.href='FaceTest'" class="btn btn-success"
					style="width: 200px; height: 200px;" data-toggle="modal">通过照片Url识别</button>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="videoModal" tabindex="-1" role="dialog"
		aria-labelledby="videoModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="videoModalLabel">拍摄一张照片以登录</h4>
				</div>
				<div class="modal-body" align="center">
					<form action="FaceGetter" method="post" id="face">
						<input type="hidden" name="imgData" id="imgData" />
						<div id=wait class="alert alert-info" style="display: none">请稍候……(可能需要较长时间)</div>
						<button id="snap" type="button" class="btn btn-default">拍照并识别</button>
						<script>
							function doSubmit() {
								$("#imgData").attr("value",
										$("#snapimg").attr("src"));
								var form = document.getElementById("face");
								form.submit();
							}
						</script>
					</form>
					<video id="video" width="320" height="240" autoplay></video>
					<canvas id="canvas" width="320" height="240" style="display: none;"></canvas>
					<img id="snapimg" width="320" height="240" style="display: none;"></img>
				<script>
						// Put event listeners into place
						window
								.addEventListener(
										"DOMContentLoaded",
										function() {
											// Grab elements, create settings, etc.
											var info = document
													.querySelector('#info');
											var canvas = document
													.getElementById("canvas"), context = canvas
													.getContext("2d"), video = document
													.getElementById("video"), videoObj = {
												"video" : true
											}, errBack = function(error) {
												console
														.log(
																"Video capture error: ",
																error.code);
											};
											// Put video listeners into place
											if (navigator.getUserMedia) {
												// Standard
												navigator
														.getUserMedia(
																videoObj,
																function(stream) {
																	video.src = stream;
																	video
																			.play();
																	info.innerHTML = '';
																}, errBack);
											} else if (navigator.webkitGetUserMedia) {
												// WebKit-prefixed
												navigator
														.webkitGetUserMedia(
																videoObj,
																function(stream) {
																	video.src = window.webkitURL
																			.createObjectURL(stream);
																	video
																			.play();

																	info.innerHTML = '';
																}, errBack);
											}

											// Trigger photo take
											document
													.getElementById("snap")
													.addEventListener(
															"click",
															function() {
																context
																		.drawImage(
																				video,
																				0,
																				0,
																				320,
																				240);
																var imgData = canvas
																		.toDataURL();
																document
																		.getElementById("snapimg").src = imgData;

																$("#imgData")
																		.attr(
																				"value",
																				$(
																						"#snapimg")
																						.attr(
																								"src"));
																var form = document
																		.getElementById("face");
																$("#snap")
																		.hide();
																$("#wait")
																		.show();
																form.submit();
															});
										}, false);
					</script>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<%
		}
	%></body>
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>