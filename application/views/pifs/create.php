<h3>Create Pay-It-Forward</h3><a href="index">Back</a><form action="save" method="post" onsubmit="return create();">	Title:		<input id="title" type="text" name="title"><br>	Quota:		<span id="warning">			<input id="quota" type="text" name="quota">			<span class="textfieldInvalidFormatMsg">Invalid format.</span>		</span><br>	Status:		Public<input type="radio" name="status" value="public" checked>		Close<input type="radio" name="status" value="private"><br>	<input type="submit" value="Create"/></form><?php	print_r($html->includeJs("learningcell"));	print_r($html->includeJs("spry"));	print_r($html->includeCss("spry"));?><script type="text/javascript">	var integer1 = new Spry.Widget.ValidationTextField("warning", "integer", {validateOn:["blur", "change"], useCharacterMasking:false, minValue:"0", maxValue:"100"});	</script>