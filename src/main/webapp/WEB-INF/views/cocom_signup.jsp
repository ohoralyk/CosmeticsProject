<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CoCom 회원가입</title>
<script src="resources/js/jquery-3.1.1.min.js"></script>

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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

</head>
<body id="page-top" class="index">

	<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top affix-top">
	        <div class="container">
	<!--             Brand and toggle get grouped for better mobile display -->
	            <div class="navbar-header page-scroll">
	                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	                    <span class="sr-only">Toggle navigation</span>Menu<i class="fa fa-bars"></i>
	                </button>
	                <a class="navbar-brand page-scroll" href="/cosmetic/">CoCom</a>
	            </div>
				<!--  Collect the nav links, forms, and other content for toggling -->
	            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	                <ul class="nav navbar-nav navbar-right">
		                    <li class="hidden active">
		                        <a href="/cosmetic/#page-top"></a>
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
	                </ul>
	            </div>
	<!--             /.navbar-collapse -->
	        </div>
	<!--         /.container-fluid -->
	    </nav>



<section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">CoCom 회원가입</h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>
          	</div>
         	<div class="row">
         	<div>${msg}</div>
    		<form id="defaultForm" method="post" class="form-horizontal" action="signup.cosmetic">
                        <div class="form-group">
                            <label class="col-lg-3 control-label" >아이디</label>
                            <div class="col-lg-5">
                                <input type="text" class="form-control" name="mid" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">비밀번호</label>
                            <div class="col-lg-5">
                                <input type="password" class="form-control" name="mpw" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">성별</label>
                            <div class="col-lg-5">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="mgender" value="m" checked/>남
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="mgender" value="f" />여
                                    </label>
                                </div>
                               </div>
                        </div>
                       	<div class="form-group"> 
                       	<label class="col-lg-3 control-label">피부상태</label>
                            <div class="col-lg-5">
                            	<select name=mtype>
									<option value="t1">건성</option>
									<option value="t2">복합성</option>
									<option value="t3">지성</option>
									<option value="t4">중성</option>
									<option value="t5">민감성</option>
								</select>								
                            </div>
                       	</div>

                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">나이</label>
                            <div class="col-lg-5">
                                
                                <select name=mage>
									<option value="1" selected="selected">10대</option>
									<option value="2">20대</option>
									<option value="3">30대</option>
									<option value="4">40대</option>
									<option value="5">50대</option>
									<option value="6">60대 이상</option>
								</select>
			
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">피부질병</label>
                            <div class="col-lg-5">
                            
                            <!-- 
                           <select name=mdisease>
									<option value="s1">아토피</option>
									<option value="s2">알레르기</option>
									<option value="s3">화상</option>
									<option value="s4">여드름</option>
									<option value="s5">습진</option>
									<option value="s6">홍조</option>
									<option value="s7">색소침착</option>
									<option value="s8">피지과다분비</option>
									<option value="s9">기타질병</option>
									<option value="s10" selected="selected">질병없음</option>
								</select>
                             -->

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="mdisease" value="s1">아토피
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="mdisease" value="s2">알레르기
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="mdisease" value="s3">화상
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="mdisease" value="s4">여드름
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                       <input type="checkbox" name="mdisease" value="s5">습진
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                       <input type="checkbox" name="mdisease" value="s6">홍조
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                       <input type="checkbox" name="mdisease" value="s7">색소침착
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                       <input type="checkbox" name="mdisease" value="s8">피지과다분비
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                       <input type="checkbox" name="mdisease" value="s9">기타질병
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                       <input type="checkbox" name="mdisease" value="s10" checked="checked">질병없음
                                    </label>
									
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <input type="submit" class="btn btn-primary" value="Sign Up"/>
								<input type="button" class="btn btn-primary" id="cancel" value="Cancle">
                            </div>
                        </div>
                    </form>
        	</div>   
        </div>
    </section>
<script type="text/javascript">
$('#cancel').on('click',function(){
	location.href="/cosmetic/";
});
</script>
</body>
</html>