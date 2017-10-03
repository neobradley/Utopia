<!doctype html>
<html>
<head>
<title>Utopia</title>
<? echo($html->includeJs("jquery"));?>
<? echo($html->includeJs("login"));?>
<? echo($html->includeCss("style"));?>
<? echo($html->includeCss("homestyle"));?>
</head>
<body>
<header>
<div class="header">

</div>
</header>
<div class="main">
<aside>
<div class="aside">
<h3>Login</h3>
<section>
<form id="loginForm" action="<?php echo ip;?>utopia/homes/login" method="post" onsubmit="return check();" >
<input type="text" id="username" name="username" placeholder="Username" size="12"/><br/>
<input type="password" id="password" name="password" placeholder="Password" size="12"/><br/>
<input type="submit" value="Login"/>
<a href="<?php echo ip;?>utopia/homes/recover">Forgot password?</a>
</form>
</section>
<h3>Link</h3>
<ul>
<li><a href="#">DepEd</a>
<li><a href="#">School A</a>
<li><a href="#">School B</a>
</ul>
</div>
</aside>
<div class="content">
</body>
</html>