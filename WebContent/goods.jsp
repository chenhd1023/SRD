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
				<!-- <div class="col-xs-12 smallimg">
					<div class="col-xs-2">
						<img src="${productVO.getPicture1()}" class="change" >
					</div>
					<div class="col-xs-2">
						<img src="${productVO.getPicture1()}" class="change" >
					</div>
					<div class="col-xs-2">
						<img src="${productVO.getPicture1()}" class="change" >
					</div>
					<div class="col-xs-2">
						<img src="${productVO.getPicture1()}" class="change" >
					</div>
				</div> -->
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
							評價 : <span>${commentPersonScore}</span>
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
					<!-- <p>
						商品分類 : <a href="">之夜</a>
					</p> -->
					<p>
						物品狀況 : <span>${productVO.getDescribe()}</span>
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
								<td  id="x0y0"></td>
								<td  id="x1y0"></td>
								<td  id="x2y0"></td>
								<td  id="x3y0"></td>
								<td  id="x4y0"></td>
								<td  id="x5y0"></td>
								<td  id="x6y0"></td>
							</tr>
							<tr>
								<td  id="x0y1"></td>
								<td  id="x1y1"></td>
								<td  id="x2y1"></td>
								<td  id="x3y1"></td>
								<td  id="x4y1"></td>
								<td  id="x5y1"></td>
								<td  id="x6y1"></td>
							</tr>
							<tr>
								<td  id="x0y2"></td>
								<td  id="x1y2"></td>
								<td  id="x2y2"></td>
								<td  id="x3y2"></td>
								<td  id="x4y2"></td>
								<td  id="x5y2"></td>
								<td  id="x6y2"></td>
							</tr>
							<tr>
								<td  id="x0y3"></td>
								<td  id="x1y3"></td>
								<td  id="x2y3"></td>
								<td  id="x3y3"></td>
								<td  id="x4y3"></td>
								<td  id="x5y3"></td>
								<td  id="x6y3"></td>
							</tr>
							<tr>
								<td  id="x0y4"></td>
								<td  id="x1y4"></td>
								<td  id="x2y4"></td>
								<td  id="x3y4"></td>
								<td  id="x4y4"></td>
								<td  id="x5y4"></td>
								<td  id="x6y4"></td>
							</tr>
							<tr>
								<td  id="x0y5"></td>
								<td  id="x1y5"></td>
								<td  id="x2y5"></td>
								<td  id="x3y5"></td>
								<td  id="x4y5"></td>
								<td  id="x5y5"></td>
								<td  id="x6y5"></td>
							</tr>
						</table>
						<input type="hidden" id="monthnow">
					</div>
				</div>
				<div class="detailinf2 detailhiden">
				<c:if test="${commentVOs.size()==0}">
					<p>目前無相關評價</p>
				</c:if>
				<c:if test="${commentVOs.size()!=0}">
					<table class="table">
						<tr>
							<th>用戶 ID</th>
							<th>評價分數</th>
							<th>評價內容</th>
							<th>評價時間</th>
						</tr>
					<c:forEach var="vo" items="${commentVOs}">
						<tr>
							<td>${vo.getAccountid()}</td>
							<td>${vo.getScore()}</td>
							<td>${vo.getDiscription()}</td>
							<td>${vo.getDate()}</td>
						</tr>
					</c:forEach>
					</table>
				</c:if>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
$(function() {
	$('.change').click(function() {
		var src = $(this).attr('src');
		$('#show').attr('src', src);
	});
});
$(function() {
	$('.clicktitle1').click(function() {
		$('.clicktitle1').addClass('detailtitleborder');
		$('.clicktitle2').removeClass('detailtitleborder');
		$('.detailinf1').removeClass('detailhiden');
		$('.detailinf2').addClass('detailhiden');
	});
});
$(function() {
	$('.clicktitle2').click(function() {
		$('.clicktitle2').addClass('detailtitleborder');
		$('.clicktitle1').removeClass('detailtitleborder');
		$('.detailinf2').removeClass('detailhiden');
		$('.detailinf1').addClass('detailhiden');
	});
});
var rentdays = "${productVO.getRentdays()}";
var selectedArray = rentdays.slice(5).split("+2017");
//init date
(function() {
	function daysInMonth(month, year) {
		return new Date(year, month, 0).getDate();
	}
	var today = new Date();
	var todate = today.getDate();
	var tomonth = today.getMonth();
	document.getElementById("monthnow").value = today;
	var monthList = [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月",
			"十月", "十一月", "十二月" ];
	var titleyearmonth = document.getElementById("titleyearmonth");
	titleyearmonth.innerHTML = today.getFullYear() + monthList[tomonth];
	var tomonthFirst = new Date();
	tomonthFirst.setDate(1);
	var daysInMonth = daysInMonth(tomonth, today.getFullYear());

	var tdxbegin = tomonthFirst.getDay();
	var tdybegin = 0;
	if (tdxbegin < 1) {
		tdybegin = 1;
	}
	var daysPutinTable = 1;
	var daysPutinTableBefore;
	var dateInMonthBefore = new Date();
	dateInMonthBefore.setDate(0);
	var daysInMonthBefore = dateInMonthBefore.getDate();
	var daysPutinTableAfter = 1;
	if (tdxbegin > 0) {
		daysPutinTableBefore = daysInMonthBefore - tdxbegin + 1;
	} else {
		daysPutinTableBefore = daysInMonthBefore - 7 + 1;
	}
	for (var tdy = 0; tdy < 6; tdy++) {
		for (var tdx = 0; tdx < 7; tdx++) {
			if ((tdy > tdybegin && daysPutinTable <= daysInMonth)
					|| (tdy == tdybegin && tdx >= tdxbegin)) {
				var tds = document.getElementById("x" + tdx + "y" + tdy);
				tds.innerHTML = daysPutinTable;
				if (checkInMonth(tomonth+1,daysPutinTable)) {
					tds.className = "isDateHasS";
				} else {
					tds.className = "isDate";
				}
				daysPutinTable++;
			} else {
				var tds = document.getElementById("x" + tdx + "y" + tdy);
				if (daysPutinTable == 1) {
					tds.innerHTML = daysPutinTableBefore;
					daysPutinTableBefore++;
				} else {
					tds.innerHTML = daysPutinTableAfter;
					daysPutinTableAfter++;
				}
				tds.className = "notDate";
			}
		}
	}
})();
function checkInMonth(month,date){
	var retval = false;
	for (var i = 0; i < selectedArray.length; i++) {
		
		if(selectedArray[i]==("-"+month+"-"+date)){
			retval=true;
		}
	}
	return retval;
}
function checkInMonth2(month,date){
	var retval = false;
	//alert("-"+month+"-"+date);
	for (var i = 0; i < selectedArray.length; i++) {
		//alert("selectedArray"+selectedArray[i]);
		if(selectedArray[i]==("-"+month+"-"+date)){
			retval=true;
		}
	}
	return retval;
}
function changemonth(change) {
	var thisday = new Date(document.getElementById("monthnow").value);
	var monthresult = thisday.getMonth() + change;
	if (monthresult == -1) {
		thisday.setDate(1);
		thisday.setFullYear(thisday.getFullYear() - 1);
		thisday.setMonth(11);
	} else if (monthresult == 12) {
		thisday.setDate(1);
		thisday.setFullYear(thisday.getFullYear() + 1);
		thisday.setMonth(0);
	} else {
		thisday.setDate(1);
		thisday.setMonth(monthresult);
	}
	var thismonth = thisday.getMonth();
	var utctoday = Date.now();
	var ninetydays = Date.now() + 7776000000;
	document.getElementById("monthnow").value = thisday;
	var monthList = [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月",
			"十月", "十一月", "十二月" ];
	var titleyearmonth = document.getElementById("titleyearmonth");
	titleyearmonth.innerHTML = thisday.getFullYear() + monthList[thismonth];
	var thismonthFirstDate = new Date(thisday);
	thismonthFirstDate.setDate(1);
	var daysInMonth = new Date(thisday.getFullYear(), thisday.getMonth() + 1, 0)
			.getDate();
	var tdxbegin = thismonthFirstDate.getDay();
	var tdybegin = 0;
	if (tdxbegin < 1) {
		tdybegin = 1;
	}
	var daysPutinTable = 1;
	var daysPutinTableBefore;
	var dateInMonthBefore = new Date(thisday);
	dateInMonthBefore.setDate(0);
	var daysInMonthBefore = dateInMonthBefore.getDate();
	var daysPutinTableAfter = 1;
	if (tdxbegin > 0) {
		daysPutinTableBefore = daysInMonthBefore - tdxbegin + 1;
	} else {
		daysPutinTableBefore = daysInMonthBefore - 7 + 1;
	}
	for (var tdy = 0; tdy < 6; tdy++) {
		for (var tdx = 0; tdx < 7; tdx++) {
			if ((tdy > tdybegin && daysPutinTable <= daysInMonth)
					|| (tdy == tdybegin && tdx >= tdxbegin)) {
				var tds = document.getElementById("x" + tdx + "y" + tdy);
				tds.innerHTML = daysPutinTable;
				var d = new Date(thisday.getFullYear(), thisday.getMonth(),
						daysPutinTable);
				var utcdate = d.getTime();
				
				if (checkInMonth2(monthresult+1,daysPutinTable)) {
					tds.className = "isDateHasS";
				}  else {
					tds.className = "isDate";
				}
				daysPutinTable++;
			} else {
				var tds = document.getElementById("x" + tdx + "y" + tdy);
				if (daysPutinTable == 1) {
					tds.innerHTML = daysPutinTableBefore;
					daysPutinTableBefore++;
				} else {
					tds.innerHTML = daysPutinTableAfter;
					daysPutinTableAfter++;
				}
				tds.className = "notDate";
			}
		}
	}
}
function testSelected(input) {
	for (var i = 0; i < selectedArray.length; i++) {
		if (selectedArray[i] == input) {
			return true;
		}
	}
}
function selectFunction(elmnt) {
	var classname = elmnt.className;
	if ("isDateCanSelect" == classname) {
		select(elmnt);
		var thisday = new Date(document.getElementById("monthnow").value);
		selectedArray.push(thisday.getFullYear() + "-" + thisday.getMonth()
				+ "-" + elmnt.innerHTML);
	}
	if ("isDateHasS" == classname) {
		disselect(elmnt);
		var thisday = new Date(document.getElementById("monthnow").value);
		for (var i = 0; i < selectedArray.length; i++) {
			if (selectedArray[i] == (thisday.getFullYear() + "-"
					+ thisday.getMonth() + "-" + elmnt.innerHTML)) {
				selectedArray.splice(i, 1);
			}
		}
	}
}
function select(elmnt) {
	elmnt.className = "isDateHasS";
}
function disselect(elmnt) {
	elmnt.className = "isDateCanSelect";
}
</script>
</html>