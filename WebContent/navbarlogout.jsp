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
	<link rel="icon" href="img/favicon.png">
	<link href="css/font.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<style>
body {
    font-family: "微軟正黑體", "Microsoft JhengHei",serif,sans-serif,cursive,fantasy,monospace;
     
}
</style>
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
						<a href="login.jsp">我要上架</a>
					</li>
					<li>
						<a href="login.jsp">我要懸賞</a>
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
					<li>
						<a href="signup.jsp">註冊</a>
					</li>
					<li>
						<a href="login.jsp">登入</a>
					</li>
					
				</ul>
			</div>
		</div>
	</nav>
		<form action="ProductServlet" method="post" id="indexForm">
		<input type="hidden" name="action" value="indexToContent"> <input
			type="hidden" name="contentType" id="contentType">
	</form>
</body>
<script>

function submitIndexForm(contentType) {
	document.getElementById("contentType").value = contentType;
	
	document.getElementById("indexForm").submit();
}
</script>
</html>