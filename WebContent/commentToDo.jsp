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
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<style> .object-item{ background-color: rgb(142,201,234);
border-radius: 20px; box-shadow: 4px 4px 6px 4px rgba(70%,70%,70%,.3);
margin: 0px 0px 20px; } .object-item>img{ padding: 20px; width: 25%; }
.object-item>div:nth-child(2)>p{ padding-top:20px; }
.object-item>div:nth-child(2)>p:nth-child(1){ color: rgb(234,85,20);
font-weight: bold; } .object-item>div:nth-child(3){ padding-top: 20px; }
</style>
</head>
<script>
function codeAddress(){
	var stateObj = { foo: "bar" };
	history.pushState(stateObj, "page 2", "CommentServlet?action=getOneComment&idcomment=${productCommentVO.getIdcomment()}");
}
</script>
<body onload="codeAddress();">
	<div class="container">
		<p>&nbsp</p>
		<p>&nbsp</p>
		<p>&nbsp</p>
		<form class="form-horizontal" role="form" name="form1" id="form1" action="CommentServlet"  method="post">
		<div class="object-item col-xs-10 col-xs-push-1">
			<img class="col-xs-2" src="${productCommentVO.getImg()}" alt="">
			<div class="col-xs-8">
				<p>物品名:&nbsp ${productCommentVO.getTransactionVO().getProductname()}</p>
				<p>滿意度:&nbsp
					<input type="radio" name="productScore" value="1"> 1&nbsp
  					<input type="radio" name="productScore" value="2"> 2&nbsp
					<input type="radio" name="productScore" value="3" checked> 3&nbsp
  					<input type="radio" name="productScore" value="4"> 4&nbsp
  					<input type="radio" name="productScore" value="5"> 5
				</p>
				<p>評價描述:&nbsp<input type="text" class="form-control" name="productDiscription" placeholder="物品評價"></p>
			</div>
		</div>
		<div class="object-item col-xs-10 col-xs-push-1">
			<img class="col-xs-2" src="${personCommentVO.getImg()}" alt="">
			<div class="col-xs-8">
				<c:if test="${'buyer'==personCommentVO.getRole()}">
					<p>受評價對象:&nbsp ${personCommentVO.getTransactionVO().getSeller()}</p>
				</c:if>
				<c:if test="${'seller'==personCommentVO.getRole()}">
					<p>受評價對象:&nbsp ${personCommentVO.getTransactionVO().getBuyer()}</p>
				</c:if>
				<p>滿意度:&nbsp
					<input type="radio" name="personScore" value="1"> 1&nbsp
  					<input type="radio" name="personScore" value="2"> 2&nbsp
					<input type="radio" name="personScore" value="3" checked> 3&nbsp
  					<input type="radio" name="personScore" value="4"> 4&nbsp
  					<input type="radio" name="personScore" value="5"> 5
				</p>
				<p>評價描述:&nbsp<input type="text" class="form-control" name="personDiscription" placeholder="人物評價"></p>
			</div>
		</div>
		<div class="row submit col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="col-xs-offset-8 col-xs-2">
				<div class="button">
					<input type="hidden" name="productIdcomment" value="${productCommentVO.getIdcomment()}"> 
					<input type="hidden" name="personIdcomment" value="${personCommentVO.getIdcomment()}"> 
					<input type="hidden" name="action" value="insertComment"> 
					<input type="submit" value="提交">
				</div>
			</div>
		</div>
		</form>
	</div>
</body>
</html>