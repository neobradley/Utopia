<?php	//print_r($messages);	//print_r($replies);	if(isset($error)):		echo "<script type='text/javascript'>		alert('".$error."');		location='../index';		</script>";	endif;?><hgroup>	<div class="hgroup">		<h3 class="title"><?php echo $learningcell['title']?></h3>		<a href="../index">Back</a>		<a href="../studentList" target="_blank">Student List</a>		<?php			if($learningcell['teacher_id']==$id):		?>		<form action="../../fones/upload" method="post" target="_blank">			<input type="hidden" name="module" value="lc">			<input type="hidden" name="module_id" value="<?php echo $learningcell['id'];?>">			<a href="" onclick="$(this).parent().submit()">Upload File</a>		</form>		<?php			endif;		?>	</div></hgroup><section>	<div id="empty">No message</div>	<div id="media">Loading...</div>		<div class="board">		<input id="message_id" type="hidden" value="<?php echo $message_id;?>">		<input id="reply_id" type="hidden" value="<?php echo $reply_id;?>">		<ul id="wall"><?php			if(@count($messages)>0):				foreach($messages as $m):		?><li>				<div class='msg' id=<?php echo $m['A']['id'];?>>						<input id='close' type="<?php echo $m['A']['user_id']==$id?"button":"hidden"?>" value="X" onclick="remove($(this))">						<?php if($m['A']['user_id']==$id&&$type=="teacher"):else:?>							<input id='star' type="<?php echo $type=="teacher"?"button":"hidden"?>" value="<?php echo $m['A']['status']=="none"?"Star":"Unstar"?>" onclick="star($(this))">						<?php endif;?>						<a href="<?php echo ip;?>utopia/users/view/<?php echo $m['A']['user_id'];?>" target="blank">							<?php echo $m['B']['lastname'].", ".$m['B']['firstname'];?>						</a>					:<?php echo nl2br($m['A']['message']);?>					<?php  print_r($html->getMinute($m['A']['date_created']));?>					<ul id="reply">					</ul>				</div>			</li><?php				endforeach;			endif;		?></ul>	</div></section><section>	<div class="input">		<textarea id="textarea" placeholder="Your message here..."></textarea><br>		Enter to send<input id="enter" type="checkbox" checked="true"/>		<input id="post" type="button" value="Send"/>	</div></section><?php	print_r($html->includeJs("learningcell"));?>