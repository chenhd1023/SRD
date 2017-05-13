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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Sign up</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/signupCss.css" rel="stylesheet">
		<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
		<script type="text/javascript">
			function checkName(){
				var name = document.getElementById("name").value;
				if (name=="") {
					document.getElementById("namemsg").innerHTML = "請輸入姓名!";
					document.form1.Name.focus();
					return false;
				}else{
					document.getElementById("namemsg").innerHTML = "";
				}
			}

			function checkEmail(){
				var email = document.getElementById("email").value;
				if (email=="") {
					document.getElementById("emailmsg").innerHTML = "請輸入信箱!";
					document.form1.Email.focus();
					return false;
				}else{
					document.getElementById("emailmsg").innerHTML = "";
				}
			}

			function checkpwd1(){
				var pwd = document.getElementById("pwd1").value;
				if(pwd==""){
					document.getElementById("pwd1msg").innerHTML = "請輸入密碼!";
					document.form1.pwd1.focus();
					return false;
				}else{
					document.getElementById("pwd1msg").innerHTML = "";
				}
			}

			function checkpwd2(){
				var p1 = document.getElementById("pwd1").value;
				var p2 = document.getElementById("pwd2").value;
				if(p1!=p2){
					document.getElementById("pwd2msg").innerHTML = "兩次密碼輸入不同，請重新輸入!";
					return false;
				}else{
					document.getElementById("pwd2msg").innerHTML = "";
				}
			}

			function checkPhone(){
				var phone = document.getElementById("phone").value;
				var re = /^[09]{2}[0-9]{8}$/;
				if(phone==""){
					document.getElementById("phonemsg").innerHTML = "請輸入手機號碼!";
					document.form1.Phone.focus();
					return false;
				}if(!re.test(phone)){
					document.getElementById("phonemsg").innerHTML = "手機格式不正確，請重新輸入!";
					document.form1.Phone.focus();
					return false;
				}else{
					document.getElementById("phonemsg").innerHTML = "";
				}
			}
			function submit(){
				document.getElementById("form1").submit();
			}
		</script>
	</head>
	<body>
		<div class="container">
			<div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="puzzle1 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2 col-xs-3 col-sm-3 col-md-3 col-lg-3">
					<img src="img/signup/darkpuzzle.svg">
					<h3>註冊</h3>
				</div>
				<div class="puzzle2 col-xs-3 col-sm-3 col-md-3 col-lg-3">
					<img src="img/signup/brightpuzzle.svg">
					<h3>認證</h3>
				</div>
				<div class="puzzle3 col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<img src="img/signup/brightpuzzle.svg">
					<h3>完成</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-offset-2 col-xs-3 connectfb">
					<a href=""><img src="img/signup/facebook.png"></a>
				</div>
				<div class="col-xs-offset-1 col-xs-3 connectgoogle">
					<a href=""><img src="img/signup/google.png"></a>
				</div>
			</div>
			<div class="row table col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<form class="form-horizontal" role="form" name="form1" id="form1" action="AccountServlet"  method="post">
					<div class="form-group">
						<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">真實姓名</label>
						<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
							<input type="text" class="form-control" id="name" name="name" onblur="checkName()" placeholder="真實姓名">
						</div>
						<div class="col-xs-2" id="namemsg" style="color:red"></div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">學校信箱</label>
						<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
							<input type="email" class="form-control" id="email" name="schoolmail" onblur="checkEmail()" placeholder="學校信箱">
						</div>
						<div class="col-xs-2" id="emailmsg" style="color:red"></div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">ID</label>
						<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
							<input type="text" class="form-control" placeholder="ID" name="accountid">
						</div>
						<div class="col-xs-2">
							<button>驗證</button>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">密碼</label>
						<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
							<input type="password" class="form-control" id="pwd1" name="accountpassword" onblur="checkpwd1()" placeholder="密碼">
						</div>
						<div class="col-xs-2" id="pwd1msg" style="color:red"></div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">確認密碼</label>
						<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
							<input type="password" class="form-control" id="pwd2" name="pwd2" onblur="checkpwd2()" placeholder="確認密碼">
						</div>
						<div class="col-xs-2" id="pwd2msg" style="color:red"></div>
					</div>
					<div class="form-group">
						<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">手機</label>
						<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
							<input type="text" class="form-control" id="phone" name="cellphone" onblur="checkPhone()" placeholder="手機">
						</div>
						<div class="col-xs-2" id="phonemsg" style="color:red"></div>
					</div>
					<div class="row submit col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="col-xs-offset-8 col-xs-2">
							<div class="button">
								<input type="hidden" name="action" value="insert">
								<input type="submit"  value="提交">
								
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>