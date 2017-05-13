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
									<img class="slide-image" src="img/index/resale banner.svg"
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
					<a href="#" onclick="submitIndexForm('contentshare');return false;"><img src="img/index/share.svg"
						width="60%"></a><br> <a style="text-decoration: none"
						href="#" onclick="submitIndexForm('contentshare');return false;"><h2
							style="text-align: center; color: black">分享</h2></a>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 lifecycleimg">
					<a href="contentresale.html"><img src="img/index/resale.svg"
						width="60%"></a><br> <a style="text-decoration: none"
						href="contentresale.html"><h2
							style="text-align: center; color: black">販售</h2></a>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 lifecycleimg">
					<a href="contentdonate.html"><img src="img/index/donate.svg"
						width="60%"></a><br> <a style="text-decoration: none"
						href="contentdonate.html"><h2
							style="text-align: center; color: black">捐贈</h2></a>
				</div>
			</div>
		</div>
		<!-- 熱門物品.活動 -->
		<div class="row hot">
			<div class="col-xs-12 hottitle">
				<img class="col-xs-2" src="img/homepage/hot.svg">
				<h2>熱門活動分類</h2>
			</div>
			<div class="col-xs-12 hotactivities">
				<div class="col-xs-2 hotactivity">
					<a href=""><h2>宿營</h2></a>
					<hr>
					<div class="hotactivityimg">
						<a href=""><img src="img/homepage/photo/宿營.jpg" title="中友宿營"></a>
					</div>
				</div>
				<div class="col-xs-2 hotactivity">
					<a href=""><h2>社團成發</h2></a>
					<hr>
					<div class="hotactivityimg">
						<a href=""><img src="img/homepage/photo/社團成發.jpg"
							title="啦啦隊成發"></a>
					</div>
				</div>
				<div class="col-xs-2 hotactivity">
					<a href=""><h2>之夜</h2></a>
					<hr>
					<div class="hotactivityimg">
						<a href=""><img src="img/homepage/photo/之夜.jpg" title="資管之夜"></a>
					</div>
				</div>
				<div class="col-xs-2 hotactivity">
					<a href=""><h2>文化盃</h2></a>
					<hr>
					<div class="hotactivityimg">
						<a href=""><img src="img/homepage/photo/文化盃.jpg" title="資管文化盃"></a>
					</div>
				</div>
			</div>
			<div class="col-xs-12 hottitle">
				<img class="col-xs-2" src="img/homepage/hot.svg">
				<h2>熱門商品</h2>
			</div>
			<div class="col-xs-12 hotgoods">
				<div class="col-xs-2 hotgood">
					<a href=""><h3>音箱</h3></a>
					<hr>
					<div class="hotgoodimg">
						<a href=""><img src="img/homepage/items/音箱.jpg"></a>
					</div>
				</div>
				<div class="col-xs-2 hotgood">
					<a href=""><h3>PS4</h3></a>
					<hr>
					<div class="hotgoodimg">
						<a href=""><img src="img/homepage/items/ps4.jpg"></a>
					</div>
				</div>
				<div class="col-xs-2 hotgood">
					<a href=""><h3>擴音器</h3></a>
					<hr>
					<div class="hotgoodimg">
						<a href=""><img src="img/homepage/items/擴音器.jpg"></a>
					</div>
				</div>
				<div class="col-xs-2 hotgood">
					<a href=""><h3>筆記</h3></a>
					<hr>
					<div class="hotgoodimg">
						<a href=""><img src="img/homepage/items/筆記.jpg"></a>
					</div>
				</div>
				<div class="col-xs-2 hotgood">
					<a href=""><h3>機車-G5</h3></a>
					<hr>
					<div class="hotgoodimg">
						<a href=""><img src="img/homepage/items/機車.jpg"></a>
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
								<img src="img/homepage/photo/arimura.jpg" alt="">
							</div>
							<div class="col-xs-6 shareid">
								<a href=""><h3>有村架純</h3></a>
							</div>
						</div>
						<div class="sharegood">
							<a href=""><h3>機車-G5</h3></a>
							<div class="sharegoodname">
								<a href=""><img src="img/homepage/items/機車.jpg" alt=""></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-4 sharecontent">
					<div class="shareinside">
						<div class="col-xs-12">
							<div class="col-xs-4 shareimg">
								<img src="img/homepage/photo/arimura.jpg" alt="">
							</div>
							<div class="col-xs-6 shareid">
								<a href=""><h3>有村架純</h3></a>
							</div>
						</div>
						<div class="sharegood">
							<a href=""><h3>機車-G5</h3></a>
							<div class="sharegoodname">
								<a href=""><img src="img/homepage/items/機車.jpg" alt=""></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-4 sharecontent">
					<div class="shareinside">
						<div class="col-xs-12">
							<div class="col-xs-4 shareimg">
								<img src="img/homepage/photo/arimura.jpg" alt="">
							</div>
							<div class="col-xs-6 shareid">
								<a href=""><h3>有村架純</h3></a>
							</div>
						</div>
						<div class="sharegood">
							<a href=""><h3>機車-G5</h3></a>
							<div class="sharegoodname">
								<a href=""><img src="img/homepage/items/機車.jpg" alt=""></a>
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
								<a href=""><h2>音箱</h2></a>
								<div>
									<h3>目前最高出價:</h3>
									<h3>$500/Day</h3>
								</div>
							</div>
							<div class="col-xs-5 wantedimg">
								<h4>截止時間:12hr23min</h4>
								<a href=""><img src="img/homepage/items/音箱.jpg" alt=""></a>
								<button>我要出價</button>
							</div>
						</div>
					</div>
					<div class="col-xs-5 wantedbg">
						<div class="col-xs-12">
							<div class="col-xs-5 wantedcontent">
								<a href=""><h2>音箱</h2></a>
								<div>
									<h3>目前最高出價:</h3>
									<h3>$500/Day</h3>
								</div>
							</div>
							<div class="col-xs-5 wantedimg">
								<h4>截止時間:12hr23min</h4>
								<a href=""><img src="img/homepage/items/音箱.jpg" alt=""></a>
								<button>我要出價</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 wanteditems">
					<div class="col-xs-5 wantedbg">
						<div class="col-xs-12">
							<div class="col-xs-5 wantedcontent">
								<a href=""><h2>音箱</h2></a>
								<div>
									<h3>目前最高出價:</h3>
									<h3>$500/Day</h3>
								</div>
							</div>
							<div class="col-xs-5 wantedimg">
								<h4>截止時間:12hr23min</h4>
								<a href=""><img src="img/homepage/items/音箱.jpg" alt=""></a>
								<button>我要出價</button>
							</div>
						</div>
					</div>
					<div class="col-xs-5 wantedbg">
						<div class="col-xs-12">
							<div class="col-xs-5 wantedcontent">
								<a href=""><h2>音箱</h2></a>
								<div>
									<h3>目前最高出價:</h3>
									<h3>$500/Day</h3>
								</div>
							</div>
							<div class="col-xs-5 wantedimg">
								<h4>截止時間:12hr23min</h4>
								<a href=""><img src="img/homepage/items/音箱.jpg" alt=""></a>
								<button>我要出價</button>
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
							<a href=""><h2>地燈</h2></a> <a href=""><img
								src="img/homepage/items/地燈.jpg" alt=""></a>
						</div>
						<div class="donateplace">
							<h4>面交地點:</h4>
							<h4>羅馬廣場</h4>
						</div>
					</div>
					<div class="col-xs-3 col-xs-offset-1 donatebg">
						<div class="donatename">
							<a href=""><h2>地燈</h2></a> <a href=""><img
								src="img/homepage/items/地燈.jpg" alt=""></a>
						</div>
						<div class="donateplace">
							<h4>面交地點:</h4>
							<h4>羅馬廣場</h4>
						</div>
					</div>
					<div class="col-xs-3 col-xs-offset-1 donatebg">
						<div class="donatename">
							<a href=""><h2>地燈</h2></a> <a href=""><img
								src="img/homepage/items/地燈.jpg" alt=""></a>
						</div>
						<div class="donateplace">
							<h4>面交地點:</h4>
							<h4>羅馬廣場</h4>
						</div>
					</div>
				</div>
				<div class="col-xs-12 donateitems">
					<div class="col-xs-3 donatebg">
						<div class="donatename">
							<a href=""><h2>地燈</h2></a> <a href=""><img
								src="img/homepage/items/地燈.jpg" alt=""></a>
						</div>
						<div class="donateplace">
							<h4>面交地點:</h4>
							<h4>羅馬廣場</h4>
						</div>
					</div>
					<div class="col-xs-3 col-xs-offset-1 donatebg">
						<div class="donatename">
							<a href=""><h2>地燈</h2></a> <a href=""><img
								src="img/homepage/items/地燈.jpg" alt=""></a>
						</div>
						<div class="donateplace">
							<h4>面交地點:</h4>
							<h4>羅馬廣場</h4>
						</div>
					</div>
					<div class="col-xs-3 col-xs-offset-1 donatebg">
						<div class="donatename">
							<a href=""><h2>地燈</h2></a> <a href=""><img
								src="img/homepage/items/地燈.jpg" alt=""></a>
						</div>
						<div class="donateplace">
							<h4>面交地點:</h4>
							<h4>羅馬廣場</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- OurStory -->
		<div class="row ourstory">
			<div class="col-xs-12 ourstorytitle">
				<img class="col-xs-2" src="img/homepage/ourstory.svg">
				<h2>OUR STORY</h2>
			</div>
		</div>
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