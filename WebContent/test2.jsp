<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Test</title>
<link href="css/croppie.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/croppie.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var $uploadCrop = null;

		function readFile(input) {
			$i = 0;
			while (input.files && input.files[$i] && $i < 4) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$uploadCrop.croppie('bind', {
						url : e.target.result
					});
					$('.upload-demo1').addClass('ready');
					$('.upload-demo2').addClass('ready');
					$('.upload-demo3').addClass('ready');
				}
				reader.readAsDataURL(input.files[$i]);
				$i=$i+1;
			}
		}

		$uploadCrop = $('#upload-demo1').croppie({
			viewport : {
				width : 200,
				height : 200,
			//type: 'circle'
			},
			boundary : {
				width : 300,
				height : 300
			}
		});

		$uploadCrop = $('#upload-demo2').croppie({
			viewport : {
				width : 200,
				height : 200,
			//type: 'circle'
			},
			boundary : {
				width : 300,
				height : 300
			}
		});

		$uploadCrop = $('#upload-demo3').croppie({
			viewport : {
				width : 200,
				height : 200,
			//type: 'circle'
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
				$('#form').submit();
			});
		});

	});
</script>
</head>
<body>
	<form action="Base64Servlet" id="form" method="post">
		<input type="file" id="upload" value="Choose a file">
		<table>

			<tr>
				<td><div id="upload-demo1"></div></td>
				<td><div id="upload-demo2"></div></td>
				<td><div id="upload-demo3"></div></td>
			</tr>

		</table>
		
		
		
		<input type="hidden" id="imagebase64" name="imagebase64"> <a
			href="#" class="upload-result">Send</a>
	</form>
</body>
</html>