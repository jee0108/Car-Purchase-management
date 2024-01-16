<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- css-->
<link rel="stylesheet" href="resources/css/loginForm.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="text-align">
		<div class="login-title">
			‣ 이메일 로그인
		</div>
		<div>
			<form action="login" method="get">
				<div class="login-input">
				<input type="email" name="memEmail" id="memEmail" placeholder="&nbsp;&nbsp;이메일 주소" /> <br>
				</div>
				<div class="login-input">
				<input type="password" name="memPwd" id="memPwd" placeholder="&nbsp;&nbsp;비밀번호" /> <br>
				</div>
				
				<button type="submit">로그인</button>
			</form>

			<div class="login-footer">
				<a href="find-Id" class="login-a">아이디 찾기</a> | <a href="find-Pwd" class="login-a">비밀번호 찾기</a>
				<div class="login-footer-end login-a"><a href="member-enroll">회원가입 ►</a></div>
			</div>

			
		</div>
		
		
	</div>

	<jsp:include page="../common/footer2.jsp" />
</body>
</html>