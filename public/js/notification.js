setTimeout("updateCountNotif()",100);
function updateCountNotif(){
	$.ajax({
		url:"http://localhost/utopia/users/countnotification",
		success:function(res){
			$("#count_notif").html($("#msg",res).html());
		}
	});
	setTimeout("updateCountNotif()",3000);	
}