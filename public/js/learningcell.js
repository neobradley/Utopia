$("#empty").hide();
$("#textarea").focus();
setTimeout("update()",500);
function update(){
	message_id=$("#message_id").val();
	//reply_id=$("#reply_id").val();
	$.ajax({
		type:"post",
		url:"../loadmessage",
		data:"id="+message_id,
		dataType:"html",
		success:function(res){
			//alert($("#last_id",$(res)).html());
			//alert($("#msg",$(res)).html());
			if($("#msg",res).html()!=""){
				$("#message_id").val($("#last_id",res).html());
				$("#wall").prepend($("#msg",res).html());
				/*$("#wall li:first").hide();
				$("#wall li:first").fadeIn();*/
				setTimeout("update()",100);
			}else
				setTimeout("update()",100);
		}
	});
	checkEmpty();
	
}
function checkEmpty(){
	//alert($("#notifs li").size());
	if($("#wall li").size()==0){
		$("#empty").fadeIn(1500);
	}else{
		$("#empty").hide();
	}
}
function remove(e){
	m=$(e);
	id=m.parent().attr('id');
	if(confirm("Are you going to remove this message?")){
		$.ajax({
			type:"post",
			url:"../removemessage",
			data:"id="+id,
			datatype:"html",
			success:function(res){
				if($("#error",res).html().length==0){
					$(m.parent().parent()).fadeOut();
					$(m.parent().parent()).remove();
					checkEmpty();
				}else
					alert($("#error",res).html());
			}
		});
	}
}

$("#post").click(function(){post();});
checkEnter();
$("#enter").click(function(){
	checkEnter();
});
function checkEnter(){
	if($("#enter").attr("checked")){
		$("#textarea").keyup(function(e){if(e.keyCode==13)post();});
	}else{
		$("#textarea").unbind('keyup');
	}
}

function post(){
	msg=$.trim($("#textarea").val());
	if(msg.length>0){
		$.ajax({
			type:"post",
			url:"../addmessage",
			data:"msg="+msg,
			datatype:"html",
			success:function(res){
				if($("#error",res).html().length>0){
					alert($("#error",res).html());
					location.reload();
				}
				/*$("#wall li:first").hide();
				$("#wall li:first").fadeIn();*/
			}
		});
		$("#textarea").val("");
	}
}

function star(e){
	m=$(e);
	id=m.parent().attr('id');
	current=m.val();
	next=current=="Star"?"Unstar":"Star";
	$.ajax({
		type:'post',
		url:'../starmessage',
		data:'id='+id+'&star='+current,
		datatype:'html',
		success:function(res){
			if($("#error",res).html().length==0){
				m.val(next);
			}else{
				alert($("#error",res).html());
			}
		}
	});
}

setTimeout("updateMedia()",0);
function updateMedia(id){
	$.ajax({
		type:'post',
		url:'../loadMedia',
		data:'id='+id,
		datatype:'html',
		success:function(res){
			$("#media").html($("#msg",$(res)).html());
		}
	});
}

function changeMedia(e){
	updateMedia($(e).val());
}

function create(){
	if($("#title").val().length!=0 && $("#quota").val().length!=0)
		return true;
	alert('Please fill up all fields');	
	return false;
}