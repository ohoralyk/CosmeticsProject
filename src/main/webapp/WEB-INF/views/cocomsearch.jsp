<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=2">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css?ver=0" />
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	<div id="topdiv">

		<div>
			<ul>
				<li><a href="login.project">로그인</a></li>
				<li>회원가입</li>
			</ul>
		</div>
	</div>
	<div align="center">
		<img alt="이미지가 없습니다." src="resources/images/Cocom.jpg" class="logo">

		<div>
			<div class="container">
				<div class="form-group form-inline">
					<div class="form-group">
						<select class="form-control" id="sel1">
							<option>브랜드</option>
							<option>유해성분</option>
							<option>트러블</option>
							<option>전체</option>
						</select>
					</div>
					<input type="text" class="form-control" id="usr" size="80">
					<button type="button" class="btn btn-success" onclick="search();">검색</button>
				</div>
			</div>
		</div>
	</div>

	<input type="checkbox" id="detail_search" onclick="show_detail()">상세검색
	<div class="detail_cos" style="display: none;">상세목록</div>
	<script src="resources/jquery-3.1.1.min.js"></script>

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
		$(function() {

		})

		function show_detail() {
			if ($('#detail_search').is(":checked") == true) {
				$('.detail_cos').css('display', 'block');
			} else {
				$('.detail_cos').css('display', 'none');
			}
		}

		function search() {
			var sel_condition = $('select option:selected').val();
			var search_val = $('#searchbar').val();
			alert(sel_condition);
			alert(search_val);
			var location = "search.cosmetic?sel_condition=" + sel_condition
					+ "&search_val=" + search_val;
			alert(location);
			location.href = location;
		}
	</script>


</body>
</html>