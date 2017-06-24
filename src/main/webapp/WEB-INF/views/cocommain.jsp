<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="our.project.cosmetic.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/main.css?ver=0" /> -->
<title>Cosmetic Main</title>

<!-- 제이쿼리 불러오기  -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=b7d9b82d0a5200c81b2186a85bd7b86e&libraries=services,clusterer,drawing"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style>
	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}

/* .container{
	background-color: #EBEBBB;
} */
th{
	text-align: center;
}
#con{
	margin-top: 1%;
}

</style>

<!-- 날씨 제이쿼리 -->
<script type="text/javascript">
// 	navigator.geolocation.getCurrentPosition(function(pos) {
// 	    var latitude = pos.coords.latitude;
// 	    var longitude = pos.coords.longitude;
// 	});
	var gridx = 60;
	var gridy = 106;
	
	$(document).ready(function(){
		$.ajax({
				url:"http://www.kma.go.kr/wid/queryDFS.jsp?gridx=" + gridx + "&gridy=" + gridy,
				crossOrigin: true,
				dataType: "xml",
				success: function(response){
					console.log(response);
					var i = 1;
					$(response).find('data').each(function(){
						if(i <= 6){
							console.log($("data").attr("seq"));
							var day = $(this).find('day').text();
							var daytxt = "오늘"
							var hour = $(this).find('hour').text();
							var wfkor = $(this).find('wfKor').text();
							var temp = $(this).find('temp').text();
							 if(day == 1) { var daytxt = "내일"; }
		                     if(day == 2) { var daytxt = "모래"; }
		                     
							switch (wfkor) {
								case "맑음":
									$('<img width=120/>').appendTo("#weather"+i).attr('src', 'resources/images/weather/clear sky.png');
								break;
								case "구름 조금":
									$('<img width=120/>').appendTo("#weather"+i).attr('src', 'resources/images/weather/scattered clouds.png');
								break;
								case "구름 많음":
									$('<img width=120/>').appendTo("#weather"+i).attr('src', 'resources/images/weather/broken clouds.png');
								break;
								case "안개":
									$('<img width=120/>').appendTo("#weather"+i).attr('src', 'resources/images/weather/mist.png');
								break;
								case "비":
									$('<img width=120/>').appendTo("#weather"+i).attr('src', 'resources/images/weather/rain.png');
								break;
								case "소나기":
									$('<img width=120/>').appendTo("#weather"+i).attr('src', 'resources/images/weather/show rain.png');
								break;
								case "눈":
									$('<img width=120/>').appendTo("#weather"+i).attr('src', 'resources/images/weather/snow.png');
								break;
								case "안개":
									$('<img width=120/>').appendTo("#weather"+i).attr('src', 'resources/images/weather/mist.png');
								break;
								default:
									$('<img width=120/>').appendTo("#weather"+i).attr('src', 'resources/images/weather/few clouds.png');
								break;
								}
							var output = "<br>" + daytxt + " " + hour + "시 <br>" + temp + "℃  <br>" + wfkor;
							$('#weather'+i).append(output + "<br>"); 
						}
						i++;
					});
				}	 
		});
	})
</script>

<!-- 검색 조회 제이쿼리-->
	<script>
		var wholeData = [];
		//검색 / 클릭 / 클릭 후 모든 관리
		function search() {
			var sel_condition = $('select option:selected').val();
			var search_val = $('#searchbar').val();
			console.log(sel_condition);
			console.log(search_val);
			$.ajax({
				url : "search.cosmetic?sel_condition=" + sel_condition + "&search_val=" + search_val,
				error : function(){
					alert('error');
				},
				success : function(data){
					console.log(data);
					var data_list = data["list"];
					var check_list = data["checklist"];
					var ingcheck_list = data["inglist"];
					DrawData(data_list);
					makeCheckbox(check_list);
					wholeData = data_list;
				}
			});
		}
		
	//검색 버튼 클릭 후 자료박스
	function DrawData(data){
		console.log(data);
		$('#con').html("");
		$('#chbox').html("");
		var html = "<table class='table table-hover text-center table-bordered'><thead><tr><th>브랜드</th><th>상품</th><th>용도</th></tr></thead><tbody>";
		var tr = "";
		var tr1 = "<form><ul class='list-inline center-block'>";
		for(var i = 0; i < data.length; i++){
			tr = tr + "<tr onclick='test(" + data[i].cosno + ")'>" 
			+ "<td>" + data[i].company + "</td>"
			+ "<td>" + data[i].cosname + "</td>"
			+ "<td>" + data[i].category + "</td></tr>";
		}
		$('#con').html(html + tr + "</tbody></table>");
	}
	
	//검색 버튼 클릭 후 클릭박스
	function makeCheckbox(arr){
		$('#chbox').empty();
		for(var i = 0 ; i < arr.length; i++){
			$('#chbox').append("<input type='checkbox' value="+arr[i]+">"+arr[i]);
		}
		var length = $('tbody>tr').length;
		$('input').change(function(){
		var click = $(this).val();
		console.log(click);
			if(this.checked){
				for(var i = 0; i < length; i++){
					var text = $('tbody>tr:nth('+i+')').children('td:nth(2)').text();
					if(click == text){
						$('tbody>tr:nth('+i+')').hide();
					}
				}
			}else{
				for(var i = 0; i < length; i++){
					var text = $('tbody>tr:nth('+i+')').children('td:nth(2)').text();			
					if(click == text){
						$('tbody>tr:nth('+i+')').show();
					}
				}
			}
		});
	}
	
	//스킨 타입 거르기 중.... ㅠㅠ
// 	function ingCheckbox(list) {
// 		console.log(list)
// 		$('input').change(function(){
// 			var click = $(this).find("Object").each(function() {
				
// 				$("useful").
// 			});
// 		})
// 	}
	
	
	
	//검색 된 자료 클릭 후 세부정보박스
	function test(cosno){
		for(var i = 0; i < wholeData.length; i++){
			if(wholeData[i].cosno == cosno){
				$('.modal-title').text(wholeData[i].cosname);
				$('#cos_category').text(wholeData[i].category);
				$('#cos_company').text(wholeData[i].company);
				$('#cos_ingredient').text(wholeData[i].ingredient);
				$("#myModal").modal();
			}
		}
	}

</script>

</head>
<body class="container">
	<nav class="navbar">
	  <div class="container-fluid">
	    <ul class="nav navbar-nav navbar-right">
	    <c:if test="${sessionScope.signupVO.mid == null}">
			<li><a href="signup.cosmetic"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="login.cosmetic"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			<li><a href="board.cosmetic">자유게시판</a></li>
			<li><a href="sale.cosmetic">중고게시판</a></li>
	    </c:if>
	    <c:if test="${sessionScope.signupVO.mid != null}">
	    	<li><a>${signupVO.mid } 님 어서오세요.</a></li>
			<li><a href='logout.cosmetic'>로그아웃</a></li>
			<li><a href="board.cosmetic">자유게시판</a></li>
			<li><a href="sale.cosmetic">중고게시판</a></li>
	    </c:if>
	    </ul>
	  </div>
	</nav>
	<div class="row">
		<img class="center-block" alt="이미지가 없습니다." src="resources/images/Cocom.jpg" class="logo">
	</div>
	
	<!-- 검색 -->
	<div class="row">
		<div class="col-md-2">
			<select class="form-control" id="sel1">
				<option>브랜드</option>
<!-- 				<option>용도</option> -->
				<!--  <option>성분</option>-->
				<option>제품명</option>
			</select>
		</div>
		<div class="col-md-8">
			<input type="text" class="form-control" id="searchbar" >
		</div>
		<div class="col-md-2">
			<button type="button" class="btn btn-success btn-block" onclick="search()" id="search" style="height: 34px;" >검색</button>
		</div>
	</div>

<!-- 검색 결과물 -->
<div id="ingbox">
	<ul>
		<li><input type="checkbox" value="건성">건성</li>
		<li><input type="checkbox" value="지성">지성</li>
		<li><input type="checkbox" value="민감성">민감성</li>
	</ul>
</div>
<div id="chbox"></div>
<div id="con"></div>

<!--  Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
			<div id="cos_category"></div>
			<div id="cos_company"></div>
			<div id="cos_ingredient"></div>
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
		<div id="weather" class="alert alert-success" style="background-color:lavender;">
			<h2>날씨</h2><br>
			<ul class="list-inline center-block" >
				<% for(int k=1; k <= 6; k++){	%>
			   	<li id="weather<%=k %>" class="text-center center-block" ><a href="#"></a></li><%} %>
			</ul>
		</div>		
	</div>
	
<!-- map 출력 -->
	<div class="col-sm-6">	
		<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		                <form onsubmit="searchPlaces(); return false;">
		                	<h3>Shop Find</h3><br>
		                    	키워드 : <input type="text" value="" id="keyword" size="15"> 
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=b7d9b82d0a5200c81b2186a85bd7b86e&libraries=services"></script>

<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;
    console.log(keyword);

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        /* alert('키워드를 입력해주세요!'); */
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data.places);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].title);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.title + '</h5>';

    if (places.newAddress) {
        itemStr += '    <span>' + places.newAddress + '</span>' +
                    '   <span class="jibun gray">' +  places.address  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>


</body>
</html>