<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">
	.user-row {
	    margin-bottom: 14px;
	}
	
	.user-row:last-child {
	    margin-bottom: 0;
	}
	
	.dropdown-user {
	    margin: 13px 0;
	    padding: 5px;
	    height: 100%;
	}
	
	.dropdown-user:hover {
	    cursor: pointer;
	}
	
	.table-user-information > tbody > tr {
	    border-top: 1px solid rgb(221, 221, 221);
	}
	
	.table-user-information > tbody > tr:first-child {
	    border-top: 0;
	}
	
	
	.table-user-information > tbody > tr > td {
	    border-top: 0;
	}
	.toppad
	{margin-top:20px;
	}
	
	.thumbnail {
    padding:0px;
	}
	.panel {
		position:relative;
	}
	.panel>.panel-heading:after,.panel>.panel-heading:before{
		position:absolute;
		top:11px;left:-16px;
		right:100%;
		width:0;
		height:0;
		display:block;
		content:" ";
		border-color:transparent;
		border-style:solid solid outset;
		pointer-events:none;
	}
	.panel>.panel-heading:after{
		border-width:7px;
		border-right-color:#f7f7f7;
		margin-top:1px;
		margin-left:2px;
	}
	.panel>.panel-heading:before{
		border-right-color:#ddd;
		border-width:8px;
	}
</style>
</head>
<body>
<div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">${board.btitle}</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>작성자:</td>
                        <td>${board.bwriter}</td>
                      </tr>
                      <tr>
                        <td>작성일:</td>
                        <td>${board.btime}</td>
                      </tr>
                      <tr>
                        <td>성별/연령:</td>
                        <td><div id="ss">${writer.mgender}</div><div id="ss1">${writer.mage}</div></td>
                      </tr>
                      <tr>
                        <td>피부정보:</td>
                        <td><div id="ss2">${writer.mtype}</div><div id="ss3">${writer.mdisease}</div></td>
                      </tr>
                      <tr>
                        <td>글내용:</td>
                        <td>${board.bcontents}
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <a href="board.cosmetic" class="btn btn-primary">게시판으로 돌아가기</a>
                  <c:if test="${sessionScope.signupVO.mid != null}">
                      <a href="check.cosmetic?seq=${board.bseq}" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                      <a href="delete.cosmetic?seq=${board.bseq}" data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                  </c:if>
                </div>
              </div>
            </div>
               		<div class="panel-footer" id="listReply">
                 	<table class="table table-bordered table-hover">
                 		<thead>
                 			<tr>
                 				<th>작성자</th>
                 				<th>내용</th>
                 				<th>작성일</th>
                 				<th></th>
                 			</tr>
               		</thead>
               		<tbody id="ReplyBody">      			
               		</tbody>
                 	</table>
                 </div>
                 <div>
                 <c:if test="${sessionScope.signupVO.mid != null}">
                 	<br>
                 	작성자 : ${sessionScope.signupVO.mid}<br>
                 	<br>
                 	<textarea class="form-control" id="rcontents" name="rcontents" placeholder="댓글을 입력하세요." maxlength="50" rows="5"></textarea>
                 	<br>
                 	<input type="button" id="btnReply" value="작성완료" onclick="insertReply()"></input> 
                 	</c:if>    
                 </div>
          </div>
        </div>
      </div>
    </div>
<script type="text/javascript">
	var type = '${writer.mtype}';
	var gender = '${writer.mgender}';
	var age = '${writer.mage}';
	var disease = '${writer.mdisease}';

	$(function(){
		transType(type);
		transGender(gender);
		transAge(age);
		transDisease(disease);
		getReply();
	});

	function insertReply(){
		var rcontents = $('#rcontents').val();
		var seq = ${board.bseq};
		$.ajax({
			url : 'insert.reply',
			data : 'rcontents='+rcontents+'&bseq='+seq,
			error : function(){console.log('Reply Insert Error');},
			success : function(){
				console.log('Reply Insert Success');
				getReply();
				$('#rcontents').val("");
			}
		});
	}
	
	function getReply(){
		var seq = ${board.bseq};
		$.ajax({
			url : 'list.reply',
			data : 'seq='+seq,
			error : function(){console.log('Reply Load Fail');},
			success : function(data){
				console.log(data);
				$('#ReplyBody').html("");
				for(var i = 0; i < data.length; i++){
					$('#ReplyBody').append("<tr><td>"+data[i].rid+"</td><td>"+data[i].rcontents+"</td><td>"+data[i].rdate+"</td><td><input type='button' value='삭제' onclick='re_delete("+data[i].rnum+")'></td></tr>"); 
				}
			}
		});
	}
	
	function re_delete(rnum){
		console.log(rnum);
		var seq = ${board.bseq};
		 $.ajax({
			url : 'delete.reply',
			data :{
				'seq' : seq,
				'rnum' : rnum 
			},
			error : function(){console.log('Reply Load Fail');},
			success : function(data){
				console.log(data);
				$('#ReplyBody').html("");
				for(var i = 0; i < data.length; i++){
					$('#ReplyBody').append("<tr><td>"+data[i].rid+"</td><td>"+data[i].rcontents+"</td><td>"+data[i].rdate+"</td><td><input type='button' value='삭제' onclick='re_delete("+data[i].rnum+")'></td></tr>");
					
				}
			}
		}); 
	}
	
	var types = ["t1","t2","t3","t4","t5"];
	var types_ko = ["건성","복합성","지성","중성","민감성"];
	function transType(string){
		for(var i = 0 ; i < types.length; i++){
			if(types[i] == type){
				type = types_ko[i];
			}
		}
		$('#ss2').text(type);
	}

	var genders = ["m","f"];
	var genders_ko = ["남","여"];
	function transGender(string){
		for(var i = 0 ; i < genders.length; i++){
			if(genders[i] == gender){
				gender = genders_ko[i];
			}
		}
		$('#ss').text(gender);
	}

	var ages = ["1","2","3","4","5","6"];
	var ages_ko = ["10대","20대","30대","40대","50대","60대 이상"];
	function transAge(string){
		for(var i = 0 ; i < ages.length; i++){
			if(ages[i] == age){
				age = ages_ko[i];
			}
		}
		$('#ss1').text(age);
	}

	var diseases = ["s1","s2","s3","s4","s5","s6","s7","s8","s9","s10"];
	var diseases_ko = ["아토피","알레르기","화상","여드름","습진","홍조","색소침착","피지과다분비",
		"기타질병","질병없음"];
	function transDisease(string){
		for(var i = 0 ; i < diseases.length; i++){
			if(diseases[i] == disease){
				disease = diseases_ko[i];
			}
		}
		$('#ss3').text(disease);
	}
	</script>
</body>
</html>