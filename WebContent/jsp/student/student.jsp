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
<link href="css/login.css" rel="stylesheet">
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
	<!-- nav -->
	<%@ include file="../nav.jsp"%>
	<div class="container bs-docs-container">
		<div class="row">
			<div class="col-md-3">
				<%@ include file="side.jsp"%></div>
			<div class="col-md-9 jumbotron" role="main">


				<div class="page-header">
					<h1 id="download">下载Bootstrap</h1>
				</div>
				<p class="lead">
					Bootstrap提供了几种可以帮你快速上手的方式，每种方式针对具有不同技能等级的开发者和不同的使用场景。继续阅读下面的内容，看看哪种方式适合你的需求吧。
				</p>

				<h3 id="download-compiled">编译后的CSS、JS和字体文件</h3>
				<p>
					获取Bootstrap最快速的方式就是下载经过编译和压缩的CSS、JavaScript文件，另外还包含字体文件。但是不包含文档和源码文件。
				</p>
				<p>
					<a class="btn btn-lg btn-primary"
						href="https://github.com/twbs/bootstrap/releases/download/v3.0.3/bootstrap-3.0.3-dist.zip">下载Bootstrap</a>
				</p>

				<h3 id="download-additional">额外的下载渠道</h3>
				<div class="bs-docs-dl-options">
					<h4>
						<a href="https://github.com/twbs/bootstrap/archive/v3.0.3.zip">下载源码</a>
					</h4>
					<p>从GitHub可以直接下载到Bootstrap最新版本的LESS和JavaScript源码。</p>
					<h4>
						<a href="https://github.com/twbs/bootstrap">Clone or fork via
							GitHub</a>
					</h4>
					<p>访问我们的Github源码库，你可以克隆整个项目，或者fork整个项目到你自己的账号。</p>
					<h4>
						通过 <a href="http://bower.io">Bower</a> 工具安装
					</h4>
					<p>
						通过 <a href="http://bower.io">Bower</a>
						可以安装并管理Bootstrap的样式、JavaScript文件和文档。
					</p>
					<div class="highlight">
						<p>
							<code>bash$ bower install bootstrap</code>
						</p>

					</div>
				</div>
				<h3 id="download-cdn">使用Bootstrap中文网提供的CDN加速服务</h3>
				<p>
					<a href="http://www.bootcss.com/">Bootstrap中文网</a>为Bootstrap构建了自己的CDN加速服务，并且采用国内云厂商的CDN服务，访问速度更快、加速效果更明显、没有速度和带宽限制、永久免费。Bootstrap中文网还对大量的开源工具库提供了CDN服务，请进入<a
						href="http://open.bootcss.com/">Open CDN 主页</a>查看更多可用的工具库。
				</p>
				<div class="highlight">
					<pre>
						<code class="language-html xml">
							<span class="comment">&lt;!-- 最新 Bootstrap 核心 CSS 文件 --&gt;</span>
<span class="tag">&lt;<span class="title">link</span> <span
								class="attribute">rel</span>=<span class="value">"stylesheet"</span> <span
								class="attribute">href</span>=<span class="value">"http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css"</span>&gt;</span>

<span class="comment">&lt;!-- 可选的Bootstrap主题文件（一般不用引入） --&gt;</span>
<span class="tag">&lt;<span class="title">link</span> <span
								class="attribute">rel</span>=<span class="value">"stylesheet"</span> <span
								class="attribute">href</span>=<span class="value">"http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css"</span>&gt;</span>

<span class="comment">&lt;!-- jQuery文件。务必在bootstrap.min.js 之前引入 --&gt;</span>
<span class="tag">&lt;<span class="title">script</span> <span
								class="attribute">src</span>=<span class="value">"http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"</span>&gt;</span><span
								class="javascript"></span><span class="tag">&lt;/<span
								class="title">script</span>&gt;</span>

<span class="comment">&lt;!-- 最新的 Bootstrap 核心 JavaScript 文件 --&gt;</span>
<span class="tag">&lt;<span class="title">script</span> <span
								class="attribute">src</span>=<span class="value">"http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"</span>&gt;</span><span
								class="javascript"></span><span class="tag">&lt;/<span
								class="title">script</span>&gt;</span>
						</code>
					</pre>

				</div>

			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/application.js"></script>
</body>
</html>