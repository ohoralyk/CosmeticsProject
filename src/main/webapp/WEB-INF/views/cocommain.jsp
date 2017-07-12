<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="our.project.cosmetic.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/main.css?ver=0" /> -->
<title>Cosmetic Main</title>

<!-- 제이쿼리 불러오기  -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- 따온 부트스트랩 자료 넣기 -->
<script src="resources/js/agency.js"></script>
<!-- <script src="resources/js/agency.min.js"></script> -->
<script src="resources/js/contact_me.js"></script>
<script src="resources/js/jqBootstrapValidation.js"></script>

<!-- 부트스트랩 코어 -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- 커스텀 폰트 -->
<link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css">

<!-- theme css -->
<link href="resources/css/agency.css" rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=b7d9b82d0a5200c81b2186a85bd7b86e&libraries=services,clusterer,drawing"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

/* .container{
	background-color: #EBEBBB;
} */
th {
	text-align: center;
}

#chbox{
	margin-top: 1%;
}
#con {
	margin-top: 1%;
}
</style>

<!-- 날씨 제이쿼리 -->
<script src="resources/js/weather.js"></script>

<!-- 검색 조회 제이쿼리-->
<script src="resources/js/search.js"></script>

</head>
<body id="page-top" class="index">
	<!-- 맨위 바-->
	<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top affix-top">
        <div class="container">
<!--             Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>Menu<i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">CoCom</a>
            </div>
			<!--  Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                	<c:if test="${sessionScope.signupVO.mid == null}">
	                    <li class="hidden active">
	                        <a href="#page-top"></a>
	                    </li>
	                    <li class="">
	                        <a class="page-scroll" href="#search">화장품 검색</a>
	                    </li>
	                     <li class="">
	                        <a class="page-scroll" href="#weather">weather/map</a>
	                    </li>
	                    <li class="">
	                        <a href="signup.cosmetic">Sign Up</a>
	                    </li>
	                    <li class="">
	                        <a href="login.cosmetic">Login</a>
	                    </li>
	                    <li class="">
	                        <a href="board.cosmetic">자유게시판</a>
	                    </li>
	                    <li class="">
	                        <a href="sale.cosmetic">중고게시판</a>
	                    </li>
                    </c:if>
                    <c:if test="${sessionScope.signupVO.mid != null}">
	                     <li class="hidden active">
	                        <a href="#page-top"></a>
	                    </li>
	                      <li class="">
	                        <a class="page-scroll" href="#search">화장품 검색</a>
	                    </li>
	                     <li class="">
	                        <a class="page-scroll" href="#weather">weather/map</a>
	                    </li>
	                    <li class="">
	                    	<a class="page-scroll">${signupVO.mid } 님 어서오세요.</a>
	                    <li class="">
	                        <a class="page-scroll" href="logout.cosmetic">LogOut</a>
	                    </li>
	                    <li class="">
	                        <a class="page-scroll" href="board.cosmetic">자유게시판</a>
	                    </li>
	                    <li class="">
	                        <a class="page-scroll" href="sale.cosmetic">중고게시판</a>
	                    </li>
					</c:if>
                </ul>
            </div>
<!--             /.navbar-collapse -->
        </div>
<!--         /.container-fluid -->
    </nav>
    
    <header>
        <div class="container">
            <div class="intro-text">
<!-- 				<div class="row"> -->
<!-- 					<img class="center-block" alt="이미지가 없습니다." src="resources/images/Cocom.jpg" class="logo"> -->
<!-- 				</div> -->
				<div class="intro-lead-in">Co Com</div>
                <div class="intro-heading">Cosmetics<br> Combination</div>
				<a href="#search" class="page-scroll btn btn-xl">Cosmetics 검색</a>
            </div>
        </div>
   </header>
   
   <!-- 검색 -->
   <section id="search">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">CoCom Search</h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="row">
					<div class="col-md-2">
						<select class="form-control" id="sel1">
							<option>브랜드</option>
							<!-- <option>용도</option> -->
							<!--  <option>성분</option>-->
							<option>제품명</option>
						</select>
					</div>
					<div class="col-md-8">
						<input type="text" class="form-control" id="searchbar">
					</div>
					<div class="col-md-2">
						<button type="button" class="btn btn-success btn-block"
							onclick="search()" id="search" style="height: 34px;">검색</button>
					</div>
				</div>    
        	</div>
        	<!-- 검색 결과물 -->
			<div class="container">
				<div id="chbox"> </div>
				<div id="con"></div>
			</div>
    	</div>
    </section>

<!-- 검색 -->
<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-2"> -->
<!-- 			<select class="form-control" id="sel1"> -->
<!-- 				<option>브랜드</option> -->
<!-- 								<option>용도</option> -->
<!-- 				 <option>성분</option> -->
<!-- 				<option>제품명</option> -->
<!-- 			</select> -->
<!-- 		</div> -->
<!-- 		<div class="col-md-8"> -->
<!-- 			<input type="text" class="form-control" id="searchbar"> -->
<!-- 		</div> -->
<!-- 		<div class="col-md-2"> -->
<!-- 			<button type="button" class="btn btn-success btn-block" -->
<!-- 				onclick="search()" id="search" style="height: 34px;">검색</button> -->
<!-- 		</div> -->
<!-- 	</div> -->


	<!--  Modal detail -->
<!-- 	<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;"> -->
	<div class="modal fade" id="myModal" role="dialog" >
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<div id="cos_category">용도 : </div>
					<div id="cos_company">브랜드 : </div>
					<div id="cos_ingredient">성분 : </div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 날씨 / 맵 출력 -->
	<div class="row">
		<!-- 날씨 출력 -->
		<div class="col-sm-6">
			<div id="weather" class="alert alert-success"
				style="background-color: lavender;">
				<h2>날씨</h2>
				<br>
				<ul class="list-inline center-block">
					<%
						for (int k = 1; k <= 12; k++) {
					%>
					<li id="weather<%=k%>" class="text-center center-block"><a
						href="#"></a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>

		<!-- map 출력 -->
		<div class="col-sm-6">
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								<h3>Shop Find</h3>
								<br> 키워드 : <input type="text" value="" id="keyword"
									size="15">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>

		</div>

	</div>


	<!-- map -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=b7d9b82d0a5200c81b2186a85bd7b86e&libraries=services"></script>
	<script src="resources/js/map.js"></script>
	
</body>
</html>