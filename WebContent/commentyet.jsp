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
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/commentyetCss.css" rel="stylesheet">
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
</head>
<script>
function codeAddress(){
	var stateObj = { foo: "bar" };
	history.pushState(stateObj, "page 2", "CommentServlet?action=commentyet&accountid=${accountid}");
}
</script>
<body onload="codeAddress();">
	<div class="header col-xs-12">
		<div class="icon col-xs-3 col-xs-push-1">
			<img src="img/comment/comment.svg" alt="">
		</div>
		<div class="col-xs-6">
			<a href="MessageServlet?action=getLatestConversation&accountid=${accountid}">訊息</a><a href="CommentServlet?action=commentyet&accountid=${accountid}">尚未評論</a><a href="CommentServlet?action=commentdone&accountid=${accountid}">已評論紀錄</a>
		</div>
	</div>
	<div class="mainpart col-xs-12">
		<section class="object">
			<c:if test="${commentVOs.size()==0}">
			<div style="text-align: center;">
				<h1>目前無未評論之項目</h1>
			</div>
			</c:if>
			<c:forEach var="vo" items="${commentVOs}">
				<a href="CommentServlet?action=getOneComment&idcomment=${vo.getIdcomment()}" class="object-item col-xs-10 col-xs-push-1">
				<img class="col-xs-2" src="${vo.getImg()}" alt="">
				<div class="col-xs-8">
					<p>${vo.getTransactionVO().getProductname()}</p>
					<c:if test="${vo.getRole()=='buyer'}">
						<p>你是借入方</p>
					</c:if>
					<c:if test="${vo.getRole()=='seller'}">
						<p>你是出租方</p>
					</c:if>
				</div>
			</a>
			</c:forEach>
			
		</section>
	</div>
</body>
</html>