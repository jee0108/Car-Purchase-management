<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자등록</title>
<!-- css-->
<link rel="stylesheet" href="resources/css/enrollAdmin.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</head>
<body>

	<jsp:include page="../common/adminHeader.jsp" />
	<div class="enroll-wrap">
		<div class="enroll-title">
			<h5>관리자 등록</h6>
		</div>

		<div class="text-align">
			
			<div>
					
				<div class="template">
					<p>▸정보입력</p>
					<div class="enroll-input others">
						<select id="memRole">
							<option name="memRole" value="R" class="option">웹관리자</option>
							<option name="memRole" value="D" class="option">관리자(딜러)</option>
						</select>
					</div>

					<div class="enroll-input others">
						<input type="text" name="memName" id="memName" placeholder="&nbsp;&nbsp;이름" minlength="2"/>
					</div>

					<div class="enroll-input others">
						<input type="tel" name="memPhone" id="memPhone" maxlength="11" placeholder="&nbsp;&nbsp;휴대폰번호( - 제외, 숫자만 입력)"
						 onKeyup="this.value=this.value.replace(/[^0-9]/g,'')";/>
					</div>

					<div class="enroll-input others">
						<input type="text" name="memEmail" id="memEmail" placeholder="&nbsp;&nbsp;이메일 주소" />
					</div>
					
					<script>
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
					</script>

					<div class="enroll-input others">
						<input type="password" name="memPwd" id="memPwd" placeholder="&nbsp;&nbsp;비밀번호" />
					</div>
					
				</div>
				
				<div class="check2"></div>
				<p class="check4"></p>
				<button onclick="enrollMember();" id="enrollMember" disabled>관리자 등록</button>
				
				<script>
					$('input').keyup(()=>{

						var email = $('#memEmail').val();

						var pwd = $('#memPwd').val();

						var name = $('#memName').val();
						console.log(email+"/"+ pwd+"/"+ name);
						
						if(email && pwd && pwd && name){
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
							url: 'enrollAdmin',
							data: {
								memPhone: $('#memPhone').val(),
								memEmail: $('#memEmail').val(),
								memPwd: $('#memPwd').val(),
								memName: $('#memName').val(),
								memRole: $('#memRole').val()
								},
							success:result=>{
								if(result === "success"){
									location.href = "/genesis/web-admin";
								}
								else{
									alert("관리자 등록에 실패하셨습니다. 다시 시도해주시기 바랍니다.");
									location.href = "/genesis/member-enroll";
								}
							},
							error:()=>{
								console.log('실패');
							}
						});
					}
				</script>
				<br>
			</div>
		
		</div>
	<br>
	<jsp:include page="../common/footer2.jsp" />
</body>
</html>