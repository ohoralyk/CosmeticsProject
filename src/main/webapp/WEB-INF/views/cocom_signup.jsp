<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CoCom 회원가입</title>
<script src="resources/jquery-3.1.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<div class="container">
	<div class="row">
		<h2>CoCom 회원가입</h2>
	</div>
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
                                        <input type="radio" name="mgender" value="m" />남
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
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="mage" value="1" />10대
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="mage" value="2" />20대
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="mage" value="3" />30대
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="mage" value="4" />40대
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="mage" value="5" />50대
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="mage" value="6" />60대이상
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">피부질병</label>
                            <div class="col-lg-5">
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
                                       <input type="checkbox" name="mdisease" value="s10">질병없음
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <input type="submit" class="btn btn-primary" value="완료"/>
								<input type="button" class="btn btn-primary" id="cancel" value="취소">
                            </div>
                        </div>
                    </form>
</div>
<script type="text/javascript">
$('#cancel').on('click',function(){
	location.href="/cosmetic/";
});
</script>
</body>
</html>