<section>	<h3>Link Youtube Video</h3>	<a href="<?php echo ip."utopia/fones/index"?>">Back</a>	<?php		//print_r($q);		if(isset($module)):	?>	<a href="index">Back</a><br>	<?php		endif;	?>	<form action="<?php echo isset($link)?"../savelink":"savelink";?>" method="post">		<input type="hidden" id="file_id" name="file_id" value="0">		Link:<input type="text" name="link" size="30" <?php echo isset($link)?"value='$link'":""?>/><br>		Title:<input type="text" name="file_title" <?php echo isset($title)?"value='$title'":""?>/><br>		Status:			Public<input type="radio" name="status" value="public" checked>			Private<input type="radio" name="status" value="private"><br>		<input type="submit" value="Save Link">	<?php		echo $html->includeJs("fone");		if(isset($module)):	?>	<input type="hidden" name="module_name" value="<?php echo $module;?>">	<input type="hidden" name="module_id" value="<?php echo $module_id;?>">		<h3>Module</h3>	<?php		switch($module):			case 'lc':$module="Learning Cell";				break;			case 'pif':$module="Pay-It-Forward";				break;			case 'bm':$module="Breakfast Meeting";				break;		endswitch;		echo "$module - $title";		endif;	?>	</form>	<div id="tag"></div>	<script type="text/javascript">		loadTag('tag');	</script></section>