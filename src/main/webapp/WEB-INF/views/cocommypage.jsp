<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<title>cocom 마이페이지</title>
</head>
<style>
	#div_root {
		margin : auto;
		width : 100%;
		height : 100px;
	}
	#div_top {
		width : 100%;
		height : 100px;
		background-color : #82FA58;
		text-align : center;
	}
	#div_menu {
		float : left;
	}
	#div_con {
		float : left;
		width : 800px;
		height : 300px;
		border : 1px solid green;
	}
	ul{
		list-style : none;
		margin : 0px;
		padding : 0px;
		position : relative;
		text-align : center;
	}
	ul li a {
		text-decoration:none;
		display : block;
		width : 80px;
		height : 35px;
		line-height : 35px;
	}
	li {
		width : 80px;
		background-color : #9FC93C;
	}
	ul li : hover {
		background-color : #D4F4FA;
	}
	ul li : hover > ul {
		display : block;
	}
/* 	
	#topMenu {
		height : 30px;
		width : 850px;
	}
	#topMenu ul li {
		list-style : none;
		color : white;
		background-color : #2d2d2d;
		float : left;
		
		line-height : 30px;
		vertical-align : middle;
		text-align : center;
	}
	#topMenu .menuLink {
		text-decoration : none;
		color : white;
		display : block;
		width : 150px;
		font-size : 12px;
		font-weight : bold;
		font-family : "Trebuchet Ms", Dotum, Arial;
	}
	#topMenu .menuLink : hover {
		color : red;
		background-color : #4d4d4d;
	} */
</style>
<body>
<div class="container">
<div id="div_root">
<div id="div_top">Co Com</div>
<div id="div_menu">
<ul>
	<li><a href="#">내관심목록</a></li>
	<li><a href="#">화장품추천</a></li>
	<li><a href="#">내정보수정</a></li>
</ul>
</div>
<div id="div_com">내용</div>
</div>
</div>
</body>
</html>