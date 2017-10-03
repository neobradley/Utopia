function check(){
	username = document.getElementById('username').value;
	password = document.getElementById('password').value;
	if(username.length>0&&password.length>0){
		return true;
	}else{
		alert('Username or password should not be blank');
		document.getElementById('password').value = "";
	}
	return false;
}