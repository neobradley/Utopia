<h3>Student List</h3><hr><table style="text-align:center;">	<tr>		<th>Name(L, F)		<th>Star/s		<?php			if($type!="student"):		?>		<th>Status		<th>Action	<?php			endif;		//print_r($students);		foreach($students as $s):	?>		<tr>			<td><a href="../users/view/<?php echo $s['Aa']['user_id'];?>" target="_new"><?php echo $s['Aa']['lastname'].", ".$s['Aa']['firstname'];?></a>			<td><?php echo $s['Bb']['count']==""?"0":$s['Bb']['count'];?>			<?php				if($type!="student"):			?>			<td><?php echo $s['Aa']['user_status']?>			<td>				<a onclick="return confirm('Are you sure to block/unblock this student?');" href="blockStudent/<?php echo $s['Aa']['user_id'];?>"><?php echo $s['Aa']['user_status']=="open"?"Block":"Unblock"?></a>	<?php			//if(isset()):	?>				<a onclick="return confirm('Are you sure to remove this student?');" href="removeStudent/<?php echo $s['Aa']['user_id'];?>">Remove</a>	<?php			//endif;				endif;		endforeach;		print_r($html->includeJs('learningcell'));	?></table>