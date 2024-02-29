<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
						<input type="tel" name="memPhone" id="memPhone" maxlength="11" placeholder="&nbsp;&nbsp;휴대폰번호( - 제외, 숫자만 입력)"
						 onKeyup="this.value=this.value.replace(/[^0-9]/g,'')";/>
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
								type: "POST",
								url: 'check-phone-meessage',
								data: {
									memPhone: $('#memPhone').val()
									},
								success:result=>{
									console.log(result);
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
						<button onclick="mail();" id="duplicate" disabled>인증</button>
					</div>
					
					<script>
					$(()=>{
						
						$('#memEmail').keyup(()=>{
							var email = $('#memEmail').val();
							var checkResult = $(".check2");

							function mailFormCheck(email){
							    var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
							    return form.test(email);
							}
							
							
							if(mailFormCheck(email)){
								checkResult.show().css("color","green").text("올바른 이메일 형식입니다.");
								$.ajax({
									url: 'duplicate-check',
									data: {
										memEmail: $('#memEmail').val()
										},
									success:result=>{
										console.log(result);
										if(result === 'Y'){
											$('#duplicate').removeAttr("disabled");
											checkResult.show().css("color","green").text("사용가능한 이메일입니다.");
										}
										else{
											checkResult.show().css("color","red").text("사용할 수 없는 이메일입니다.");
										}
									},
									error:()=>{
										console.log('실패');
									}
								});
							}
							else{
								checkResult.show().css("color","red").text("올바르지 못한 이메일 형식입니다.");
							}
						})
					})
						
					</script>
					
					<script>
						function mail(){
							$.ajax({
								url: 'mail-check',
								data: {
									memEmail: $('#memEmail').val()
									},
								success:result=>{
									console.log(result);
									$('#sendMailCheck').val(result);
								},
								error:()=>{
									console.log('실패');
								}
							});
						}
					</script>
					
					<div class="enroll-input">
						<input type="hidden" name="sendMailCheck" id="sendMailCheck" value="" />
						<input type="text" name="memEmailCheck" id="memEmailCheck" placeholder="&nbsp;&nbsp;인증번호" />
						<button onclick="checkMail();">확인</button>
						<div class="check2"></div>
					</div>
				</div>
				
				<script>
					function checkMail(){
						 var sendMailCheck = $('#sendMailCheck').val();
						 var memEmailCheck = $('#memEmailCheck').val();
						 var memberId = $('#memEmail').val();
						 
						 if(sendMailCheck === memEmailCheck){
							$(".check2").text("인증번호가 일치합니다.");
							$(".check2").css("color","green");
							$("#memEmail").attr("disabled",true);
							$("#memEmailCheck").attr("disabled",true);
							$("#memberId").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디 : " + memberId);
						 }
						 else{
							$(".check2").text("인증번호가 일치하지 않습니다. 다시 확인해주시기 바랍니다.");
							$(".check2").css("color","red");
							$("#memEmail").val("");
							$("#memEmailCheck").val("");
						 }
					}
				</script>

				<div class="template2">
					<p>③ 회원가입을 위해 정보를 입력하세요.</p>
					<div class="enroll-ID">
						<div id="memberId">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디 : </div>
					</div>
					<div class="enroll-input others">
						<input type="password" name="memPwd" id="memPwd" placeholder="&nbsp;&nbsp;비밀번호" />
					</div>
					<div class="enroll-input others">
						<input type="password" name="memPwdCheck" id="memPwdCheck" placeholder="&nbsp;&nbsp;비밀번호 확인" />
					</div>
					<div class="enroll-input others">
						<input type="text" name="memName" id="memName" placeholder="&nbsp;&nbsp;이름" minlength="2"/>
					</div>
					<div class="check3"></div>
				</div>
				
				<script>
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
				</script>
				<br>
				<p class="check4"></p>
				<button onclick="enrollMember();" id="enrollMember" disabled>회원 가입</button>
				
				<script>
					$('input').keyup(()=>{
						var hiddenPhone = $('#certification').val();

						var email = $('#memEmail').val();
						var hiddenEmail = $('#sendMailCheck').val();

						var pwd = $('#memPwd').val();
						var memPwdCheck = $('#memPwdCheck').val();

						var name = $('#memName').val();
						console.log(hiddenPhone +"/"+ hiddenEmail+"/"+ pwd+"/"+ memPwdCheck+"/"+ name);
						
						if(hiddenPhone && hiddenEmail && pwd && memPwdCheck && name){
							$('#enrollMember').attr("disabled", false);
							$(".check4").text("");
						}
						else{
							$(".check4").text("모든 항목을 입력해주시기 바랍니다.");
							$(".check4").css("color","red");
						}
					})
				</script>
				
				<script>	
					function enrollMember(){
						$.ajax({
							url: 'enrollMember',
							data: {
								memPhone: $('#memPhone').val(),
								memEmail: $('#memEmail').val(),
								memPwd: $('#memPwd').val(),
								memName: $('#memName').val()
								},
							success:result=>{
								if(result === "success"){
									location.href = "/genesis/member-login";
								}
								else{
									alert("회원가입에 실패하셨습니다. 다시 시도해주시기 바랍니다.");
									location.href = "/genesis/member-enroll";
								}
							},
							error:()=>{
								console.log('실패');
							}
						});
					}
				</script>
			</div>
		
		</div>
		</div>

	<jsp:include page="../common/footer2.jsp" />
</body>
</html>