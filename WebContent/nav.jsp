<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">上海电力学院毕业设计管理系统</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/gpms/">首页</a></li>
				<% if (username.equals("")) { %>
				<li><a href="login">登录</a></li>
				<% } else { %>
				<li><a href='changePasswd?status=normal'> 欢迎您, <%=username%></a>
				</li>
				<li><a class="btn btn-normal" href="myOrderList">查看论文</a></li>
				<li><a href="logout">退出</a></li>
				<% } %>
			</ul>
			<% if (username.equals( "admin")){ %>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="manage" id="admin">论文管理</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="orderList" id="admin">学生管理</a></li>
			</ul>
			<% } %>
		</div>
	</div>
</nav>