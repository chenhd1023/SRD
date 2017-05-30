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
<%@ page import="com.srd.vo.SrbAccountVO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/selfPageCss.css" rel="stylesheet">
    <style>
        body{
            background-color: #C4E6F5;
        }
        div{
            text-align: center;
        }
    </style>
</head>
<script>
function codeAddress(){
	var stateObj = { foo: "bar" };
	history.pushState(stateObj, "page 2", "AccountServlet?${url}");
}
</script>
<body onload="codeAddress();">
    <div class="content" id="content">        
        <div class="container">
            <div class="person col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                	<p>&nbsp</p>
                	<p>&nbsp</p>
                    <img src="${accountVO.getPhoto()}" width=50%>
                </div>
                <div id="information" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                	<br>
                	<br>
                	<br>
                	<br>
                    <p>${accountVO.getName()}</p>
                    <div id="informationblock">
                        <a href="CommentServlet?action=commentdone&accountid=${accountVO.getAccountid()}"><p style="color:black">借物/評論紀錄</p></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="watermark col-xs-6 col-xs-offset-3">
            <img src="img/personalPage/product.svg">
        </div>

        <div class="container"> 
        	<c:forEach var="vo" items="${products}">
	            <div class="row">
	                <div class="productRow">
		                <c:if test="${vo.size()>0}">
							<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="background-color: #F7E9DB">
		                        <a href="ProductServlet?action=getOneProduct&idproduct=${vo.get(0).getIdproduct()}"><img src="${vo.get(0).getPicture1()}" width="100%"></a>
		                    </div>
						</c:if>
						<c:if test="${vo.size()>1}">
							<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="background-color: #CAB8C3">
		                        <a href="ProductServlet?action=getOneProduct&idproduct=${vo.get(0).getIdproduct()}"><img src="${vo.get(1).getPicture1()}" width="100%"></a>
		                    </div>
						</c:if>
						<c:if test="${vo.size()>2}">
							<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="background-color: #D8D9D9">
		                        <a href="ProductServlet?action=getOneProduct&idproduct=${vo.get(0).getIdproduct()}"><img src="${vo.get(2).getPicture1()}" width="100%"></a>
		                    </div>
						</c:if>
	                </div>
	            </div>
			</c:forEach>
        </div>
    </div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/selfPageJs.js"></script>
</body>
</html>