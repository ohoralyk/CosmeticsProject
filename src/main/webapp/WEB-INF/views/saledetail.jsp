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
              <h3 class="panel-title">${sale.stitle}</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>작성자:</td>
                        <td>${sale.swriter}</td>
                      </tr>
                      <tr>
                        <td>작성일:</td>
                        <td>${sale.stime}</td>
                      </tr>
					  <tr>                     
                        <td>글내용:
                        </td>
                        <td>${sale.scontents}</td>
                      </tr>
                      <tr>
                      	<td>제품사진:</td>
                      	<td><img src= "resources/images/${sale.simage}" width="250px"></td>
                      </tr>
                    </tbody>
                  </table>
                  <a href="sale.cosmetic" class="btn btn-primary">게시판으로 돌아가기</a>
                  <%-- <c:if test="${sessionScope.signupVO.mid != null}">
                      <a href="check.cosmetic?seq=${board.bseq}" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                      <a href="delete.cosmetic?seq=${board.bseq}" data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                  </c:if> --%>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>