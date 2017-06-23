<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<div class="container">
<div class="col-md-5">
    <div class="form-area">  
        <form role="form" action="salewrite.cosmetic" method="POST" enctype="multipart/form-data">
        <br style="clear:both">
                    <h3 style="margin-bottom: 25px; text-align: center;">중고게시판 작성</h3>
    				<div class="form-group">
						<input type="text" class="form-control" id="stitle" name="stitle" placeholder="글제목" required>
					</div>
                    <div class="form-group">
                    	<textarea class="form-control" type="textarea" id="scontents" name="scontents" placeholder="글내용" maxlength="140" rows="7"></textarea>               
                    </div>
                    <div class="form-group">
                    	<input type="file" id="imagefile" name="imagefile"><br>
                    </div>
					<div class="form-group">
						<input type="text" class="form-control" id="spassword" name="spassword" placeholder="글 비밀번호" required>
					</div>           			
           			<input type="hidden" name="swriter" value="${sessionScope.signupVO.mid}"/>
        <input type="submit" class="btn btn-primary pull-right" value="완료"/>
        </form>
    </div>
</div>
</div>
</body>
</html>