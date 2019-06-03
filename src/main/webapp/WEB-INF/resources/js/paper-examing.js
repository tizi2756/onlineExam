$(document).ready(function(){
	
	var starttime = new Date();
	var totaltime=3600000;
  
	setInterval(function () {
	var day = parseInt(totaltime / 1000 / 60 / 60 / 24);
	var hour = parseInt(totaltime / 1000 / 60 / 60 % 24);
	var minute = parseInt(totaltime / 1000 / 60 % 60);
	var seconds = parseInt(totaltime / 1000 % 60);
	  $('#count_time').html(day + "天" + hour + "小时" + minute + "分钟" + seconds + "秒");
	  totaltime=totaltime-1000;
	  
	  if(totaltime<0){
		  $("#myForm").submit();
	  }
	}, 1000);

	$("#question-submit button").click(function(){
		$("#myForm").submit();
	})

})