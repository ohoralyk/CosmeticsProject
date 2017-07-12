	var wholeData = [];
// 	var ingredientlist = [];
	//검색 / 클릭 / 클릭 후 모든 관리
	function search() {
		var sel_condition = $('select option:selected').val();
		var search_val = $('#searchbar').val();
		console.log(sel_condition);
		console.log(search_val);
		$.ajax({
			url : "search.cosmetic?sel_condition=" + sel_condition
					+ "&search_val=" + search_val,
			error : function() {
				alert('error');
			},
			success : function(data) {
				console.log(data);
				var data_list = data["list"];
				var check_list = data["checklist"];
				var ingcheck_list = data["inglist"];
				DrawData(data_list);
				makeCheckbox(check_list);
				wholeData = data_list;
// 				ingredientlist = data_list;
// 				ingCheckbox(ingcheck_list);
				$('#chbox').attr('class', 'alert alert-info');
			}
		});
	}

	//검색 버튼 클릭 후 자료박스
	function DrawData(data) {
// 		console.log(data[0].ingredient);
		$('#con').html("");
		$('#chbox').html("");
		var html = "<table class='table table-striped table-hover text-center table-bordered'><thead><tr><th>브랜드</th><th>상품</th><th>용도</th></tr></thead><tbody>";
		var tr = "";
		var tr1 = "<form><ul class='list-inline center-block'>";
		for (var i = 0; i < data.length; i++) {
			tr = tr + "<tr onclick='test(" + data[i].cosno + ")'>" 
					+ "<td>" + data[i].company + "</td>" 
					+ "<td>" + data[i].cosname + "</td>"
					+ "<td>" + data[i].category + "</td></tr>";
		}
		$('#con').html(html + tr + "</tbody></table>");
	}

	//검색 버튼 클릭 후 체크박스
	function makeCheckbox(arr) {
		$('#chbox').empty();
		for (var i = 0; i < arr.length; i++) {
			$('#chbox').append(
					"<input type='checkbox' value="+arr[i]+" id="+ arr[i] +">" + arr[i]);
		}
		var length = $('tbody>tr').length;
		$('input').change(
				function() {
					var click = $(this).val();
					console.log(click);
					if (this.checked) {
						for (var i = 0; i < length; i++) {
							var text = $('tbody>tr:nth(' + i + ')').children('td:nth(2)').text();
							if (click == text) {
								$('tbody>tr:nth(' + i + ')').show();
							} else if (click != text) {
								$('tbody>tr:nth(' + i + ')').hide();
							}  else {
								$('tbody>tr:nth(' + i + ')').show();
							}
						}
					} else {
						for (var i = 0; i < length; i++) {
							var text = $('tbody>tr:nth(' + i + ')').children('td:nth(2)').text();
							if (click != text) {
								$('tbody>tr:nth(' + i + ')').show();
							} else if (click == text) {
								$('tbody>tr:nth(' + i + ')').show();
							} else {
								$('tbody>tr:nth(' + i + ')').hide();
							}
							
						}
					}
				});
	}

	//스킨 타입 거르기 중.... ㅠㅠ
// 	function ingCheckbox(list) {
// 		console.log(list);
// 		var length = list.length;
// 		var ingname = "";
// 		$('input').change(function() {
// 			var ingclick = $(this).val();
// 			if (this.checked) {
// 				var j = 0;
// 				for (var i = 0; i < length; i++) {
// 					var inguseful = list[i].useful;
// 					var ingcosmetic = [];
// 					var ingcos = "";
// 						ingname = list[i].ingname;
// 					if (ingclick == inguseful) {
// 						for (var k = 0; k < ingredientlist.length; k++) {
// 							ingcosmetic = ingredientlist[k].ingredient;
// 							ingcos = ingcosmetic[k];
// 							console.log(ingcos);
// 							console.log(ingname);
// 							if (ingname == ingcos) {
// 								//여기가 문제임
// 								$('tbody>tr:nth(' + k + ')').show();
// 							} else if (ingname != ingcos) {
// 								$('tbody>tr:nth(' + k + ')').hide();
// 							}
// 						}
// 					}
// 					j++;
// 				}
// 			} else {
// 				var j = 0;
// 				for (var i = 0; i < length; i++) {
// 					var inguseful = list[i].useful
// 					var ingcosmetic = [];
// 					if (ingclick == inguseful) {
// 						ingname = list.ingname;
// 						for (var k = 0; k < ingredientlist.length; k++) {
// 							ingcosmetic = ingredientlist[k].ingredient;
// 							if (ingname != ingcos) {
// 								$('tbody>tr:nth(' + k + ')').show();
// 							} else if (ingname == ingcos) {
// 								$('tbody>tr:nth(' + k + ')').hide();
// 							}
// 						}
// 					}
// 					j++;
// 				}
// 			}
// 		});
// 	}

	//검색 된 자료 클릭 후 세부정보박스
	function test(cosno) {
		for (var i = 0; i < wholeData.length; i++) {
			if (wholeData[i].cosno == cosno) {
				$('.modal-title').text(wholeData[i].cosname);
				$('#cos_category').text("용도 : " + wholeData[i].category);
				$('#cos_company').text("브랜드 : " + wholeData[i].company);
				$('#cos_ingredient').text("성분 : " + wholeData[i].ingredient + ", ");
				$("#myModal").modal();
			}
		}
	}