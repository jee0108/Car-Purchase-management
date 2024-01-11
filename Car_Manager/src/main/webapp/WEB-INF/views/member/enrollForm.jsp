<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- css-->
<link rel="stylesheet" href="resources/css/enrollForm.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<div class="enroll-wrap">
		<div class="enroll-title">
			<h5>본인 인증</h6>
			<p>본인 인증을 위한 필수 정보를 입력하세요.</p>
		</div>

		<div class="text-align">
			
			<div>
				<div class="template1">
					<p>① 휴대폰 인증을 위해 정보를 입력하세요.</p>
					<div class="enroll-input">
						<input type="tel" name="memPhone" id="memPhone" maxlength="11" placeholder="&nbsp;&nbsp;휴대폰번호( - 제외, 숫자만 입력)" />
						<button id="phoneCheckBtn" onclick="phoneCheck();" disabled>인증</button>
					</div>

					<script>
						$('#memPhone').keyup(()=>{
							var checkLength = ($('#memPhone').val()).length;
							console.log(checkLength);
							if(checkLength<10){
								$('#phoneCheckBtn').attr("disabled",true);
							}else{
								$('#phoneCheckBtn').attr("disabled",false);
							}
						})
					</script>
					
					<script>
						function phoneCheck(){
							$.ajax({
								url: 'check-phone-meessage',
								data: {
									memPhone: $('#memPhone').val()
									},
								success:result=>{
									//console.log(result);
									$('#certification').val(result);
								},
								error:()=>{
									console.log('실패');
								}
							});
						}
					</script>

					<div class="enroll-input">
						<input type="hidden" name="certification" id="certification" value=""/>
						<input type="text" name="memPhoneCheck" id="memPhoneCheck" placeholder="&nbsp;&nbsp;인증번호" />
						<button onclick="certification();">확인</button>
						<div class="check1"></div>
					</div>
				</div>
				
				<script>
					function certification(){
						 var certification = $('#certification').val();
						 var userNumber = $('#memPhoneCheck').val();
						 
						 if(certification === userNumber){
							$(".check1").text("인증번호가 일치합니다.");
							$(".check1").css("color","green");
							$("#memPhone").attr("disabled",true);
							$("#memPhoneCheck").attr("disabled",true);
						 }
						 else{
							$(".check1").text("인증번호가 일치하지 않습니다. 다시 확인해주시기 바랍니다.");
							$(".check1").css("color","red");
							$("#memPhone").val("");
							$("#memPhoneCheck").val("");
						 }
					}
				</script>

				<div class="template1">
					<p>② 이메일 인증을 위해 정보를 입력하세요.</p>
					<div class="enroll-input">
						<input type="text" name="memEmail" id="memEmail" placeholder="&nbsp;&nbsp;이메일 주소" />
						<button type="button">입력</button>
					</div>
					<div class="enroll-input">
						<input type="text" name="memEmailCheck" id="memEmailCheck" placeholder="&nbsp;&nbsp;인증번호" />
						<button type="button">확인</button>
						<div class="check2"></div>
					</div>
				</div>

				<div class="template2">
					<p>③ 회원가입을 위해 정보를 입력하세요.</p>
					<div class="enroll-ID">
						<div>&nbsp;&nbsp;아이디 : admin</div>
					</div>
					<div class="enroll-input others">
						<input type="password" name="memPwd" id="memPwd" placeholder="&nbsp;&nbsp;비밀번호" />
					</div>
					<div class="enroll-input others">
						<input type="password" name="memPwdCheck" id="memPwdCheck" placeholder="&nbsp;&nbsp;비밀번호확인" />
					</div>
					<div class="enroll-input others">
						<input type="text" name="memName" id="memName" placeholder="&nbsp;&nbsp;이름" />
					</div>
					<div class="check3"></div>
				</div>
				
				<script>
					$(()=>{
						$('#memPwdCheck').keyup(()=>{
							var pwd = $('#memPwd').val();
							var chkPwd = $('#memPwdCheck').val();
							if(pwd == chkPwd){
								$(".check3").text("비밀번호가 일치합니다.");
								$(".check3").css("color","green");
							}
							else{
								$(".check3").text("비밀번호가 일치하지 않습니다. 다시 확인해주시기 바랍니다.");
								$(".check3").css("color","red");
							}
						})
					})
				</script>
				<br>
				<button type="button">회원가입</button>

			</div>
		
		</div>
		</div>

	<jsp:include page="../common/footer2.jsp" />
</body>
</html>