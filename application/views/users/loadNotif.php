<div id="last_id"><?php
	echo $last_id;
?></div>
<div id="msg"><?php
	if(isset($notif)):
		foreach($notif as $n):
?>
		<li>
			<div class='msg' id=<?php echo $n['A']['id'];?>>
				<div class="name">
					<input id='close' type="button" value="X">
					<a href="view/<?php echo $n['B']['user'];?>">
						<?php echo $n['B']['name'];?>
					</a>
				</div>
				<div class="text">:<?php echo $n['A']['message'];?></div>
				<div class="date"><?php  print_r($html->getDate($n['A']['date_created'],date("m-d-Y")));?></div>
			</div>
		</li>
<?php
		endforeach;
	endif;
?><div>