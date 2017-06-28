<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, our.project.cosmetic.*"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">



@media only screen and (max-width: 800px) {
    
    /* Force table to not be like tables anymore */
	#no-more-tables table, 
	#no-more-tables thead, 
	#no-more-tables tbody, 
	#no-more-tables th, 
	#no-more-tables td, 
	#no-more-tables tr { 
		display: block; 
	}
 
	/* Hide table headers (but not display: none;, for accessibility) */
	#no-more-tables thead tr { 
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
 
	#no-more-tables tr { border: 1px solid #ccc; }
 
	#no-more-tables td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%; 
		white-space: normal;
		text-align:left;
	}
 
	#no-more-tables td:before { 
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
		text-align:left;
		font-weight: bold;
	}
	
	#paging {
		text-align:center;
	}
 
	/*
	Label the data
	*/
	#no-more-tables td:before { content: attr(data-title); }
}
</style>
</head>
<body>

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
                	<c:if test="${sessionScope.signupVO.mid == null}">
	                    <li class="hidden active">
	                        <a href="/cosmetic/"></a>
	                    </li>
	                    <li class="">
	                        <a href="signup.cosmetic">Sign Up</a>
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
                    </c:if>
                    <c:if test="${sessionScope.signupVO.mid != null}">
	                     <li class="hidden active">
	                        <a href="/cosmetic/"></a>
	                    </li>
	                    <li class="">
	                    	<a class="page-scroll">${signupVO.mid } 님 어서오세요.</a>
	                    <li class="">
	                        <a class="page-scroll" href="logout.cosmetic">LogOut</a>
	                    </li>
	                    <li class="">
	                        <a class="page-scroll" href="board.cosmetic">자유게시판</a>
	                    </li>
	                    <li class="">
	                        <a class="page-scroll" href="sale.cosmetic">중고게시판</a>
	                    </li>
					</c:if>
                </ul>
            </div>
<!--             /.navbar-collapse -->
        </div>
<!--         /.container-fluid -->
    </nav>

<% int count = (Integer)request.getAttribute("totcount"); 
%>
<br>
<br>
<div class="container">
    <div class="row">
    <div class="col-md-12">
       <h1 class="text-center">
           CoCom Community
       </h1>
       <br>
       <br>
    </div>
    <div id="no-more-tables">
        <c:if test="${sessionScope.signupVO.mid != null}">
			<input type=button id="writebutton" value="글쓰기"><br>
		</c:if>
    <table class="table table-striped" width="300">
        <thead class="cf">
        	<tr>
        		<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>조회수</th>
        	</tr>
        </thead>
        <tbody>
        	<c:forEach items="${boardList}" var="vo">
				<tr>
						<td> <%=count-- %>  </td> 
						<td> <a href='detail.cosmetic?seq=${vo.bseq}'>${vo.btitle}</a></td> 
						<td> ${vo.bwriter} </td> 
						<td> ${vo.viewcount} </td>
				</tr>
				</c:forEach>	
        		</tbody>
        	</table>
        	<div id="paging" class="text-center">
        	<ui class="pagination">
        	<li>
			<% 
			int boardcount = (Integer)request.getAttribute("boardcount"); 
			int recordPerPage = 0;
			
			
			if(request.getParameter("recordPerPage") == null) {
				recordPerPage = 5;
			} else {
				recordPerPage = Integer.parseInt(request.getParameter("recordPerPage"));
			}
			
			int totalPage = 0;
			if( boardcount % recordPerPage==0) {
				totalPage = boardcount/recordPerPage;
			} else {
				totalPage = boardcount/recordPerPage + 1;
			}
			for(int i=1; i<=totalPage; i++) {
				out.println
				("<a href='board.cosmetic?pageNum=" + i + "'> " +i +"</a>");
			}
			%>
			</li>
			</ui>
			</div>
			<a href="/cosmetic/">메인화면으로</a>
        </div>
    </div>
</div>

<script src="resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#writebutton").on('click', function(){
			location.href="write.cosmetic";
		});
});
</script>
</body>
</html>