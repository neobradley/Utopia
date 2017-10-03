<?php

class BfmeetingsController extends VanillaController {		function beforeAction () {		$this->set('username',performAction('users','isLogin',array()));		$this->set('id',$_SESSION['id']);		$this->set('type',$_SESSION['type']);		$_SESSION['module']='bm';	}	function room($room_id){		$exist = $this->Bfmeeting->custom("select * from bfmeetings where id = ".$room_id.";");		if(@count($exist)==0):			$this->set('error','Room does not exist or closed');		else:			//check if user exist			//true			if($_SESSION['type']=="parent"):				$cur=performAction("bfmeetings","isActive",array($room_id));				if(3!=$cur){					if($cur==2)						$this->set('block','You are blocked');				}elseif(performAction("bfmeetings","isOpen",array($room_id))){					performAction("bfmeetings","addMember",array($room_id));				}else{					$this->set('error','Invalid access');					$error="";				}			endif;			if(!isset($error)):				$_SESSION['room_id']=$room_id;			endif;			$learningcell = $this->Bfmeeting->custom("select * from bfmeetings where id = $room_id;");			$messages = $this->Bfmeeting->custom("select a.*, b.firstname, b.lastname from bfmeetingmessages a inner join users b on a.user_id = b.id where a.bfmeeting_id = ".$room_id." order by a.id desc;");			//$replies = $this->Bfmeeting->custom("select a.*, b.firstname, b.lastname from learningcellreplies a inner join users b on a.user_id = b.id inner join bfmeetingmessages c on a.bfmeetingmessage_id = c.id where c.bfmeeting_id = ".$room_id.";");						$message_id = @count($messages)>0?$this->Bfmeeting->custom("select a.*, b.firstname, b.lastname from bfmeetingmessages a inner join users b on a.user_id = b.id where a.bfmeeting_id = ".$room_id." order by a.id desc limit 1;"):array(array('A'=>array('id'=>0)));			//$reply_id = @count($replies)>0?$this->Bfmeeting->custom("select a.*, b.firstname, b.lastname from learningcellreplies a inner join users b on a.user_id = b.id inner join learningcellmessages c on a.learningcellmessage_id = c.id where c.learningcell_id = ".$room_id." and b.id = ".$_SESSION['id']." limit 1;"):array(array('A'=>array('id'=>0)));						$this->set('learningcell',$learningcell[0]['Bfmeeting']);			$this->set('messages',$messages);			//$this->set('replies',$replies);			$this->set('message_id',$message_id[0]['A']['id']);			//$this->set('reply_id',$reply_id[0]['A']['id']);		endif;	}		function isActive($room_id){		$active = $this->Bfmeeting->custom("select user_status from bfmeetingrooms where user_id = ".$_SESSION['id']." and bfmeeting_id = ".$room_id.";");		$status=$active!=null?$active[0]['Bfmeetingroom']['user_status']:"empty";		if($status=="open"):			return 1;		elseif($status=="close"):			return 2;		endif;		return 3;	}		function isOpen($room_id){		$open = $this->Bfmeeting->custom("select status from learningcells where id = ".$room_id.";");		$status = $open[0]['Learningcell']['status'];		if($status=="open"):			return true;		endif;		return false;	}		function addMember($room_id){		$add = $this->Bfmeeting->custom("insert into bfmeetingrooms (bfmeeting_id,user_id) values (".$room_id.",".$_SESSION['id'].");");		performAction("bfmeetings","checkQuota",array($room_id));	}	function index() {		if($_SESSION['type']=="parent"):			$user=$this->Bfmeeting->custom("select aaa.* from(select aa.*, count(bb.user_id) as 'count' from(select a.*, b.firstname as `firstname`, b.lastname as `lastname` from bfmeetings as a inner join users b on a.teacher_id = b.id) as aa left join bfmeetingrooms bb on aa.id = bb.bfmeeting_id group by aa.id order by aa.title) as aaa inner join bfmeetingrooms bbb on aaa.id = bbb.bfmeeting_id where bbb.user_id = ".$_SESSION['id'].";");		endif;		if($_SESSION['type']!="parent"):			$user=$this->Bfmeeting->custom("select aaa.* from(select aa.*, count(bb.user_id) as 'count' from(select a.*, b.firstname as `firstname`, b.lastname as `lastname` from bfmeetings as a inner join users b on a.teacher_id = b.id where a.teacher_id = ".$_SESSION['id'].") as aa left join bfmeetingrooms bb on aa.id = bb.bfmeeting_id group by aa.id order by aa.title) as aaa;");		endif;		$available=$this->Bfmeeting->custom("select aa.*, count(bb.user_id) as `count` from(select a.*, b.firstname as `firstname`, b.lastname as `lastname` from bfmeetings as a inner join users b on a.teacher_id = b.id where a.status = 'open') as aa left join bfmeetingrooms bb on aa.id = bb.bfmeeting_id group by aa.id order by aa.title;");		if($_SESSION['type']=="admin"):			$available=$this->Bfmeeting->custom("select aa.*, count(bb.user_id) as `count` from(select a.*, b.firstname as `firstname`, b.lastname as `lastname` from bfmeetings as a inner join users b on a.teacher_id = b.id) as aa left join bfmeetingrooms bb on aa.id = bb.bfmeeting_id group by aa.id order by aa.title;");		endif;		$this->set('user_learningcell',$user);		$this->set('available',$available);	}	function loadMessage(){		$message_id=$_POST['id'];		$message = $this->Bfmeeting->custom("select a.*, b.firstname, b.lastname from bfmeetingmessages a inner join users b on a.user_id = b.id where a.id > ".$message_id." and a.bfmeeting_id = ".$_SESSION['room_id']." order by a.id asc limit 1;");		$count=@count($message[0]);		$this->set('message_id',$message_id);		if($count>0):			$this->set('message',$message[0]);			$this->set('message_id',$message[0]['A']['id']);		endif;		$this->set('query',"select a.*, b.firstname, b.lastname from bfmeetingmessages a inner join users b on a.user_id = b.id where a.id > ".$message_id." and a.bfmeeting_id = ".$_SESSION['room_id']." order by a.id asc limit 1;");	}		function removeMessage(){		$id=$_POST['id'];		//$id=0;		$this->Bfmeeting->custom("delete from bfmeetingmessages where id = ".$id);		//$this->set("error","delete from learningcellmessages where id = ".$id);	}		function addMessage(){		if($_SESSION['type']=="parent"):			$cur=performAction("bfmeetings","isActive",array($_SESSION['room_id']));			if($cur==1):				$msg=$_POST['msg'];				$msg=addslashes($msg);				$this->Bfmeeting->custom("insert into bfmeetingmessages (bfmeeting_id,user_id,message,date_created) values (".$_SESSION['room_id'].",".$_SESSION['id'].",'".$msg."',now());");				//$this->set("error","Error happend");			endif;		else:			$message=$_POST['msg'];			//$msg=str_replace("'", "\"", $message);			$msg=$_POST['msg'];			$msg=addslashes($msg);			$this->Bfmeeting->custom("insert into bfmeetingmessages (bfmeeting_id,user_id,message,date_created) values (".$_SESSION['room_id'].",".$_SESSION['id'].",'".$msg."',now());");			//$this->set("error","Error happend");		endif;	}		function starMessage(){		$id=$_POST['id'];		$star=$_POST['star'];		$next=$star=="Star"?"Star":"none";		$this->Bfmeeting->custom("update bfmeetingmessages set status = '".$next."' where id = ".$id.";");		//$this->set("error","Error happend");	}		function loadMedia(){		$tags=$this->Bfmeeting->custom("select * from fonetags;");		$media=array();		foreach($tags as $t):			$tag=explode('_',$t['Fonetag']['module_id']);			if($tag[0]=="lc"&&$tag[1]==$_SESSION['room_id']):				$file=$this->Bfmeeting->custom("select * from fones where id = ".$t['Fonetag']['fone_id'].";");				array_push($media,$file);			endif;		endforeach;		$this->set('media',$media);		if(isset($_POST['id'])&&$_POST['id']!="undefined")			$this->set('current',$_POST['id']);	}		function studentList(){		$students=$this->Bfmeeting->custom("select aa.*, bb.count from (select a.*, b.firstname, b.lastname from bfmeetingrooms a inner join users b on a.user_id = b.id) as aa left join (select bfmeeting_id, user_id, count(`status` = 'Star' or null) 'count' from bfmeetingmessages group by bfmeeting_id, user_id) as bb on aa.user_id = bb.user_id where aa.bfmeeting_id = ".$_SESSION['room_id']." group by aa.user_id;");		$this->set('students',$students);	}		function blockStudent($id){		$status=$this->Bfmeeting->custom("select * from bfmeetingrooms where bfmeeting_id =".$_SESSION['room_id']." and user_id = ".$id.";");		$cur=$status[0]['Bfmeetingroom']['user_status'];		$next=$cur=='open'?'close':'open';		$update=$this->Bfmeeting->custom("update bfmeetingrooms set user_status = '".$next."' where bfmeeting_id =".$_SESSION['room_id']." and user_id = ".$id.";");		header("location:".ip."utopia/bfmeetings/studentList");	}		function removeStudent($id){		if($_SESSION['type']!="parent"):		//delete from learningcellmessages where id = ".$id			$block=$this->Bfmeeting->custom("delete from bfmeetingrooms where bfmeeting_id = ".$_SESSION['room_id']." and user_id = ".$id);			$remove=$this->Bfmeeting->custom("delete from bfmeetingmessages where bfmeeting_id = ".$_SESSION['room_id']." and user_id = ".$id);			performAction("bfmeetings","checkQuota",array($room_id));			header("location:".ip."utopia/bfmeetings/studentList");		endif;	}		function create(){			}		function save(){		if(isset($_POST['title'])):			$title=$_POST['title'];			$quota=$_POST['quota'];		endif;		performAction("bfmeetings","checkQuota",array($_POST['id']));		$status=$_POST['status']=="public"?"open":"close";		/*$this->Bfmeeting->title=$title;		$this->Bfmeeting->quota=$quota;		$this->Bfmeeting->status=$status;		$this->Bfmeeting->date_created=" now()";*/		if(isset($_POST['id'])):			$this->Bfmeeting->id=$_POST['id'];			$lc=$this->Bfmeeting->search();			if($lc['Bfmeeting']['status']=="open")				$this->Bfmeeting->custom("update bfmeetings set status = '$status' where id = ".$_POST['id'].";");			header("location:".ip."utopia/bfmeetings/index");		else:			$this->Bfmeeting->custom("insert into bfmeetings (title, teacher_id, quota, `status`, date_created) values ('$title',".$_SESSION['id'].",$quota,'$status',now());");			$last_id=$this->Bfmeeting->custom("select * from bfmeetings where teacher_id = ".$_SESSION['id']." order by date_created desc limit 1;");			header("location:".ip."utopia/bfmeetings/edit/".$last_id[0]['Bfmeeting']['id']);		endif;	}		function edit($room_id){		$this->Bfmeeting->id=$room_id;		$lc=$this->Bfmeeting->search();		$this->set('room_id',$room_id);		$this->set('lc',$lc);	}		function close($room_id){		$this->Bfmeeting->id=$room_id;		$this->Bfmeeting->delete();		$room=$this->Bfmeeting->custom("select * from bfmeetingrooms where bfmeeting_id = $room_id");		foreach($room as $s):			$id=$s['Bfmeetingroom']['user_id'];			$this->Bfmeeting->custom("delete from bfmeetingrooms where bfmeeting_id = ".$room_id." and user_id = ".$id.";");			$this->Bfmeeting->custom("delete from bfmeetingmessages where bfmeeting_id = ".$room_id." and user_id = ".$id.";");		endforeach;		header("location:".ip."utopia/bfmeetings/index");	}		/*function search(){		$room=$_POST['room'];		$word=$_POST['word'];		if($word==""):			$cur=$this->Bfmeeting->custom("select * from users where type = 'student' having id in (select user_id from learningcellrooms where learningcell_id = $room);");			$avai=$this->Bfmeeting->custom("select * from users where type = 'student' having id not in (select user_id from learningcellrooms where learningcell_id = $room);");		else:			$cur=$this->Bfmeeting->custom("select * from users where type = 'student' and (lastname like '%$word%' or middlename like '%$word%' or firstname like '%$word%') having id in (select user_id from learningcellrooms where learningcell_id = $room);");			$avai=$this->Bfmeeting->custom("select * from users where type = 'student' and (lastname like '%$word%' or middlename like '%$word%' or firstname like '%$word%') having id not in (select user_id from learningcellrooms where learningcell_id = $room);");		endif;		$this->set('msg',"select * from users where type = 'student' and (lastname = '$word' or middlename = '$word' or firstname = '$word') having id not in (select user_id from learningcellrooms where learningcell_id = $room);");		$this->set('cur',$cur);		$this->set('avai',$avai);				$this->Bfmeeting->id=$room;		$lc=$this->Bfmeeting->search();		$total=$this->Bfmeeting->custom("select count(*) as 'count' from learningcellrooms where learningcell_id = $room;");		$status=$lc['Learningcell']['quota']>$total[0]['']['count']?"Open slot":"Full slot";		$this->set('status',$status);	}*/		function setMember(){		$room_id=$_POST['room'];		$id=$_POST['id'];		$action=$_POST['action'];		if($action=="add"):			$this->Bfmeeting->custom("insert into bfmeetingrooms (bfmeeting_id,user_id) values (".$room_id.",".$id.");");		else:			$this->Bfmeeting->custom("delete from bfmeetingrooms where bfmeeting_id = ".$room_id." and user_id = ".$id.";");			$this->Bfmeeting->custom("delete from bfmeetingmessages where bfmeeting_id = ".$room_id." and user_id = ".$id.";");		endif;		performAction("bfmeetings","checkQuota",array($room_id));	}		function checkQuota($room_id){		$this->Bfmeeting->id=$room_id;		$lc=$this->Bfmeeting->search();		$total=$this->Bfmeeting->custom("select count(*) as 'count' from bfmeetingrooms where bfmeeting_id = $room_id;");		$status=$lc['Bfmeeting']['quota']>$total[0]['']['count']?"open":"close";		$this->Bfmeeting->custom("update bfmeetings set `status` = '$status' where id = $room_id");	}		function afterAction() {	}
}