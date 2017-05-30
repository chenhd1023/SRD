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
<html>
<head>
<meta charset="UTF-8">
<meta property="og:title" content="SRD"></meta>
<meta property="og:description" content="Share Rush Demand"/>
<meta property="og:url" content="http://140.119.19.28:8088/srdtest/ProductServlet?action=getOneProduct&idproduct=${productVO.getIdproduct()}"/>
<meta property="og:image" content="http://140.119.19.28:8088/srdtest/img/favicon.png"></meta>
<meta property="fb:app_id" content="1676654989314743"/> 
<title>商品</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/goodsCss.css" rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

</head>
<script>
	function codeAddress() {
		var stateObj = {
			foo : "bar"
		};
		history.pushState(stateObj, "page 2", "ProductServlet?action=getOneProduct&idproduct=${productVO.getIdproduct()}");
	}
</script>
<body onload="codeAddress();">
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.9&appId=1676654989314743";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
	<div class="col-xs-offset-1 container">
		<p>&nbsp</p>
		<p>&nbsp</p>
		<p>&nbsp</p>
		<div class="row">
			<div class="img">
				<div class="bigimg">
					<img id="show" src="${productVO.getPicture1()}" alt="">
				</div>
				<div class="col-xs-12 smallimg">
					<div class="col-xs-2">
						<img src="${productVO.getPicture1()}" class="change"
							onmouseover="change(src)">
					</div>
					<div class="col-xs-2">
						<img src="${productVO.getPicture1()}" class="change"
							onmouseover="change(src)">
					</div>
					<div class="col-xs-2">
						<img src="${productVO.getPicture1()}" class="change"
							onmouseover="change(src)">
					</div>
					<div class="col-xs-2">
						<img src="${productVO.getPicture1()}" class="change"
							onmouseover="change(src)">
					</div>
				</div>
			</div>
			<div class="description">
				<div class="title">
					<p>${productVO.getName()}</p>
					</div>
				<div class="simpleinf">
					<p>
						買斷價格 : <span>${productVO.getSaleprice()}</span>
					</p>
					<p>
						每日單價 : <span>${productVO.getPrice()}</span>
					</p>
					<p>
						面交地點 : <span>${productVO.getPlace()}</span>
					</p>
					
				</div>
				<br>
				<div class="fb-share-button" data-href="http://140.119.19.28:8088/srdtest/ProductServlet?action=getOneProduct&idproduct=${productVO.getIdproduct()}" data-layout="button" data-size="large" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse">分享</a></div> 
				<div class="seller">
					<div class="aboutseller">
						<p>
							關於賣家 &nbsp;<a href="AccountServlet?action=personalPage&accountid=${srbAccountVO.getAccountid()}">${srbAccountVO.getName()}</a>
						</p>
						<div class="sellerimg">
							<a href="AccountServlet?action=personalPage&accountid=${srbAccountVO.getAccountid()}"> <img
								src="${srbAccountVO.getPhoto()}">
							</a>
						</div>
					</div>
					<div class="connectseller">
						<p>
							評價 : <span>*****</span>
						</p>
						<p>
							E-mail : <span>${srbAccountVO.getSchoolmail()}</span>
						</p>
						<c:if test="${accountid!=null&&productVO.getOwner()!=accountid}">
							<button class="btn btn-default"
								onclick="javascript:location.href='MessageServlet?action=getConversation&idproduct=${productVO.getIdproduct()}&seller=${productVO.getOwner()}&buyer=${accountid}&productOrWanted=product'">聯絡賣家</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="detail">
			<div class="detailtitle">
				<div class="col-xs-offset-1 col-xs-2 clicktitle1">
					<h3>物品資訊</h3>
				</div>
				<div class="col-xs-offset-4 col-xs-4 clicktitle2">
					<h3>物品累積評價</h3>
				</div>
			</div>
			<div class="detailinf">
				<div class="detailinf1 detailhiden">
					<p>
						商品分類 : <a href="">之夜</a>
					</p>
					<p>
						物品狀況 : <span>九成新，幾乎無磨損</span>
					</p>
					<div>
						<p style="font-size: 18px;">可用時間 :</p>
					</div>
					<div>
						<table class="calendar">
							<tr>
								<th><button type="button" onclick="changemonth(-1)"><</button></th>
								<th colspan="5" id="titleyearmonth"></th>
								<th><button type="button" onclick="changemonth(1)">></button></th>
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
				<div class="detailinf2 detailhiden">
					<table class="table">
						<tr>
							<th>用戶 ID</th>
							<th>評價分數</th>
							<th>評價內容</th>
							<th>評價時間</th>
						</tr>
						<tr>
							<td>盧昱均</td>
							<td>**********</td>
							<td>好用，推</td>
							<td>2016.12.31</td>
						</tr>
						<tr>
							<td>朱詠君</td>
							<td>******</td>
							<td>有點接觸不良，可是還算不錯</td>
							<td>2016.10.12</td>
						</tr>
						<tr>
							<td>王譽臻</td>
							<td>***</td>
							<td>還可以吧</td>
							<td>2016.9.20</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>