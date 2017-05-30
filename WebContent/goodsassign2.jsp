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
				action="ProductServlet" method="post">
				<div class="form-group">
					<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">每日價格</label>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<input type="text" class="form-control" id="price" name="price"
							placeholder="每日價格">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">買斷/捐贈</label>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<input type="radio" name="saleboolean" value="no" onchange="resaleInput();"> 無買斷/捐贈
						<input type="radio" name="saleboolean" id="resaleRadio" value="yes" onchange="resaleInput();" > 可買斷 
  						<input type="radio" name="saleboolean" value="donate" onchange="resaleInput();">可捐贈
  						<div id="salepriceDiv"></div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">可用時間</label>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<table class="calendar">
							<tr>
								<th>
									<button type="button" onclick="changemonth(-1)"><</button>
								</th>
								<th colspan="5" id="titleyearmonth"></th>
								<th>
									<button type="button" onclick="changemonth(1)">></button>
								</th>
							</tr>
							<tr>
								<td>日</td>
								<td>一</td>
								<td>二</td>
								<td>三</td>
								<td>四</td>
								<td>五</td>
								<td>六</td>
							</tr>
							<tr>
								<td onclick="selectFunction(this)" id="x0y0"></td>
								<td onclick="selectFunction(this)" id="x1y0"></td>
								<td onclick="selectFunction(this)" id="x2y0"></td>
								<td onclick="selectFunction(this)" id="x3y0"></td>
								<td onclick="selectFunction(this)" id="x4y0"></td>
								<td onclick="selectFunction(this)" id="x5y0"></td>
								<td onclick="selectFunction(this)" id="x6y0"></td>
							</tr>
							<tr>
								<td onclick="selectFunction(this)" id="x0y1"></td>
								<td onclick="selectFunction(this)" id="x1y1"></td>
								<td onclick="selectFunction(this)" id="x2y1"></td>
								<td onclick="selectFunction(this)" id="x3y1"></td>
								<td onclick="selectFunction(this)" id="x4y1"></td>
								<td onclick="selectFunction(this)" id="x5y1"></td>
								<td onclick="selectFunction(this)" id="x6y1"></td>
							</tr>
							<tr>
								<td onclick="selectFunction(this)" id="x0y2"></td>
								<td onclick="selectFunction(this)" id="x1y2"></td>
								<td onclick="selectFunction(this)" id="x2y2"></td>
								<td onclick="selectFunction(this)" id="x3y2"></td>
								<td onclick="selectFunction(this)" id="x4y2"></td>
								<td onclick="selectFunction(this)" id="x5y2"></td>
								<td onclick="selectFunction(this)" id="x6y2"></td>
							</tr>
							<tr>
								<td onclick="selectFunction(this)" id="x0y3"></td>
								<td onclick="selectFunction(this)" id="x1y3"></td>
								<td onclick="selectFunction(this)" id="x2y3"></td>
								<td onclick="selectFunction(this)" id="x3y3"></td>
								<td onclick="selectFunction(this)" id="x4y3"></td>
								<td onclick="selectFunction(this)" id="x5y3"></td>
								<td onclick="selectFunction(this)" id="x6y3"></td>
							</tr>
							<tr>
								<td onclick="selectFunction(this)" id="x0y4"></td>
								<td onclick="selectFunction(this)" id="x1y4"></td>
								<td onclick="selectFunction(this)" id="x2y4"></td>
								<td onclick="selectFunction(this)" id="x3y4"></td>
								<td onclick="selectFunction(this)" id="x4y4"></td>
								<td onclick="selectFunction(this)" id="x5y4"></td>
								<td onclick="selectFunction(this)" id="x6y4"></td>
							</tr>
							<tr>
								<td onclick="selectFunction(this)" id="x0y5"></td>
								<td onclick="selectFunction(this)" id="x1y5"></td>
								<td onclick="selectFunction(this)" id="x2y5"></td>
								<td onclick="selectFunction(this)" id="x3y5"></td>
								<td onclick="selectFunction(this)" id="x4y5"></td>
								<td onclick="selectFunction(this)" id="x5y5"></td>
								<td onclick="selectFunction(this)" id="x6y5"></td>
							</tr>
						</table>
						<input type="hidden" id="monthnow">
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
function resaleInput() {
    if (document.getElementById('resaleRadio').checked == true) {
        var input = document.createElement("input");
        input.type = "number";
        input.placeholder = "請輸入欲賣斷之金額";
        input.id="salepriceInput";
        input.name = "saleprice";
        input.required = "true";
        document.getElementById("salepriceDiv").appendChild(input);
    }
    if (document.getElementById('resaleRadio').checked == false&&document.contains(document.getElementById("salepriceInput"))) {
        document.getElementById("salepriceInput").remove();
    }
   
   
}
</script>
</html>