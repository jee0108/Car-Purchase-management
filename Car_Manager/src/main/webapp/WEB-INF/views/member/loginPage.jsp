<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- css-->
<link rel="stylesheet" href="resources/css/login.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="loginView">
		<img class="transform" src="https://www.hyundai.co.kr/image/upload/asset_library/MDA00000000000012196/eab370c0064f4377accf1993dac2d851.jpg"/>
		
		
		<div class="position">
			<div><h1>MY PAGE</h1></div>
			<div><h4>Your daily life will be special the moment you select GENESIS</h4></div>
			<div>
				<a href="member-login" class="button">로그인</a>
				<a href="member-enroll" class="button">회원가입</a>
			</div>
		</div>
		
		
	</div>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>