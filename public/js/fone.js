function loadTag(to){
	file_id=$("#file_id").val();
	$.ajax({
		type:'post',
		url:to,
		data:'file_id='+file_id,
		datatype:'html',
		success:function(res){
			$("#tags").html($("#msg",res).html());
		}
	});
}

function setTag(e){
	file_id=$("#file_id").val();
	mod_id=$(e).parent().attr('id');
	$.ajax({
		type:'post',
		url:'../settag',
		data:'id='+file_id+'&mod='+mod_id,
		success:function(res){
			loadTag('../tag');
		}
	});
}