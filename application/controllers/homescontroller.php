<?php

class HomesController extends VanillaController {
	
	function beforeAction () {
	}
	
	function about(){
	
	}
	
	function contact(){
	
	}
	
	function recover(){
	}
	
	function login(){
		if(isset($_POST['username']))$username=$_POST['username'];
		if(isset($_POST['password']))$password=$_POST['password'];
		
		if(isset($username)&&isset($password)){
			$login = $this->Home->custom("select * from users where username = '$username' and password = '$password'");
			$hasAccount = @count($login[0]);
			
			if($hasAccount==1){
				session_start();
				$_SESSION['username']=$username;
				$_SESSION['id']=$login[0]['User']['id'];
				$_SESSION['type']=$login[0]['User']['type'];
				header("location:".ip."utopia/users/index");
			}
			else{
				//$this->set('message',$login);
				$this->set('message','Invalid username / password.');
			}
		}else{
			$this->set('message','Please login first.');
		}
	}
	
	function loginerror(){
		
	}
	
	function index() {
		session_start();
		if(isset($_SESSION['username'])){
			unset($_SESSION['username']);
		}
	}

	function afterAction() {

	}


}