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
<link rel="stylesheet" href="resources/css/header.css">

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
					<li><a href="model-list">모델</a></li>
				</ul>
			</div>
			<div class="header-list">
				<ul class="header-right">
					<c:if test="${sessionScope.loginUser.memRole eq 'R' || sessionScope.loginUser.memRole eq 'D'}">
						<li class="header-right"><a href="admin">관리자 페이지</a></li>
					</c:if>

					<c:choose>
						<c:when test="${empty loginUser}">
							<li class="login"><a href="login-page">마이 페이지</a></li>
						</c:when>
						<c:otherwise>

							<c:choose>
								<c:when test="${sessionScope.loginUser.memRole eq 'U'}">
									<li class="login"><a href="mypage">마이 페이지</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="mypage">마이 페이지</a></li>
								</c:otherwise>
							</c:choose>

						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>

	</div>


</body>
</html>

