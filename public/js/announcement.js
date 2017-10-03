$("#notifs").hide();
$("#empty").hide();
setTimeout("load()",0);
setTimeout("unlock()",1000);
function unlock(){
	$("#notifs").show();
	$("#loading").hide();
}
function load(){
	id=$("#notif_id").val();
	$.ajax({
		type:"post",
		url:"loadnotif",
		data:"id="+id,
		dataType:"html",
		success:function(res){
			//alert($("#msg",$(res)).html());
			$("#notif_id").val($("#last_id",$(res)).html());
			if($("#msg",$(res)).html()!="<div></div>"){
				$("#notifs").prepend($("#msg",$(res)).html());
				$('#close').click(function(){
					remove($(this).parent().parent().attr('id'));
					$(this).parent().parent().parent().remove();
					checkEmpty();
				});
				//$("#notifs li:first").hide();
				//$("#notifs li:first").fadeIn();
			}
			setTimeout("load()",100);
		}
	});
	checkEmpty();
}
function checkEmpty(){
	//alert($("#notifs li").size());
	if($("#notifs li").size()==0){
		$("#empty").fadeIn(1500);
	}else{
		$("#empty").hide();
	}
}
function remove(id){
	$.ajax({
		type:"post",
		url:"checkNotif",
		data:"id="+id
	});
}