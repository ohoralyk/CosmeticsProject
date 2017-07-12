// 	navigator.geolocation.getCurrentPosition(function(pos) {
// 	    var latitude = pos.coords.latitude;
// 	    var longitude = pos.coords.longitude;
// 	});
// 	var gridx = latitude;
// 	var gridy = longitude;
	var gridx = 60;
	var gridy = 106;
	$(document).ready(function() {
		$.ajax({
			url : "http://www.kma.go.kr/wid/queryDFS.jsp?gridx=" + gridx + "&gridy=" + gridy,
			crossOrigin : true,
			dataType : "xml",
			success : function(response) {
				console.log(response);
				var i = 1;
				$(response).find('data').each(function(){
					if (i <= 12) {
						var day = $(this).find('day').text();
						var daytxt = "오늘";
						var hour = $(this).find('hour').text();
						var wfkor = $(this).find('wfKor').text();
						var temp = $(this).find('temp').text();
						if (day == 1) {
							var daytxt = "내일";
						}
						if (day == 2) {
							var daytxt = "모래";
						}
						switch (wfkor) {
						case "맑음":
							$('<img width=120/>').appendTo("#weather" + i).attr('src', 'resources/images/weather/clear sky.png');
							break;
						case "구름 조금":
							$('<img width=120/>').appendTo("#weather" + i).attr('src', 'resources/images/weather/scattered clouds.png');
							break;
						case "구름 많음":
							$('<img width=120/>').appendTo("#weather" + i).attr('src', 'resources/images/weather/broken clouds.png');
							break;
						case "안개":
							$('<img width=120/>').appendTo("#weather" + i).attr('src', 'resources/images/weather/mist.png');
							break;									
						case "비":
							$('<img width=120/>').appendTo("#weather" + i).attr('src', 'resources/images/weather/rain.png');
							break;
						case "소나기":
							$('<img width=120/>').appendTo("#weather" + i).attr('src', 'resources/images/weather/show rain.png');
							break;
						case "눈":
							$('<img width=120/>').appendTo("#weather" + i).attr('src', 'resources/images/weather/snow.png');
							break;
						case "안개":
							$('<img width=120/>').appendTo("#weather" + i).attr('src', 'resources/images/weather/mist.png');
							break;
						default:
							$('<img width=120/>').appendTo("#weather" + i).attr('src', 'resources/images/weather/few clouds.png');
							break;
						}
						var output = "<br>" + daytxt + " " + hour + "시 <br>" + temp + "℃  <br>" + wfkor;
						$('#weather'+ i).append(output+ "<br>");
					}
					i++;
				});
			}
		});
	})