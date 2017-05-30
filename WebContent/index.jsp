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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta property="og:image" content="http://140.119.19.28:8088/srdtest/img/favicon.png"></meta>
<meta name="author" content="">
<title>homepage</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/shop-homepage.css" rel="stylesheet">
<link href="css/indexCss.css" rel="stylesheet" type="text/css">
<link href="css/common.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="css/firsteffect.css" type="text/css"
	media="screen" />
</head>
<body>
	<!-- nav-bar -->

	<div id="content">
		<p>&nbsp</p>
		<!-- banner -->
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
				style="background-image: url(img/index/bg/indexbanner.svg)">
				<div class="row carousel-holder">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img class="slide-image" src="img/index/sharingbanner.svg">
								</div>
								<div class="item">
									<img class="slide-image" src="img/index/resalebanner.svg"
										alt="">
								</div>
								<div class="item">
									<img class="slide-image" src="img/index/donatebanner.svg"
										alt="">
								</div>
							</div>
							<a class="left carousel-control" href="#carousel-example-generic"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- SRD分類 -->
		<div class="row types">
			<div class="lifecycle col-xs-12 col-sm-12 col-md-12 col-lg-12"
				style="background-color: white;">
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
					<img src="img/index/lifecycle.svg" width="75%">
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 lifecycleimg">
					<a href="ProductServlet?action=indexToContent&contentType=contentshare" ><img src="img/index/share.svg"
						width="60%"></a><br> <a style="text-decoration: none"
						href="ProductServlet?action=indexToContent&contentType=contentshare"><h2
							style="text-align: center; color: black">分享</h2></a>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 lifecycleimg">
					<a href="ProductServlet?action=indexToContent&contentType=contentresale"><img src="img/index/resale.svg"
						width="60%"></a><br> <a style="text-decoration: none"
						href="ProductServlet?action=indexToContent&contentType=contentresale"><h2
							style="text-align: center; color: black">轉售</h2></a>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 lifecycleimg">
					<a href="ProductServlet?action=indexToContent&contentType=contentdonate"><img src="img/index/donate.svg"
						width="60%"></a><br> <a style="text-decoration: none"
						href="ProductServlet?action=indexToContent&contentType=contentdonate"><h2
							style="text-align: center; color: black">捐贈</h2></a>
				</div>
			</div>
		</div>
		<!-- 熱門物品.活動 -->
		<div class="row hot">
			<div class="col-xs-12 hottitle">
				<img class="col-xs-2" src="img/homepage/hot.svg">
				<h2>熱門分類</h2>
			</div>
			<div class="col-xs-12 hotactivities">
				<div class="col-xs-2 hotactivity">
					<a href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=fun"><h2>娛樂</h2></a>
					<hr>
					<div class="hotactivityimg">
						<a href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=fun"><img src="img/homepage/photo/switch.jpg" title="娛樂"></a>
					</div>
				</div>
				<div class="col-xs-2 hotactivity">
					<a href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=travel"><h2>出遊</h2></a>
					<hr>
					<div class="hotactivityimg">
						<a href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=travel"><img src="img/homepage/photo/picnic.jpg" title="出遊"></a>
					</div>
				</div>
				<div class="col-xs-2 hotactivity">
					<a href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=book"><h2>書籍</h2></a>
					<hr>
					<div class="hotactivityimg">
						<a href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=book"><img src="img/homepage/photo/accounting.jpg" title="書籍"></a>
					</div>
				</div>
				<div class="col-xs-2 hotactivity">
					<a href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=3C"><h2>3C</h2></a>
					<hr>
					<div class="hotactivityimg">
						<a href="ProductServlet?action=catalogSearch&contentType=contentshare&catalog=3C"><img src="img/homepage/photo/iphone.jpg" title="3C"></a>
					</div>
				</div>
			</div>
			<div class="col-xs-12 hottitle">
				<img class="col-xs-2" src="img/homepage/hot.svg">
				<h2>熱門商品</h2>
			</div>
			<div class="col-xs-12 hotgoods">
				<div class="col-xs-2 hotgood">
					<a href="ProductServlet?action=getOneProduct&idproduct=27"><h3>NDS</h3></a>
					<hr>
					<div class="hotgoodimg">
						<a href="ProductServlet?action=getOneProduct&idproduct=27"><img src="img/products/27.jpg"></a>
					</div>
				</div>
				<div class="col-xs-2 hotgood">
					<a href="ProductServlet?action=getOneProduct&idproduct=20"><h3>吹風機</h3></a>
					<hr>
					<div class="hotgoodimg">
						<a href="ProductServlet?action=getOneProduct&idproduct=20"><img src="img/products/20.png"></a>
					</div>
				</div>
				<div class="col-xs-2 hotgood">
					<a href="ProductServlet?action=getOneProduct&idproduct=24"><h3>普心筆記</h3></a>
					<hr>
					<div class="hotgoodimg">
						<a href="ProductServlet?action=getOneProduct&idproduct=24"><img src="img/products/24.png"></a>
					</div>
				</div>
				<div class="col-xs-2 hotgood">
					<a href="ProductServlet?action=getOneProduct&idproduct=21"><h3>娃娃</h3></a>
					<hr>
					<div class="hotgoodimg">
						<a href="ProductServlet?action=getOneProduct&idproduct=21"><img src="img/products/21.png"></a>
					</div>
				</div>
				<div class="col-xs-2 hotgood">
					<a href="ProductServlet?action=getOneProduct&idproduct=28"><h3>MacBook Pro</h3></a>
					<hr>
					<div class="hotgoodimg">
						<a href="ProductServlet?action=getOneProduct&idproduct=28"><img src="img/products/28.png"></a>
					</div>
				</div>
			</div>
		</div>
		<!-- 分享 -->
		<div class="row share">
			<div class="col-xs-12 sharetitle">
				<img class="col-xs-2" src="img/homepage/share.svg">
				<h2>分享</h2>
			</div>
			<br>
			<div class="col-xs-12 shareitems">
				<div class="col-xs-4 sharecontent">
					<div class="shareinside">
						<div class="col-xs-12">
							<div class="col-xs-4 shareimg">
								<img src="img/profile/default.svg" alt="">
							</div>
							<div class="col-xs-6 shareid">
								<a href=""><h3>103306066</h3></a>
							</div>
						</div>
						<div class="sharegood">
							<a href="ProductServlet?action=getOneProduct&idproduct=23"><h3>ipone7</h3></a>
							<div class="sharegoodname">
								<a href="ProductServlet?action=getOneProduct&idproduct=23"><img src="img/products/23.png" alt=""></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-4 sharecontent">
					<div class="shareinside">
						<div class="col-xs-12">
							<div class="col-xs-4 shareimg">
								<img src="img/profile/Wang.png" alt="">
							</div>
							<div class="col-xs-6 shareid">
								<a href=""><h3>Wang</h3></a>
							</div> 
						</div>
						<div class="sharegood">
							<a href="ProductServlet?action=getOneProduct&idproduct=38"><h3>西裝</h3></a>
							<div class="sharegoodname">
								<a href="ProductServlet?action=getOneProduct&idproduct=38"><img src="img/products/38.png" alt=""></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-4 sharecontent">
					<div class="shareinside">
						<div class="col-xs-12">
							<div class="col-xs-4 shareimg">
								<img src="img/profile/Yuzen.png" alt="">
							</div>
							<div class="col-xs-6 shareid">
								<a href=""><h3>Yuzen</h3></a>
							</div> 
						</div>
						<div class="sharegood">
							<a href="ProductServlet?action=getOneProduct&idproduct=27"><h3>NDS</h3></a>
							<div class="sharegoodname">
								<a href="ProductServlet?action=getOneProduct&idproduct=27"><img src="img/products/27.jpg" alt=""></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 懸賞 -->
		<div class="row wanted">
			<div class="col-xs-12 wantedtitle">
				<img class="col-xs-2" src="img/homepage/wanted.svg">
				<h2>懸賞物品</h2>
			</div>
			<div class="container">
				<div class="col-xs-12 wanteditems">
					<div class="col-xs-5 wantedbg">
						<div class="col-xs-12">
							<div class="col-xs-5 wantedcontent">
								<a href="WantedServlet?action=getOneWanted&idwanted=4"><h2>普心筆記</h2></a>
								<div>
									<h3>目前最高出價:</h3>
									<h3>$200/Day</h3>
								</div>
							</div>
							<div class="col-xs-5 wantedimg">
								<h4>截止時間:2017/06/20</h4>
								<a href="WantedServlet?action=getOneWanted&idwanted=4"><img src="img/wanted/4.png" alt=""></a>
								<button onclick="location.href='WantedServlet?action=getOneWanted&idwanted=4'">我要出價</button>
							</div>
						</div>
					</div>
					<div class="col-xs-5 wantedbg">
						<div class="col-xs-12">
							<div class="col-xs-5 wantedcontent">
								<a href="WantedServlet?action=getOneWanted&idwanted=11"><h2>相機</h2></a>
								<div>
									<h3>目前最高出價:</h3>
									<h3>$500/Day</h3>
								</div>
							</div>
							<div class="col-xs-5 wantedimg">
								<h4>截止時間:2017/07/30</h4>
								<a href="WantedServlet?action=getOneWanted&idwanted=11"><img src="img/wanted/11.png" alt=""></a>
								<button onclick="location.href='WantedServlet?action=getOneWanted&idwanted=11'">我要出價</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 wanteditems">
					<div class="col-xs-5 wantedbg">
						<div class="col-xs-12">
							<div class="col-xs-5 wantedcontent">
								<a href="WantedServlet?action=getOneWanted&idwanted=16"><h2>機車</h2></a>
								<div>
									<h3>目前最高出價:</h3>
									<h3>$1000/Day</h3>
								</div>
							</div>
							<div class="col-xs-5 wantedimg">
								<h4>截止時間:2017/07/15</h4>
								<a href="WantedServlet?action=getOneWanted&idwanted=16"><img src="img/wanted/16.png" alt=""></a>
								<button onclick="location.href='WantedServlet?action=getOneWanted&idwanted=16'">我要出價</button>
							</div>
						</div>
					</div>
					<div class="col-xs-5 wantedbg">
						<div class="col-xs-12">
							<div class="col-xs-5 wantedcontent">
								<a href="WantedServlet?action=getOneWanted&idwanted=18"><h2>音箱</h2></a>
								<div>
									<h3>目前最高出價:</h3>
									<h3>$50/Day</h3>
								</div>
							</div>
							<div class="col-xs-5 wantedimg">
								<h4>截止時間:2017/08/01</h4>
								<a href="WantedServlet?action=getOneWanted&idwanted=18"><img src="img/wanted/18.png" alt=""></a>
								<button onclick="location.href='WantedServlet?action=getOneWanted&idwanted=18'">我要出價</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-3 col-xs-offset-8 wantedpeople">
					<img src="img/homepage/wantedpeople.svg" alt="">
				</div>
			</div>
		</div>
		<!-- 捐贈 -->
		<div class="row donate">
			<div class="col-xs-12 donatetitle">
				<img class="col-xs-2" src="img/homepage/donate.svg">
				<h2>捐贈</h2>
			</div>
			<div class="container">
				<div class="col-xs-12 donateitems">
					<div class="col-xs-3 donatebg">
						<div class="donatename">
							<a href="ProductServlet?action=getOneProduct&idproduct=21"><h2>娃娃</h2></a> <a href="ProductServlet?action=getOneProduct&idproduct=21"><img
								src="img/products/21.png" alt=""></a>
						</div>
						<div class="donateplace">
							<h4>面交地點:</h4>
							<h4>商院一樓</h4>
						</div>
					</div>
					<div class="col-xs-3 col-xs-offset-1 donatebg">
						<div class="donatename">
							<a href="ProductServlet?action=getOneProduct&idproduct=20"><h2>吹風機</h2></a> <a href="ProductServlet?action=getOneProduct&idproduct=20"><img
								src="img/products/20.png" alt=""></a>
						</div>
						<div class="donateplace">
							<h4>面交地點:</h4>
							<h4>商院</h4>
						</div>
					</div>
					<div class="col-xs-3 col-xs-offset-1 donatebg">
						<div class="donatename">
							<a href="ProductServlet?action=getOneProduct&idproduct=22"><h2>臉盆</h2></a> <a href="ProductServlet?action=getOneProduct&idproduct=22"><img
								src="img/products/22.jpg" alt=""></a>
						</div>
						<div class="donateplace">
							<h4>面交地點:</h4>
							<h4>莊九</h4>
						</div>
					</div>
				</div>
				<div class="col-xs-12 donateitems">
					<div class="col-xs-3 donatebg">
						<div class="donatename">
							<a href="ProductServlet?action=getOneProduct&idproduct=19"><h2>鉛筆</h2></a> <a href="ProductServlet?action=getOneProduct&idproduct=19"><img
								src="img/products/19.png" alt=""></a>
						</div>
						<div class="donateplace">
							<h4>面交地點:</h4>
							<h4>莊一</h4>
						</div>
					</div>
					<div class="col-xs-3 col-xs-offset-1 donatebg">
						<div class="donatename">
							<a href="ProductServlet?action=getOneProduct&idproduct=36"><h2>工程計算機</h2></a> <a href="ProductServlet?action=getOneProduct&idproduct=36"><img
								src="img/products/36.png" alt=""></a>
						</div>
						<div class="donateplace">
							<h4>面交地點:</h4>
							<h4>商院</h4>
						</div>
					</div>
					<div class="col-xs-3 col-xs-offset-1 donatebg">
						<div class="donatename">
							<a href="ProductServlet?action=getOneProduct&idproduct=51"><h2>管理科學課本</h2></a> <a href="ProductServlet?action=getOneProduct&idproduct=51"><img
								src="img/products/51.png" alt=""></a>
						</div>
						<div class="donateplace">
							<h4>面交地點:</h4>
							<h4>商院</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- OurStory -->
			<img  src="img/homepage/ourstory1.svg">
	</div>
	<script src="js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<!-- <form action="ProductServlet" method="post" id="indexForm">
		<input type="hidden" name="action" value="indexToContent"> <input
			type="hidden" name="contentType" id="contentType">
	</form> -->
	<script src="js/bootstrap.min.js"></script>
</body>
<script>
	/*function submitIndexForm(contentType) {
		document.getElementById("contentType").value = contentType;
		
		document.getElementById("indexForm").submit();
	}*/
</script>
</html>