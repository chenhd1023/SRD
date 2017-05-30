<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>SRD</title>
	<meta charset="utf-8">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
	<link rel="shortcut icon" href="img/favicon.png"  type="image/vnd.microsoft.icon">
	<link rel="icon" href="img/favicon.png"  type="image/vnd.microsoft.icon">
	<link rel="apple-touch-icon" href="img/favicon.png">
	<link href="css/navbarCss.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
	<script src="js/navbarJs.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<ul class="nav navbar-nav navbar-left">
					<li style="top:-7px">
						<a class="navbar-brand" href="index.jsp"><img src="img/icon.svg" width="100px" height="30px"></a>
					</li>
				</ul>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-left">
					<li>
						<a href="ProductServlet?action=indexToContent&contentType=contentshare" >分享</a>
					</li>
					<li>
						<a href="ProductServlet?action=indexToContent&contentType=contentresale">出售</a>
					</li>
					<li>
						<a href="ProductServlet?action=indexToContent&contentType=contentdonate">捐贈</a>
					</li>
					<li>
						<a href="WantedServlet?action=indexToContent&contentType=wanted">懸賞</a>
					</li>
					<li>
						<a href="goodsassign1.jsp">我要上架</a>
					</li>
					<li>
						<a href="wantedassign1.jsp">我要懸賞</a>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>						
						<input type="text" style="margin-top:12px;">						
					</li>
					<li style="top:-5px">
						<a class="navbar-brand" href="#">
							<img src="img/search.ico" width="30px" height="30px">
						</a>
					</li>
					<li class="dropdown">
						<a onclick="drop()" class="droplink" style="padding:0px;">
							<img src="${profilePhoto}" alt="" width="40px;" style="margin-top:5px;margin-right: 75px;border-radius:50%;cursor:pointer;">
						</a>
						<div id="triangle"></div>
						<div id="dropdown" class="dropdown-content">
							<a href="AccountServlet?action=selfPage&accountid=${accountid}">個人頁面</a>
							<a href="MessageServlet?action=getLatestConversation&accountid=${accountid}">訊息</a>
							<!-- <a href="goodsoutgoing.html">物品出走中</a> -->
							<a href="CommentServlet?action=commentyet&accountid=${accountid}">尚未評論</a>
							<a href="setting.jsp">帳號設定</a>
							<a href="javascript: return false;" onclick="handler()">登出</a>
						</div>										
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<form action="AccountServlet" id="form1">
		<input type="hidden" name="action" value="logout">
	</form>
	<form action="ProductServlet" method="get" id="indexForm">
		<input type="hidden" name="action" value="indexToContent"> <input
			type="hidden" name="contentType" id="contentType">
	</form>
</body>
<script>
function handler(){
	document.getElementById("form1").submit();
}
function submitIndexForm(contentType) {
	document.getElementById("contentType").value = contentType;
	
	document.getElementById("indexForm").submit();
}
</script>
</html>