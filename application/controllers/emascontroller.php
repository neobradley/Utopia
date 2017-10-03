<?php

class EmasController extends VanillaController {
	
	function beforeAction () {		$this->set('username',performAction('users','isLogin',array()));		$this->set('id',$_SESSION['id']);		$this->set('type',$_SESSION['type']);		$_SESSION['module']='ema';
	}
	
	function index() {		if($type=="student"):					else:		endif;
	}

	function afterAction() {

	}


}