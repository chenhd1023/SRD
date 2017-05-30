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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signupCss.css" rel="stylesheet">
<link href="css/goodsassignCss.css" rel="stylesheet">
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
		<p>&nbsp</p>
		<p>&nbsp</p>
		<div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div
				class="puzzle1 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2 col-xs-3 col-sm-3 col-md-3 col-lg-3">
				<img src="img/signup/brightpuzzle.svg">
				<h3>基本資料</h3>
			</div>
			<div class="puzzle2 col-xs-3 col-sm-3 col-md-3 col-lg-3">
				<img src="img/signup/darkpuzzle.svg">
				<h3>時間價錢</h3>
			</div>
			<div class="puzzle3 col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<img src="img/signup/brightpuzzle.svg">
				<h3>物品照片</h3>
			</div>
		</div>

		<div class="row table col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<form class="form-horizontal" role="form" name="goodassign2" id="goodassign2"
				action="WantedServlet" method="post">
				<div class="form-group">
					<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">價格</label>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<input type="text" class="form-control" id="price" name="price"
							placeholder="價格">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">起始日</label>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<input type="date" name="dateStart" > 
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">終結日</label>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<input type="date" name="dateEnd" > 
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">競標期限</label>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<input type="date" name="timelimit" > 
					</div>
				</div>
				<div class="row submit col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="col-xs-offset-8 col-xs-2">
						<div class="button">
							<input type="hidden" name="action" value="insertSecond"> 
							<input type="hidden" name="rentdays" id="rentdays">
							<input type="button" value="提交" onclick="submitgoodassign2()">

						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="js/goodsassignJs.js"></script>
<script>
function submitgoodassign2() {
	selectedString="";
	for (var i = 0; i < selectedArray.length; i++) {
		selectedString=selectedString+"+"+selectedArray[i];
    }
	document.getElementById("rentdays").value=selectedString;
	//alert(selectedString);
    document.getElementById("goodassign2").submit();
}
</script>
</html>