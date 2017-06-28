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
        <form role="form" action="updatesale.cosmetic" method="POST" enctype="multipart/form-data">
        <br style="clear:both">
        	<h3 style="margin-bottom: 25px; text-align: center;">글 수정</h3>
    			<div class="form-group">
					<input type="text" class="form-control" id="stitle" name="stitle" value="${sale.stitle}" required>
					<input type="hidden" name="sseq" value="${seq}">
				</div>
                <div class="form-group">
                    <textarea class="form-control" type="textarea" id="scontents" name="scontents" maxlength="140" rows="7">${sale.scontents}</textarea>               
                </div>
                <div>
                    제품사진:
                    <img src= "/image/${sale.pimage}" width="500px">
                </div>
                <div class="form-group">
                수정할 사진 :
                    	<input type="file" id="updateimagefile" name="updateimagefile"><br>
                    </div>
           		<input type="hidden" name="swriter" value="${sessionScope.signupVO.mid}"/>
        <button type="submit" class="btn btn-primary pull-right">완료</button>
        </form>
	</script>
    </div>
</div>
</div>
</body>
</html>