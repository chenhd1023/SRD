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
	<title>commentdone</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/commentdoneCss.css" rel="stylesheet">
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
</head>
<script>
function codeAddress(){
	var stateObj = { foo: "bar" };
	history.pushState(stateObj, "page 2", "CommentServlet?action=commentdone&accountid=${accountid}");
}
</script>
<body onload="codeAddress();">
	<div class="header col-xs-12">
		<div class="icon col-xs-3 col-xs-push-1">
			<img src="img/comment/comment.svg" alt="">	
		</div>
		<div class="col-xs-6">
			<a href="MessageServlet?action=getLatestConversation&accountid=${accountid}">訊息</a><a href="CommentServlet?action=commentyet&accountid=chenhd">尚未評論</a><a href="CommentServlet?action=commentdone&accountid=${accountid}">已評論紀錄</a>
		</div>
	</div>
	<div class="mainpart col-xs-12">
		<div class="rent-icon col-xs-2">
			<img src="img/comment/renticon.svg" alt="">
		</div>
		<section class="rent col-xs-9 col-xs-offset-2">
			<section class="object">
				<div>
					<p class="col-xs-3 col-xs-push-1">物品</p>
				</div>
				<c:if test="${sellerProductCommentVOs.size()==0}">
					<div >
						<br>
						<br>
						<h1>目前無此評論項目</h1>
					</div>
					</c:if>
				<c:forEach var="vo" items="${sellerProductCommentVOs}">
					<div class="object-item col-xs-10 col-xs-push-1">
						<img class="col-xs-2" src="${vo.getImg()}" alt="">
						<div class="col-xs-8">
							<p>${vo.getTransactionVO().getProductname()}</p>
							<p>評價描述:&nbsp ${vo.getDiscription()}</p>
							<p>評等日期:&nbsp ${vo.getDate()}</p>
						</div>
						<div>
							<p>滿意度</p>
							<h1>${vo.getScore()}</h1>
						</div>
					</div>
				</c:forEach>
			</section>
			<section class="object">
				<div>
					<p class="col-xs-3 col-xs-push-1">借入方	</p>
				</div>
				<c:if test="${sellerPersonCommentVOs.size()==0}">
					<div >
						<br>
						<br>
						<h1>目前無此評論項目</h1>
					</div>
					</c:if>
				<c:forEach var="vo" items="${sellerPersonCommentVOs}">
					<div class="object-item col-xs-10 col-xs-push-1">
						<img class="col-xs-2" src="${vo.getImg()}" alt="">
						<div class="col-xs-8">
							<p>${vo.getTransactionVO().getBuyer()}</p>
							<p>評價描述:&nbsp ${vo.getDiscription()}</p>
							<p>評等日期:&nbsp ${vo.getDate()}</p>
						</div>
						<div>
							<p>滿意度</p>
							<h1>${vo.getScore()}</h1>
						</div>
					</div>
				</c:forEach>
			</section>
		</section>
		<div class="borrow-icon col-xs-2">
			<img src="img/comment/borrowicon.svg" alt="">
		</div>
		<section class="rent col-xs-9 col-xs-offset-2">
			<section class="object">
			<div>
				<p class="col-xs-3 col-xs-push-1">物品</p>
			</div>
			<c:if test="${buyerProductCommentVOs.size()==0}">
					<div >
						<br>
						<br>
						<h1>目前無此評論項目</h1>
					</div>
					</c:if>
				<c:forEach var="vo" items="${buyerProductCommentVOs}">
					<div class="object-item col-xs-10 col-xs-push-1">
						<img class="col-xs-2" src="${vo.getImg()}" alt="">
						<div class="col-xs-8">
							<p>${vo.getTransactionVO().getProductname()}</p>
							<p>評價描述:&nbsp ${vo.getDiscription()}</p>
							<p>評等日期:&nbsp ${vo.getDate()}</p>
						</div>
						<div>
							<p>滿意度</p>
							<h1>${vo.getScore()}</h1>
						</div>
					</div>
				</c:forEach>
		</section>
		<section class="object">
			<div>
				<p class="col-xs-3 col-xs-push-1">出租方	</p>
			</div>
			<c:if test="${buyerPersonCommentVOs.size()==0}">
					<div >
						<br>
						<br>
						<h1>目前無此評論項目</h1>
					</div>
					</c:if>
				<c:forEach var="vo" items="${buyerPersonCommentVOs}">
					<div class="object-item col-xs-10 col-xs-push-1">
						<img class="col-xs-2" src="${vo.getImg()}" alt="">
						<div class="col-xs-8">
							<p>${vo.getTransactionVO().getSeller()}</p>
							<p>評價描述:&nbsp ${vo.getDiscription()}</p>
							<p>評等日期:&nbsp ${vo.getDate()}</p>
						</div>
						<div>
							<p>滿意度</p>
							<h1>${vo.getScore()}</h1>
						</div>
					</div>
				</c:forEach>
		</section>
		</section>
	</div>
</body>
</html>