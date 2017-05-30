<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<c:if test="${'success'==login}">
	<%@ include file="navbarlogin.jsp"%>
</c:if>
<c:if test="${'success'!=login}">
	<c:redirect url = "login.jsp"/>
</c:if>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/signupCss.css" rel="stylesheet">
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
		
	</head>
	<body>
		<div class="container">
		<p>&nbsp</p>
		<p>&nbsp</p>
			<div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="puzzle1 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2 col-xs-3 col-sm-3 col-md-3 col-lg-3">
					<img src="img/signup/darkpuzzle.svg">
					<h3>基本資料</h3>
				</div>
				<div class="puzzle2 col-xs-3 col-sm-3 col-md-3 col-lg-3">
					<img src="img/signup/brightpuzzle.svg">
					<h3>時間價錢</h3>
				</div>
				<div class="puzzle3 col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<img src="img/signup/brightpuzzle.svg">
					<h3>物品照片</h3>
				</div>
			</div>
		
			<div class="row table col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<form class="form-horizontal" role="form" name="form1" id="form1" action="WantedServlet"  method="post">
					<div class="form-group">
						<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">商品名稱</label>
						<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
							<input type="text" class="form-control" id="name" name="name"  placeholder="商品名稱">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">物品狀況</label>
						<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
							<input type="text" class="form-control" id="pwd1" name="other"  placeholder="物品狀況">
						</div>
					</div>
					
					<div class="row submit col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="col-xs-offset-8 col-xs-2">
							<div class="button">
								<input type="hidden" name="owner" value="${accountid}">
								<input type="hidden" name="action" value="insertFirst">
								<input type="submit"  value="提交">
								
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>