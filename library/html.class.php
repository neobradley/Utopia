<?php

class HTML {
	private $js = array();

	function shortenUrls($data) {
		$data = preg_replace_callback('@(https?://([-\w\.]+)+(:\d+)?(/([\w/_\.]*(\?\S+)?)?)?)@', array(get_class($this), '_fetchTinyUrl'), $data);
		return $data;
	}

	private function _fetchTinyUrl($url) { 
		$ch = curl_init(); 
		$timeout = 5; 
		curl_setopt($ch,CURLOPT_URL,'http://tinyurl.com/api-create.php?url='.$url[0]); 
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,1); 
		curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,$timeout); 
		$data = curl_exec($ch); 
		curl_close($ch); 
		return '<a href="'.$data.'" target = "_blank" >'.$data.'</a>'; 
	}

	function sanitize($data) {
		return mysql_real_escape_string($data);
	}

	function link($text,$path,$prompt = null,$confirmMessage = "Are you sure?") {
		$path = str_replace(' ','-',$path);
		if ($prompt) {
			$data = '<a href="javascript:void(0);" onclick="javascript:jumpTo(\''.BASE_PATH.'/'.$path.'\',\''.$confirmMessage.'\')">'.$text.'</a>';
		} else {
			$data = '<a href="'.BASE_PATH.'/'.$path.'">'.$text.'</a>';	
		}
		return $data;
	}

	function includeJs($fileName) {
		$data = '<script type="text/javascript" src="'.BASE_PATH.'public/js/'.$fileName.'.js"></script>';
		return $data;
	}

	function includeCss($fileName) {
		$data = '<link rel="stylesheet" type="text/css" href="'.BASE_PATH.'public/css/'.$fileName.'.css"/>';
		return $data;
	}	function insertSwf($filename){		$data = '<embed src="'.BASE_PATH.'public/swf/'.$filename.'.swf" width="550" height="400" wmode="transparent" />';		return $data;	}		function insertImg($filename,$alt){		$data = '<img src="'.BASE_PATH.'public/img/'.$filename.'" alt="'.$alt.'"/>';		return $data;	}		function insertImgWH($filename,$alt,$w,$h){		$data = '<img src="'.BASE_PATH.'public/image/'.$filename.'" alt="'.$alt.'" width="'.$w.'" height="'.$h.'"/>';		return $data;	}		function getDate($date,$now){		date_default_timezone_set('Asia/Taipei');		$date1=date_parse($date);		$date2=explode("-",$now);		$start=gregoriantojd($date1['month'],$date1['day'],$date1['year']);		$end=gregoriantojd($date2[0],$date2[1],$date2[2]);		return $end-$start==0 ? "Today" : $end-$start." days ago";	}		function getMinute($date){		date_default_timezone_set('Asia/Taipei');		$date1= date_parse($date);		$switch = $date1['hour']>=12?"PM":"AM";		$hour = $date1['hour']>=12?$date1['hour']-12:$date1['hour'];		$out = $hour.":".$date1['minute'].":".$date1['second']." ".$switch;		return $out;	}
}