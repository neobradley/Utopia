<div id="msg">	<div id="current">		Room space:			<input id="space" type="hidden" value="<?php echo $status;?>"/><?php echo $status;?><br>		<h5>Current		<ul>			<?php				foreach($cur as $s):			?>				<li id="<?php echo $s['User']['id'];?>">					<input type="button" value="Remove" onclick="remove(this);"/>					<?php echo $s['User']['lastname'].", ".$s['User']['firstname']." ".$s['User']['middlename']?>			<?				endforeach;			?>		</ul>	</div>	<?php		if($status!="Full slot"):	?>		<div id="available">			<h5>Available			<ul>				<?php					foreach($avai as $s):				?>					<li id="<?php echo $s['User']['id'];?>">						<input type="button" value="Add" onclick="add(this);"/>						<?php echo $s['User']['lastname'].", ".$s['User']['firstname']." ".$s['User']['middlename']?>				<?					endforeach;				?>			</ul>		</div>	<?php		endif;	?></div>