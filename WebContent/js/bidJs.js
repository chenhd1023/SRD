
	//預設原圖大小為100%
	var percent = 100;
	//縮放圖片用，參數obj為欲被縮放的圖片id
	function zoomPic(obj){
		//判斷滾輪是往上滾則加10%
		if (event.wheelDelta >= 120)	percent +=10;
		//若是往下滾則減10%，但最小是10%
		else if (event.wheelDelta <= -120  && percent >10)	percent -=10; 
		//縮放圖片用zoom
		document.getElementById(obj).style.zoom = percent + "%";
		//回傳false好讓頁面不會跟著滾輪上下滾
		return false;
	}
//-->
$(document).ready(function(){
$("#dialog").css("display","none");
$("#msg").css("display","none");
$("#dialog").css("opacity","0.5");

});

function closeDialog(){
$("#dialog").css("display","none");
$("#msg").css("display","none");
}
function showDialog(){
   /*秀出對話框*/
$("#dialog").css("display","");
$("#msg").css("display","");
        
var w=$("#msg").width();
var h=$("#msg").height();
var _top=_sh/2-h/2+$(document).scrollTop();//更好的方法 使用jQuery解決
var _left=_sw/2-w/2;
   /*設定視窗出現位置*/  
$("#msg").css("top",_top+'px');
$("#msg").css("left",_left+'px');
}


$(document).ready(function(){
$("#dialog2").css("display","none");
$("#msg2").css("display","none");
$("#dialog2").css("opacity","0.5");

});

function closeDialog2(){
$("#dialog2").css("display","none");
$("#msg2").css("display","none");
}
function showDialog2(){
   /*秀出對話框*/
$("#dialog2").css("display","");
$("#msg2").css("display","");
        
var w=$("#msg2").width();
var h=$("#msg2").height();
var _top=_sh/2-h/2+$(document).scrollTop();//更好的方法 使用jQuery解決
var _left=_sw/2-w/2;
   /*設定視窗出現位置*/  
$("#msg2").css("top",_top+'px');
$("#msg2").css("left",_left+'px');
}
