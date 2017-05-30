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
	<title>wantedfail</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/wantedfailCss.css" rel="stylesheet">
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
</head>
<script>
function codeAddress(){
	var stateObj = { foo: "bar" };
	history.pushState(stateObj, "page 2", "WantedServlet?${url}");
}
</script>
<body onload="codeAddress();">
	<div class="header col-xs-12">
		<div class="col-xs-3">
		<img src="img/wanted/wantedicon.svg" alt="">
		</div>
		<div class="col-xs-6">
			<a href="WantedServlet?action=indexToContent&contentType=wanted">現正懸賞</a><a href="WantedServlet?action=indexToContent&contentType=wantedsuccess">懸賞成功</a><a href="WantedServlet?action=indexToContent&contentType=wantedfail">懸賞失敗</a>
		</div>
		<div class="col-xs-3">
			<button onclick="window.location.href='wantedassign1.jsp'"><img src="img/wanted/wantedicon.svg" alt="">我要懸賞</button>
		</div>
	</div>
	<div class="mainpart col-xs-12">
	<c:forEach var="wantedVOs" items="${bigWantedVOs}">
		<div class="row">
			<c:forEach var="vo" items="${wantedVOs}">
				<div class="col-xs-3 items">
					<div class="item">
						<p>${vo.getName()}</p>
						<img src="${vo.getPicture()}" alt="">
						<p>成交金額</p>
						<p>${vo.getPrice()}元</p>
						<img src="img/wanted/wantedfail/redfail.svg" alt="">			
					</div>
				</div>
			</c:forEach>	
		</div>
	</c:forEach>
	</div>
</body>
</html>