<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="check.cosmetic" method=POST>
	${seq}번 게시글의 비밀번호를 입력하세요<br>
	<input type="text" name="bpassword" size=12 maxlength=12><br>
	<input type="hidden" name="bseq" value="${seq}">
	${msg}<br>
	<input type="submit" value="확인">
	<input type="button" id="cancel_btn" value="취소" >
	</form>
	<script src="resources/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	
$('#calcel_btn').on('click',function(){
	location.href="detail.cosmetic";
});
		
	</script>
</body>
</html>