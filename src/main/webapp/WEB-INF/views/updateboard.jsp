<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<div class="container">

<div class="col-md-5">
    <div class="form-area">  
        <form role="form" action="update.cosmetic" method="POST">
        <br style="clear:both">
        	<h3 style="margin-bottom: 25px; text-align: center;">글 수정</h3>
    			<div class="form-group">
					<input type="text" class="form-control" id="btitle" name="btitle" value="${board.btitle}" required>
					<input type="hidden" name="bseq" value="${seq}">
				</div>
                <div class="form-group">
                    <textarea class="form-control" type="textarea" id="bcontents" name="bcontents" maxlength="140" rows="7">${board.bcontents}</textarea>               
                </div>          			
           		<input type="hidden" name="bwriter" value="${sessionScope.signupVO.mid}"/>
        <button type="submit" class="btn btn-primary pull-right">완료</button>
        <button type="button" id="cancelwrite" name="calcelwrite" class="btn btn-primary pull-right">취소</button>
        </form>
    </div>
</div>
</div>
</body>
</html>