<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- css-->
<link rel="stylesheet" href="resources/css/adminHeader.css">

</head>
<body>
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert('Completion','${alertMsg}', function(){alertify.success('success')});
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	<div id="header">

		<div class="headerInner">
			<sapn class="header-logo">
			<a href="/genesis">
			<img class="header-logo"
				src="https://www.genesis.com/etc.clientlibs/genesis-p2/global/clientlibs/clientlib-basepage/resources/images/logo.png"
				width="110" height="25">
			</a>
			</sapn>
			<div class="header-list">
				<ul>
					<c:if test="${loginUser.memRole eq 'R'}">
						<li class="header-right"><a href="item-management">품목 관리</a></li>
						<li class="header-right"><a href="equipment-management">비품 관리</a></li>
						<li class="header-right"><a href="procurement-Management">조달 관리</a></li>
						<li class="header-right"><a href="admin-enroll">관리자 등록</a></li>
					</c:if>
					<c:if test="${loginUser.memRole eq 'D'}">
						<li class="header-right"><a href="estimate">상담 확인</a></li>
						<li class="header-right"><a href="member-enroll">회원 등록</a></li>
						<li class="header-right"><a href="write-quote">견적서 작성</a></li>
						<li class="header-right"><a href="procurement">조달신청 목록</a></li>
					</c:if>
				</ul>
			</div>
		</div>

	</div>

</body>
</html>

