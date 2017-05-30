<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signupCss.css" rel="stylesheet">
<link href="css/croppie.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/croppie.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var $uploadCrop;

		function readFile(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$uploadCrop.croppie('bind', {
						url : e.target.result
					});
					$('.upload-demo').addClass('ready');
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		$uploadCrop = $('#upload-demo').croppie({
			viewport : {
				width : 200,
				height : 200
			},
			boundary : {
				width : 300,
				height : 300
			}
		});

		$('#upload').on('change', function() {
			readFile(this);
		});
		$('.upload-result').on('click', function(ev) {
			$uploadCrop.croppie('result', {
				type : 'canvas',
				size : 'original'
			}).then(function(resp) {
				$('#imagebase64').val(resp);
				//$('#action').val(resp);
				$('#form').submit();
			});
		});

	});
</script>
</head>
<body>
	<div class="container">
		<div class="row table col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<p>&nbsp</p>
			<form class="form-horizontal" role="form" name="form" id="form" action="AccountServlet" method="post">
				<div class="form-group">
					<label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">上傳照片</label>
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<input type="file" id="upload" value="Choose a file">
					</div>
				</div>
				<div class="form-group">
					<div id="upload-demo"></div>
				</div>
				<div class="row submit col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="col-xs-offset-8 col-xs-2">
						<div class="button">
							<input type="hidden" id="imagebase64" name="imagebase64">
							<input type="hidden" name="accountid" value="${accountid}"> 
							<input type="hidden" name="action" value="updatePhoto"> 
							<a href="#" class="upload-result">Send</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="js/settingJs.js"></script>
</html>