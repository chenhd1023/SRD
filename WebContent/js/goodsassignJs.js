var selectedArray = [];
	//init date
	(function () {
		function daysInMonth(month,year) {
			return new Date(year, month, 0).getDate();
		}
		var today = new Date();
		var todate = today.getDate();
		var tomonth = today.getMonth();
		document.getElementById("monthnow").value = today;
		var monthList = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"];
		var titleyearmonth = document.getElementById("titleyearmonth");
		titleyearmonth.innerHTML = today.getFullYear()+monthList[tomonth];
		var tomonthFirst =  new Date();
		tomonthFirst.setDate(1);
		var daysInMonth = daysInMonth(tomonth,today.getFullYear());
		
		var tdxbegin = tomonthFirst.getDay();
		var tdybegin = 0;
		if (tdxbegin<1) {
			tdybegin =1;
		}
		var daysPutinTable = 1;
		var daysPutinTableBefore;
		var dateInMonthBefore = new Date();
		dateInMonthBefore.setDate(0);
		var daysInMonthBefore = dateInMonthBefore.getDate();
		var daysPutinTableAfter = 1;
		if (tdxbegin>0) {
			daysPutinTableBefore = daysInMonthBefore-tdxbegin+1;
		} else {
			daysPutinTableBefore = daysInMonthBefore-7+1;
		}
		for (var tdy = 0; tdy < 6; tdy++){
			for (var tdx = 0; tdx < 7; tdx++) {
				if ((tdy>tdybegin&&daysPutinTable<=daysInMonth)||(tdy==tdybegin&&tdx>=tdxbegin)) {
					var tds = document.getElementById("x"+tdx+"y"+tdy);
					tds.innerHTML = daysPutinTable;
					if (daysPutinTable<=todate) {
						tds.className = "isDate";
					} else {
						tds.className = "isDateCanSelect";
					}
					daysPutinTable++;
				} else {
					var tds = document.getElementById("x"+tdx+"y"+tdy);
					if (daysPutinTable==1) {
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
	function changemonth(change) {
		var thisday = new Date(document.getElementById("monthnow").value);
		var monthresult = thisday.getMonth()+change;
		if (monthresult==-1) {
			thisday.setDate(1);
			thisday.setFullYear(thisday.getFullYear()-1);
			thisday.setMonth(11);
		} else if (monthresult==12){
			thisday.setDate(1);
			thisday.setFullYear(thisday.getFullYear()+1);
			thisday.setMonth(0);
		} else{
			thisday.setDate(1);
			thisday.setMonth(monthresult);
		}
		var thismonth = thisday.getMonth();
		var utctoday = Date.now();
		var ninetydays = Date.now()+7776000000;
		document.getElementById("monthnow").value = thisday;
		var monthList = ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"];
		var titleyearmonth = document.getElementById("titleyearmonth");
		titleyearmonth.innerHTML = thisday.getFullYear()+monthList[thismonth];
		var thismonthFirstDate = new Date(thisday);
		thismonthFirstDate.setDate(1);
		var daysInMonth = new Date(thisday.getFullYear(),thisday.getMonth()+1,0).getDate();
		var tdxbegin = thismonthFirstDate.getDay();
		var tdybegin = 0;
		if (tdxbegin<1) {
			tdybegin =1;
		}
		var daysPutinTable = 1;
		var daysPutinTableBefore;
		var dateInMonthBefore = new Date(thisday);
		dateInMonthBefore.setDate(0);
		var daysInMonthBefore = dateInMonthBefore.getDate();
		var daysPutinTableAfter = 1;
		if (tdxbegin>0) {
			daysPutinTableBefore = daysInMonthBefore-tdxbegin+1;
		} else {
			daysPutinTableBefore = daysInMonthBefore-7+1;
		}
		for (var tdy = 0; tdy < 6; tdy++){
			for (var tdx = 0; tdx < 7; tdx++) {
				if ((tdy>tdybegin&&daysPutinTable<=daysInMonth)||(tdy==tdybegin&&tdx>=tdxbegin)) {
					var tds = document.getElementById("x"+tdx+"y"+tdy);
					tds.innerHTML = daysPutinTable;
					var d = new Date(thisday.getFullYear(),thisday.getMonth(),daysPutinTable);
					var utcdate = d.getTime();
					if (utcdate<=utctoday||utcdate>=ninetydays) {
						tds.className = "isDate";
					} else if (testSelected((thisday.getFullYear()+"-"+thismonth+"-"+daysPutinTable))) {
						tds.className = "isDateHasS";
					} else {
						tds.className = "isDateCanSelect";
					}
					daysPutinTable++;
				} else {
					var tds = document.getElementById("x"+tdx+"y"+tdy);
					if (daysPutinTable==1) {
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
	function testSelected(input){
		for (var i = 0; i < selectedArray.length; i++) {
			if(selectedArray[i]==input){
				return true;
			}
		}
	}
	function selectFunction(elmnt){
		var classname = elmnt.className;
		if ("isDateCanSelect"==classname) {
			select(elmnt);
			var thisday = new Date(document.getElementById("monthnow").value);
			selectedArray.push(thisday.getFullYear()+"-"+thisday.getMonth()+"-"+elmnt.innerHTML);
		}
		if ("isDateHasS"==classname) {
			disselect(elmnt);
			var thisday = new Date(document.getElementById("monthnow").value);
			for (var i = 0; i < selectedArray.length; i++) {
				if (selectedArray[i]==(thisday.getFullYear()+"-"+thisday.getMonth()+"-"+elmnt.innerHTML)) {
					selectedArray.splice(i, 1);
				}
			}
		}
	}
	function select(elmnt){
		elmnt.className="isDateHasS";
	}
	function disselect(elmnt){
		elmnt.className="isDateCanSelect";
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