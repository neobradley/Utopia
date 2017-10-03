<?phpclass UsersController extends VanillaController {
	function beforeAction () {		$this->set('username',performAction('users','isLogin',array()));		$this->set('id',$_SESSION['id']);	}
	function help(){
	}
	function logout(){		header('location:'.ip.'utopia/homes/index');	}
	function view($id){		$user=$this->User->custom("select * from users where id = $id");		$this->set('user',$user[0]['User']);
	}
	function index() {		
	}
	function afterAction() {
	}
	function isLogin(){		session_start();		date_default_timezone_set('Asia/Taipei');		if(isset($_SESSION['username'])){			return $_SESSION['username'];		}else{			header("location:".ip."utopia/homes/login");		}	}
	function loadNotif(){		$id = $_POST['id'];		//$id="0";		$newNotif=$this->User->custom("select a.id as `id`, a.from_id, a.message, a.date_created, b.id as `user`, b.firstname as `name` from notifications as a inner join users as b on a.from_id = b.id where a.to_id = ".$_SESSION['id']." and a.id > ".$id." and a.status = 'uncheck' order by a.id asc limit 1;");		$lastId=$this->User->custom("select * from notifications where to_id = ".$_SESSION['id']." and id > ".$id." and status = 'uncheck' order by id asc limit 1;");		$count=@count($newNotif[0]);		if($count>0):			$this->set('notif',$newNotif);			$this->set('last_id',$lastId[0]['Notification']['id']);		endif;		if($count==0):			$this->set('last_id',$id);		endif;	}		function checkNotif(){		$id=$_POST['id'];		$remove=$this->User->custom("update notifications set status = 'check' where id = $id;");	}		function countNotification(){		$id=$_SESSION['id'];		$count=$this->User->custom("select count(*) as 'count' from notifications where to_id = $id and `status` = 'uncheck';");		$no = $count[0]['']['count'];		$this->set('no',$no);	}
}