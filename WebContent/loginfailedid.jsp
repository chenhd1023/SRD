<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<c:if test="${'success'==login}">
	<%@ include file="navbarlogin.jsp"%>
</c:if>
<c:if test="${'success'!=login}">
	<%@ include file="navbarlogout.jsp"%>
</c:if>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Login</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/loginfailedidCss.css" rel="stylesheet">
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
	</head>
	<body>
		<div class="container">
			<div class="img">
				<img src="img/login/loginfailed.svg">
			</div>
			<div class="error">
				<h3>哎呀~找不到這個帳號或密碼錯誤呢(๑・v・๑)</h3>
			</div>
			<form class="form-horizontal" role="form" action="AccountServlet">
			<div class="row table col-xs-12">
					<div class="form-group">
						<label class="col-xs-offset-1 col-xs-2 control-label">ID</label>
						<div class="col-xs-6">
							<input type="text" class="form-control" name="accountid" placeholder="ID">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-offset-1 col-xs-2 control-label">Password</label>
						<div class="col-xs-6">
							<input type="password" class="form-control" id="inputPassword3" name="accountpassword" placeholder="Password">
						</div>
						<div class="col-xs-3">
							<a href="">忘記密碼了?</a>
						</div>
					</div>
				
			</div>
			<div class="row submit col-xs-12">
				<div class="signup col-xs-offset-6 col-xs-2">
					<a href="signup.html"><h3>還沒註冊嗎?</h3></a>
				</div>
				<div class="col-xs-2">
					<div class="button">
						<input type="hidden" name="action" value="login">
						<input type="submit"  value="登入">
					</div>
				</div>
			</div>
			</form>
		</div>
	</body>
</html>