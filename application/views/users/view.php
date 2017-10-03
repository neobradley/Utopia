<section>
	<h1>Account Information
	</h1>
	<hr>
	<table border=1>
	<tr>
		<td>Name
		<td><?php echo $user['lastname'].", ".$user['firstname']." ".$user['middlename'];?>
	<tr>
		<td>Account Type
		<td><?php echo $user['type']?>
	<tr>
		<td>Status
		<td><?php echo $user['status']?>
	</table>
</section>
	