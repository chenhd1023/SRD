<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${'success'==login}">
	<%@ include file="navbarlogin.jsp"%>
</c:if>
<c:if test="${'success'!=login}">
	<%@ include file="navbarlogout.jsp"%>
</c:if>
<%@ page import="com.srd.vo.ProductVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>wanted</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/wantedCss.css" rel="stylesheet">
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
</head>
<body>
	<div class="header col-xs-12">
		<div class="col-xs-3">
		<img src="img/wanted/wantedicon.svg" alt="">
		</div>
		<div class="col-xs-6">
			<a href="">現正懸賞</a><a href="wantedsuccess.html">懸賞成功</a><a href="wantedfail.html">懸賞失敗</a>
		</div>
		<div class="col-xs-3">
			<button onclick="window.location.href='wantedassign1.jsp'"><img src="img/wanted/wantedassignicon.svg" alt="">我要懸賞</button>
		</div>
	</div>
	<div class="mainpart col-xs-12">
		<div class="col-xs-3 items">
			<div class="item">
				<p>PS4</p>
				<img src="img/wanted/ps4(3).jpg" alt="">
				<p>1500元</p>
				<a href="">出價</a>			
			</div>
		</div>
		<div class="col-xs-3 items">
			<div class="item">
				<p>PS4</p>
				<img src="img/wanted/ps4(3).jpg" alt="">
				<p>1500元</p>
				<a href="">出價</a>			
			</div>
		</div>
		<div class="col-xs-3 items">
			<div class="item">
				<p>PS4</p>
				<img src="img/wanted/ps4(3).jpg" alt="">
				<p>1500元</p>
				<a href="">出價</a>			
			</div>
		</div>
		<div class="col-xs-3 items">
			<div class="item">
				<p>PS4</p>
				<img src="img/wanted/ps4(3).jpg" alt="">
				<p>1500元</p>
				<a href="">出價</a>			
			</div>
		</div>
		<div class="col-xs-3 items">
			<div class="item">
				<p>PS4</p>
				<img src="img/wanted/ps4(3).jpg" alt="">
				<p>1500元</p>
				<a href="">出價</a>			
			</div>
		</div>
		<div class="col-xs-3 items">
			<div class="item">
				<p>PS4</p>
				<img src="img/wanted/ps4(3).jpg" alt="">
				<p>1500元</p>
				<a href="">出價</a>			
			</div>
		</div>
		<div class="col-xs-3 items">
			<div class="item">
				<p>PS4</p>
				<img src="img/wanted/ps4(3).jpg" alt="">
				<p>1500元</p>
				<a href="">出價</a>			
			</div>
		</div>
		<div class="col-xs-3 items">
			<div class="item">
				<p>PS4</p>
				<img src="img/wanted/ps4(3).jpg" alt="">
				<p>1500元</p>
				<a href="">出價</a>			
			</div>
		</div>
		<div class="col-xs-3 items">
			<div class="item">
				<p>PS4</p>
				<img src="img/wanted/ps4(3).jpg" alt="">
				<p>1500元</p>
				<a href="">出價</a>			
			</div>
		</div>
		<div class="col-xs-3 items">
			<div class="item">
				<p>PS4</p>
				<img src="img/wanted/ps4(3).jpg" alt="">
				<p>1500元</p>
				<a href="">出價</a>			
			</div>
		</div>
		<div class="col-xs-3 items">
			<div class="item">
				<p>PS4</p>
				<img src="img/wanted/ps4(3).jpg" alt="">
				<p>1500元</p>
				<a href="">出價</a>			
			</div>
		</div>
		<div class="col-xs-3 items">
			<div class="item">
				<p>PS4</p>
				<img src="img/wanted/ps4(3).jpg" alt="">
				<p>1500元</p>
				<a href="">出價</a>			
			</div>
		</div>
	</div>

</body>
</html>