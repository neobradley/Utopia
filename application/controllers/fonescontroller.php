<?php

class FonesController extends VanillaController {
	
	function beforeAction () {
		$this->set('username',performAction('users','isLogin',array()));
	}
	function index() {
		$allow=$this->Fone->custom("select * from pifs where teacher_id = ".$_SESSION['id'].";");
	}
	function upload(){
	function afterAction() {

	}


}