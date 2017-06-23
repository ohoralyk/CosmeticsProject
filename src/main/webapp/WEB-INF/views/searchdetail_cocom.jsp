<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>검색제품 세부정보</title>
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
	/* #searchinput{
		height:auto;
		width:auto;
		margin:0 auto;
		border:1px solid #CCC;
	} */
</style>
<script type="text/javascript">
function check() {
	if(document.search.keyWord.value==''){
		alter('검색어를 입력해주세요');
		document.search.keyWord.focus();
		return false;
	}
}
</script>
</head>
<body>
<div id="title">CoCom</div>
	<form name="search" method="get" onsubmit="return check()">
		<table width="auto" border="0" align="center">
			<tr>
				<td align="center" valign="bottom"> 
					<select name="keyField">
						<option value="all">전  체</option>
						<option value="name">제품명</option>
						<option value="category">종  류</option>
						<option value="brand">브랜드명</option>
						<option value="ingredient">성  분</option>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;   
				</td>
				<td>
					<input type="text" size="70" name="keyWord">&nbsp;&nbsp;&nbsp;&nbsp; 
				</td>
				<td>
					<input type="submit" value="검 색">
				</td>
			</tr>
		</table>
	</form>
<div id="result">
	<div id="body">
		<div id="image"><img src="/cocom/resources/images/cocom1.jpg" width=400 height=300></div>
		<div id="contents">- 제품명: <br>
		- 브랜드: <br>
		- 제품 종류: <br>
		- 제품 설명: <br>
		
		</div>
	</div>
	<div id="under">화장품 성분<br></div>
</div>
</body>
</html>