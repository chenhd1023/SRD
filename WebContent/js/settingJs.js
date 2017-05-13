function checkpwd1(){
	var pwd = document.form1.pwd1.value;
	if(pwd==""){
		document.getElementById("pwd1msg").innerHTML = "請輸入密碼!";
		document.form1.pwd1.focus();
		return false;
	}else{
		document.getElementById("pwd1msg").innerHTML = "";
	}
}
function checkpwd2(){
	var p1 = document.form1.pwd1.value;
	var p2 = document.form1.pwd2.value;
	if(p1!=p2){
		document.getElementById("pwd2msg").innerHTML = "兩次密碼輸入不同，請重新輸入!";
		return false;
	}else{
		document.getElementById("pwd2msg").innerHTML = "";
	}
}
function checkPhone(){
	var phone = document.form1.Phone.value;
	var re = /^[09]{2}[0-9]{8}$/;
	if(phone==""){
		document.getElementById("phonemsg").innerHTML = "請輸入手機號碼!";
		document.form1.Phone.focus();
		return false;
	}if(!re.test(phone)){
		document.getElementById("phonemsg").innerHTML = "手機格式不正確，請重新輸入!";
		document.form1.Phone.focus();
		return false;
	}else{
		document.getElementById("phonemsg").innerHTML = "";
	}
}
$(function (){
 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
 
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
 
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})