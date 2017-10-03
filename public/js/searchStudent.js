function search(){
	room = $("#room").val();
	word = $("#search").val();
	$.ajax({
		type:"post",
		url:"../search",
		data:"room="+room+"&word="+word,
		datatype:"html",
		success:function(res){
			$("#searchOut").html($("#msg",res));
		}
	});
}

function add(e){
	setMember(e,'add');
}

function remove(e){
	setMember(e,'remove');
}

function setMember(e,action){
	id=$(e).parent().attr('id');
	room = $("#room").val();
	$.ajax({
		type:'post',
		url:'../setMember',
		data:'room='+room+'&id='+id+'&action='+action
	});
	search();
}