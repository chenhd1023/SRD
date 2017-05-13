<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${'success'==login}">
	<%@ include file="navbarlogin.jsp"%>
</c:if>
<c:if test="${'success'!=login}">
	<%@ include file="navbarlogout.jsp"%>
</c:if>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>setting</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/settingCss.css" rel="stylesheet">
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row table col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<form class="form-horizontal" role="form" name="form1">
				<div class="form-group">
					<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">更改密碼</label>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<input type="password" class="form-control" placeholder="輸入舊密碼">
					</div>
					<div class="col-xs-offset-2 col-xs-8 col-sm-8 col-md-8 col-lg-8"
						id="password">
						<input type="password" class="form-control" name="pwd1"
							onblur="checkpwd1()" placeholder="輸入新密碼">
						<div class="col-xs-2" id="pwd1msg" style="color: red"></div>
					</div>
					<div class="col-xs-offset-2 col-xs-8 col-sm-8 col-md-8 col-lg-8"
						id="password">
						<input type="password" class="form-control" name="pwd2"
							onblur="checkpwd2()" placeholder="確認新密碼">
					</div>
					<div class="col-xs-2" id="pwd2msg" style="color: red"></div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">新增電話</label>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<input type="text" class="form-control" name="Phone"
							onblur="checkPhone()" placeholder="手機">
					</div>
					<div class="col-xs-2" id="phonemsg" style="color: red"></div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">新增大頭貼</label>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<form>
							<input type='file' class="upl">
							<div>
								<img class="preview"
									style="max-width: 150px; max-height: 150px;">
								<div class="size"></div>
							</div>
							<div class="row submit col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div
									class="col-xs-offset-7 col-sm-offset-7 col-md-offset-7 col-lg-offset-7 col-xs-2 col-sm-2 col-md-2 col-lg-2">
									<img src="img/signup/signupicon.svg">
								</div>
								<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
									<div class="button">
										<a href=""><h3>提交</h3></a>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="js/settingJs.js"></script>
</html>