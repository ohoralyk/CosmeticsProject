<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>추천제품 세부정보</title>
<style type="text/css">
	*{
		box-sizing:border-box;
	}
	#title {
		width:auto;
		height:80px;
		margin:20px auto;
		margin-left:50px;
		margin-right:50px;
		border:1px solid #CCC;
		text-align:center;
	}
	#body {
		width:auto;
		height:auto;
		margin:10px auto;
		margin-left:50px;
		margin-right:50px;
		overflow:hidden;
	}
	#image > img{
		float:left;
		border-radius:50px;
		width:auto;
		border:1px solid #CCC;
		text-align:center;
	}
	
	#contents {
		float:left;
		width:auto;
		margin-left:10px;
		border:1px solid #CCC;
		text-align:center;
	}
	#under {
		width:auto;
		height:auto;
		margin:10px auto;
		margin-left:50px;
		margin-right:50px;
		border:1px solid #CCC;
		text-align:center;
	}
</style>
</head>
<body>
<div id="title">Co Com</div>
<div id="body">
	<div id="image"><img src="resources/images/cocom1.jpg" width=400 height=300></div>
	<div id="contents">- 제품명: <br>
	- 브랜드: <br>
	- 제품 종류: <br>
	- 제품 설명: <br>
	
	</div>
</div>
<div id="under">화장품 성분<br></div>
</body>
</html>