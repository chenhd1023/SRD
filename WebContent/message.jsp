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
<title>message</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/messageCss.css" rel="stylesheet">
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
</head>
<body>
	<div class="header col-xs-12">
		<div class="icon col-xs-3 col-xs-push-1">
			<img src="img/comment/comment.svg" alt="">
		</div>
		<div class="col-xs-6">
			<a href="">訊息</a><a href="commentyet.html">尚未評論</a><a href="">已評論紀錄</a>
		</div>
	</div>
	<div class="mainpart col-xs-12">
		<div class="goodsinf col-xs-2">
			<h3>產品資訊</h3>
			<c:forEach var="vo" items="${transactionVOs}">
				<div class="items">
					<h4>
						商品名稱<span>&nbsp;&nbsp;&nbsp;&nbsp;${vo.getProductname()}</span>
					</h4>
					<h4>
						賣家ID<span>&nbsp;&nbsp;&nbsp;&nbsp;${vo.getSeller()}</span>
					</h4>
				</div>
			</c:forEach>
		</div>
		<div class="message col-xs-6 col-xs-offset-1">
			<h3>
				<span><img src="${profilePhoto}" alt=""></span>&nbsp;&nbsp;${accountid}
			</h3>
			<div class="messagecontent">
				<c:forEach var="vo" items="${messageVOs}">
					<c:if test="${vo.getFromId()!=accountid}">
						<div class="row">
						<div class="other">
							<p>
								<span><img src="${sellerVO.getPhoto()}" alt=""></span>&nbsp;&nbsp;${vo.getMessage()}
							</p>
						</div>
					</div>
					</c:if>
					<c:if test="${vo.getFromId()==accountid}">
						<div class="row">
						<div class="me">
							<p>${vo.getMessage()}</p>
						</div>
					</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="submit">
				<input type="text" id="message">&nbsp;
				<button class="btn btn-default" href="javascript: return false;" onclick="sendMessage()">送出訊息</button>
			</div>
		</div>
		<div class="check col-xs-2">
			<h3>確認單</h3>
			<div class="checkinf">
				<img src="${productVO.getPicture1()}" alt="">
				<h4>
					商品名稱<span>&nbsp;&nbsp;${productVO.getName()}</span>
				</h4>
				<h4>
					賣家ID<span>&nbsp;&nbsp;${sellerVO.getAccountid()}</span>
				</h4>
				<!-- <h4>時間<span>&nbsp;&nbsp;2/30</span></h4> -->
				<h4>
					價格<span>&nbsp;&nbsp;${productVO.getPrice()}/天</span>
				</h4>
				<h4>備註:</h4>
				<h5>${productVO.getDescribe()}</h5>
			</div>
			<div class="row">
				<button class="buy btn btn-default" href="javascript: return false;" onclick="sendMessageWant()">確認下單</button>
				<button class="giveup btn btn-default" href="javascript: return false;" onclick="sendMessageGiveup()">放棄此單</button>
			</div>
		</div>
	</div>
	<form action="MessageServlet" method="post" id="sendMessageForm">
		<input type="hidden" name="action" value="insertNewMessage"> 
		<input type="hidden" name="message" id="messageInForm"> 
		<input type="hidden" name="idtransaction" value="${transactionVO.getIdtransaction()}">
		
		<c:if test="${productVO.getOwner()!=accountid}">
			<input type="hidden" name="fromId" value="${accountid}">
			<input type="hidden" name="toId" value="${productVO.getOwner()}">
		</c:if>
		<c:if test="${productVO.getOwner()==accountid}">
			<input type="hidden" name="fromId" value="${accountid}">
			<input type="hidden" name="toId" value="${FromId}">
		</c:if>
		
	</form>
</body>
<script>
function sendMessage() {
	document.getElementById('messageInForm').value=document.getElementById('message').value;
	document.getElementById("sendMessageForm").submit();
}
function sendMessageWant() {
	document.getElementById('messageInForm').value="您好，我確定要下單";
	document.getElementById("sendMessageForm").submit();
}
function sendMessageGiveup() {
	document.getElementById('messageInForm').value="您好，我只是問問而已";
	document.getElementById("sendMessageForm").submit();
}
</script>
</html>