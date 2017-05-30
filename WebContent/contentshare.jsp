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
<head >
<meta charset="utf-8">
<title>content</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/contentshareCss.css" rel="stylesheet" type="text/css">
<link href="css/common.css" rel="stylesheet" type="text/css">
<link href="css/reset.css" rel="stylesheet" type="text/css">
<script src="https://use.fontawesome.com/5569aed046.js"></script>
</head>
<script>
function codeAddress(){
	var stateObj = { foo: "bar" };
	history.pushState(stateObj, "page 2", "ProductServlet?${url}");
}
</script>
<body onload="codeAddress();">
	<div id="content">
		<div class="container">
			<div class="row">
				<div class="col-xs-4 col-xs-offset-3">
					<div class="col-xs-3">
						<img src="img/content/share.svg" width="100%">
					</div>
					<div class="col-xs-3">
						<a href="ProductServlet?action=indexToContent&contentType=contentshare">分享</a>
					</div>
					<div class="col-xs-3">
						<a href="ProductServlet?action=indexToContent&contentType=contentresale">轉售</a>
					</div>
					<div class="col-xs-3">
						<a href="ProductServlet?action=indexToContent&contentType=contentdonate">捐贈</a>
					</div>
				</div>
				<div class="col-xs-3 page">
					<a href=""><</a><span>1/50</span><a href="">></a>
				</div>
			</div>
			<div class="mainpart row">
				<!-- 左側分類 -->
				<div class="catalog col-xs-3 col-sm-3 col-md-3 col-lg-3">
					<h2 style="font-size: 30px;">出租分類</h2>
					<div class="puzzleicon">
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
							<img width="60px" src="img/content/puzzleicon1.svg" alt="">
						</div>
						<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
							<a class="kind" href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=lodging"
								style="color: black; text-decoration: none;">住宿</a>
						</div>
					</div>
					<div class="puzzleicon">
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
							<img width="60px" src="img/content/puzzleicon2.svg" alt="">
						</div>
						<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
							<a class="kind" href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=exam"
								style="color: black; text-decoration: none;">考試</a>
						</div>
					</div>
					<div class="puzzleicon">
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
							<img width="60px" src="img/content/puzzleicon1.svg" alt="">
						</div>
						<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
							<a class="kind" href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=3C"
								style="color: black; text-decoration: none;">3C</a>
						</div>
					</div>
					<div class="puzzleicon">
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
							<img width="60px" src="img/content/puzzleicon2.svg" alt="">
						</div>
						<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
							<a class="kind" href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=travel"
								style="color: black; text-decoration: none;">出遊</a>
						</div>
					</div>
					<div class="puzzleicon">
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
							<img width="60px" src="img/content/puzzleicon1.svg" alt="">
						</div>
						<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
							<a class="kind" href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=book"
								style="color: black; text-decoration: none;">書籍</a>
						</div>
					</div>
					<div class="puzzleicon">
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
							<img width="60px" src="img/content/puzzleicon2.svg" alt="">
						</div>
						<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
							<a class="kind" href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=cloth"
								style="color: black; text-decoration: none;">衣著</a>
						</div>
					</div>
					<div class="puzzleicon">
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
							<img width="60px" src="img/content/puzzleicon1.svg" alt="">
						</div>
						<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
							<a class="kind" href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=fun"
								style="color: black; text-decoration: none;">娛樂</a>
						</div>
					</div>
				</div>
				<!-- /左側分類 -->
				<!-- 商品 -->
				<c:forEach var="vo" items="${productVOs}">
					<div class="col-xs-9 item">
						<div class="col-xs-3">
							<a href="ProductServlet?action=getOneProduct&idproduct=${vo.getIdproduct()}"><img src="${vo.getPicture1()}"></a>
						</div>
						<div class="col-xs-9">
							<a href="ProductServlet?action=getOneProduct&idproduct=${vo.getIdproduct()}"><p>${vo.getName()}</p></a>
							<div>
								<i class="fa fa-location-arrow" aria-hidden="true"></i>${vo.getPlace()}
							</div>
							<div>
								<i class="fa fa-usd" aria-hidden="true"></i>${vo.getPrice()}
							</div>
						</div>
					</div>
				</c:forEach>


				<!-- /商品 -->
			</div>

		</div>

	</div>
</body>
