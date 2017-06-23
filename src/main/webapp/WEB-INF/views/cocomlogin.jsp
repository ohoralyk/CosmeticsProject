<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CoCom 로그인 화면</title>
<script src="resources/jquery-3.1.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<br>
<br>
<br>
	<div class="container">
    <div class="row vertical-offset-100">
        <div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Welcome to CoCom!</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form method="POST" action="login.cosmetic">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="Id" name="mid" type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="Password" name="mpw" type="password" value="">
			    		</div>
			    		<input class="btn btn-lg btn-success btn-block" type="submit" value="Login"><br>
			    		<input class="btn btn-lg btn-success btn-block" id="signup_btn" type="button" value="Sign Up">
			    	</fieldset>
			    	<br>
			    	${msg}
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
	<script src="resources/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	
$('#signup_btn').on('click',function(){
	location.href="signup.cosmetic";
});
		
	</script>

</body>
</html>