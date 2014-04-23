<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/login.css" rel="stylesheet" media="screen">
<form action=Login method="post" class="form-login">
	<%
		String status = request.getParameter("status");
		if (status != null && status.equals("error")) {
	%>
	<div class="alert alert-danger">用户名或密码错误</div>
	<%
		}
	%>
	<input id="usernameL" name="user.username" type="text"
		class="form-control" placeholder="用户名" autofocus
		onkeydown="if(event.keyCode==13){checkLogin();}" /> <input
		id="passwordL" name="user.password" type="password"
		class="form-control" placeholder="密码"
		onkeydown="if(event.keyCode==13){checkLogin();}" /> <label
		class="checkbox" style="display: none"> <input type="checkbox"
		value="remember-me" /> 记住我
	</label> <br /> <input class="btn btn-lg btn-primary btn-block" type="button"
		onclick="checkLogin()" value="登录" />
</form>
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