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
<title>商品</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/goodsCss.css" rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

</head>
<body>
	<div class="col-xs-offset-1 container">
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
				<div class="seller">
					<div class="aboutseller">
						<p>
							關於賣家 &nbsp;<a href="personalPage.html">${srbAccountVO.getAccountid()}</a>
						</p>
						<div class="sellerimg">
							<a href="personalPage.html"> <img
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
							<button class="btn btn-default" onclick="javascript:location.href='MessageServlet?action=getConversation&idproduct=${productVO.getIdproduct()}&seller=${productVO.getOwner()}&buyer=${accountid}'">聯絡賣家</button>
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
						商品分類 : <a href="">${productVO.getCatalog()}</a>
					</p>
					<p>
						物品狀況 : <span>${productVO.getDescribe()}</span>
					</p>
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