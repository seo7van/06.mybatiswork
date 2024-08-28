<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	.outer table {
		border:2px solid ;
		border-collapse : collapse;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="outer" align="center">
		<h1 align="center">게시판 상세조회</h1>
		
		<table border="1">
			<tr>
				<td width="100">글번호</td>
				<td width="500">${ b.boardNo }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${ b.boardTitle }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${ b.boardWriter }</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${ b.count }</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${ b.createDate.substring(0,10) }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td height="100">${ b.boardContent }</td>
			</tr>
		</table>
		<br>
		<table border="1">
		<!-- 다른 방법도 있다궁 !  
			<tr>
				<th width="100">댓글작성</th>
				<th width="400"><textarea cols="53" rows="3"></textarea></th>
				<th width="100"><button>등록</button></th>
			</tr>
			<tr>
				<th colspan="3" style="text-align:center">댓글(${rlist.size()})</th>
			</tr>
		-->
		
		<c:choose>
				<c:when test="${loginUser != null}">
					<tr>
						<th width="100">댓글작성</th>
						<th width="400"><textarea cols="53" rows="3" id="replyContent"></textarea></th>
						<th width="100"><button id="replyInsert">등록</button></th>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th width="100">댓글작성</th>
						<th width="400"><textarea cols="53" rows="3" readonly>로그인 후 이용 가능한 서비스입니다</textarea></th>
						<th width="100"><button disabled>등록</button></th>
					</tr>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${rlist.size() > 0}">
					<tr>
						<th colspan="3" style="text-align:center">댓글(${rlist.size()})</th>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<th colspan="3" style="text-align:center">댓글이 없습니다</th>
					</tr>
				</c:otherwise>
			</c:choose>
			<c:forEach var="r" items="${rlist}">
				<tr>
					<td>${r.replyWriter}</td>
					<td>${r.replyContent}</td>
					<td>${r.createDate.substring(0,10)}</td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
</body>
</html>