<section>	<h3>Edit File Sharing</h3>	<a href="../index">Back</a><br>	<form action="../save" method="post">		<input type="hidden" id="file_id" name="file_id" value="<?php echo $id;?>">		Filename:<?php echo $f1['Fone']['filename'];?><br>		Size:<?php echo $f1['Fone']['size'];?><br>		Type:<?php echo $f1['Fone']['size']!=""?$f1['Fone']['size']." bytes":"Link to Youtube";?><br>		Title:<input type="text" name="file_title" value="<?php echo $f1['Fone']['title'];?>"/><br>		Status:			Public<input type="radio" name="status" value="public" <?php echo $f1['Fone']['status']=="public"?"checked":"";?>>			Private<input type="radio" name="status" value="private" <?php echo $f1['Fone']['status']=="private"?"checked":"";?>><br>		<input type="submit" value="Save">		<a href="../delete/<?php echo $id?>">Delete</a>	</form>	<div id="mediaOut">		<?php			if($f1['Fone']['type']=="video"):		?>			<iframe src="<?php echo $f1['Fone']['filename'];?>" width="320" height="190" frameborder="0">			</iframe>		<?php			elseif($f1['Fone']['type']=="image"):				echo "<a href=".ip."utopia/public/image/".$f1['Fone']['filename']." target='_blank'>".$html->insertImgWH($f1['Fone']['filename'],$f1['Fone']['title'],'320','190')."</a>";			else:				echo "<a href=".ip."utopia/public/other/".$f1['Fone']['filename']." target='_blank'>".$f1['Fone']['filename']."</a>";			endif;		?>	</div>	<div id="tags"></div>	<?php		echo $html->includeJs("fone");	?>	<script type="text/javascript">		loadTag('../tag');	</script></section>