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
	<title>bid</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bidCss.css" rel="stylesheet">
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
	<title>Document</title>
	<script src="https://use.fontawesome.com/5569aed046.js"></script>
	<style>
		body{
			background-color: rgb(202,244,249);
		}
	</style>
</head>
<body>
	
	<div id="content">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="img col-xs-5 col-sm-5 col-md-5 col-lg-5 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1"  onmousewheel="return zoomPic('ps4pic')" >
					<img id="ps4pic" src="${picture}" alt="">
				</div>
				<div class="name col-xs-3 col-sm-3 col-md-3 col-lg-3 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
					<h2>商品名稱:</h2><br>
					<h1>${name}</h1>
				</div>
				<div class="bid col-xs-1 col-sm-1 col-md-1 col-lg-1 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2">
					<p onclick="showDialog()">我要喊價</p>
				</div>

			</div>
		</div>
		<div id="dialog">

		</div>
		<div id="msg" class="col-xs-4 col-xs-offset-4">
			<img src="img/wanted/wantedicon.svg" alt="" class="col-xs-3"  id="msgicon">
			<img src="${picture}" class="col-xs-9" alt="">
			<i class="fa fa-times" aria-hidden="true"onclick="closeDialog();"></i>
			<p class="col-xs-4">懸賞人(id)</p>
			<p class="col-xs-8">${owner}</p>
			<p class="col-xs-4">物品名稱</p>
			<p class="col-xs-8">${name}</p>
			<p class="col-xs-5">喊價價格&nbsp;NT</p>
			<input class="col-xs-7" type="text">
			<div id="bidconfirm"><input type="button" value="送出喊價" onclick="closeDialog();" ></div>			
		</div>
		<div class="row">
			<div class="prices">
				<div class="number col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<div>
						<h5>1</h5>
					</div>
				</div>
				<div class="reward col-xs-2 col-sm-2 col-md-2 col-lg-2 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
					<h4>懸賞者</h4>
					<img src="img/wanted/reward.svg" alt="">
					<div>
						<h5>ID</h5>
					</div>
				</div>
				<div class="price col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<h4>願付金額</h4>
					<img src="img/wanted/wantedprice.svg" alt="">
					<div>
						<h5>1000</h5>
					</div>
				</div>
				<div class="timeup col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<h4>截止時間</h4>
					<img src="img/wanted/demandtime.svg" alt="">
					<div>
						<h5>${timelimit}</h5>
					</div>
				</div>
				<div class="tear col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<h4>撕單</h4>
					<img src="img/wanted/tear.svg" alt="">
					<div>
						<h5 onclick="showDialog2()">撕單</h5>
					</div>
				</div>
			</div>			
		</div>
		<div id="dialog2">
			
		</div>
		<div id="msg2" class="col-xs-4 col-xs-offset-4">
			<img src="img/wanted/wantedicon.svg" alt="" class="col-xs-3"  id="msgicon">
			<img src="${picture}" class="col-xs-9" alt="">
			<i class="fa fa-times" aria-hidden="true"onclick="closeDialog2();"></i>
			<p class="col-xs-4">懸賞人(id)</p>
			<p class="col-xs-8">${owner}</p>
			<p class="col-xs-4">物品名稱</p>
			<p class="col-xs-8">${name}</p>
			<p class="col-xs-4">出價 &nbsp; NT </p>
			<p class="col-xs-8">${price}</p>
			<p class="col-xs-4">時間 &nbsp; form</p>
			<p class="col-xs-8">${dateStart}</p>
			<p class="col-xs-4">to</p>
			<p class="col-xs-8">${dateEnd}</p>
			<p class="col-xs-4">備註</p>
			<p class="col-xs-8">${other}</p>		
			<div id="tearconfirm"><input type="button" value="確定撕單" onclick="closeDialog2();" ></div>
		</div>
	</div>
</body>
<script src="js/bidJs.js"></script>
</html>