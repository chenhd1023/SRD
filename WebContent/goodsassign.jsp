<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${'success'==login}">
	<%@ include file="navbarlogin.jsp"%>
</c:if>
<c:if test="${'success'!=login}">
	<%@ include file="navbarlogout.jsp"%>
</c:if>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>goodsassign</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/goodsassignCss.css" rel="stylesheet">
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
</head>

<body>
    <div class="container">
        <div class="row table col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <form class="form-horizontal" role="form" action="ProductServlet" method="post" id="insertProduct">
                <div class="form-group">
                    <label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">物品名稱</label>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input type="text" class="form-control" placeholder="物品名稱" name="name">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">可用時間</label>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <table class="calendar">
                            <tr>
                                <th>
                                    <button type="button" onclick="changemonth(-1)">
                                        <</button>
                                </th>
                                <th colspan="5" id="titleyearmonth"></th>
                                <th>
                                    <button type="button" onclick="changemonth(1)">></button>
                                </th>
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
                <div class="form-group">
                    <label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">價格&nbspNT</label>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input type="text" class="form-control" placeholder="金額" name="price">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">物品敘述</label>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <textarea type="textarea" class="form-control" id="inputPassword3" placeholder="物品敘述" name="describe"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">可否買斷</label>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input type="radio" name="buy">可
                        <input type="radio" name="buy" checked>否
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">物品照片</label>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        
                            <input type='file' class="upl">
                            <div>
                                <img class="preview" style="max-width: 150px; max-height: 150px;">
                                <div class="size"></div>
                            </div>
                        
                    </div>
                </div>
                <input type="hidden" name="owner" value="${accountid}">
                <input type="hidden" name="action" value="insert">
            </form>
        </div>
        <div class="row submit col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="col-xs-offset-7 col-sm-offset-7 col-md-offset-7 col-lg-offset-7 col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <img src="img/signup/signupicon.svg">
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <div class="button">
                    <a href="javascript:;" onclick="submitProductForm()"><h3>提交</h3></a>
                </div>
            </div>
        </div>
    </div>
</body>

<script src="js/goodsassignJs.js"></script>
<script>
function submitProductForm() {
	selectedString="";
	for (var i = 0; i < selectedArray.length; i++) {
		selectedString=selectedString+"+"+selectedArray[i];
    }
	alert(selectedString);
    document.getElementById("insertProduct").submit();
}
</script>
</html>
