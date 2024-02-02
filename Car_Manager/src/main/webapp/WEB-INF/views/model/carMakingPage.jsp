<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모델</title>
<!-- css-->
<link rel="stylesheet" href="resources/css/making.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="wrap" style="background-color: rgb(33, 33, 33); height: 92vh;">
		<form action="wantCar" method="post">
			<div style="margin: auto; padding-left: 350px; padding-top: 40px;">
				<div class="">
					<h3>선택 차량 : ${car.carName}</h3>
					<input type="hidden" name="carName" value="${car.carName}">
				</div>
				<br><br>

				<div class="radio-list">
					<div class="radio-result">
						<input type="hidden" id="selectCarPrice" name="carPrice" value="${car.carPrice}">
						<input type="hidden" id="hiddenInvenCode" value="${car.invenCode}">
						<input type="hidden" name="exPrice" id="totalPrice" value="">

						<div>
							<label class="labelfont">엔진타입 선택</label> <br>
							<div id="engine"></div>
							<p class="engine"> + 0원</p>
						</div>

						<br>
						<div>
							<label class="labelfont">구동타입 선택</label> <br>
							<div id="drive"></div>
							<p class="drive"> + 0원</p>
						</div>

						<br>
						<div>
							<label class="labelfont">외장컬러 선택</label> <br>
							<div id="color"></div>
							<p class="color"> + 0원</p>
						</div>

						<br>
						<div>
							<label class="labelfont">휠&타이어 선택</label> <br>
							<div id="wheel"></div>
							<p class="wheel"> + 0원</p>
						</div>

						<br>
						<div>
							<label class="labelfont">내장디자인&컬러 선택</label> <br>
							<div id="inner"></div>
							<p class="inner"> + 0원</p>
						</div>

						<br>
						<div>
							<label class="labelfont">옵션 선택</label> <br>
							<div id="option"></div>
						</div>

						<br>
						
						<div id="totalPay">
						</div>

						<br><br>
						<div>
							<button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#buyCar">구매상담신청</button>
						</div>

						<!-- Modal -->
						<div id="buyCar" class="modal fade" role="dialog">
							<div class="modal-dialog"  style="display: block;">
						
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title" style="color: black;">구매상담신청</h4>
									</div>

									<div class="modal-body" style="color: black;">
										<c:choose>
											<c:when test="${empty loginUser}">
												<p>① 휴대폰 인증을 위해 정보를 입력하세요.</p>
												<div>
													<input type="tel" name="memberPhone" id="memPhone" maxlength="11" placeholder="&nbsp;&nbsp;휴대폰번호( - 제외, 숫자만 입력)"
													onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"; style="color: black; padding-left: 3px; width: 250px;"/>
													<button type="button" id="phoneCheckBtn" onclick="phoneCheck();" disabled style="color: black; width: 50px;">인증</button>
												</div>
												
												<div>
													<input type="hidden" name="certification" id="certification" value=""/>
													<input type="text" name="memPhoneCheck" id="memPhoneCheck" placeholder="&nbsp;&nbsp;인증번호" 
													style="color: black; padding-left: 3px; width: 250px;"/>
													<button type="button" onclick="checkNumber();" style="color: black; width: 50px;" id="numberIsOk">확인</button>
													<div id="numberCheck"></div>
												</div>
												<br>
												<div>
													<p style="color: black;">②어드바이저를 선택하세요.</p>
													<select class="dealer" name="dealerPhone" style="color: black;"></select>
												</div>
											</c:when>
											<c:otherwise>
												<p>① ${loginUser.memName}님 정보를 확인하세요.</p>
												<input type="tel" name="memberPhone" value="${loginUser.memPhone}" readonly>

												<br><br>
												<div>
													<p style="color: black;">②어드바이저를 선택하세요.</p>
													<select class="dealer" name="dealerPhone" style="color: black;"></select>
												</div>
											</c:otherwise>
										</c:choose>
									</div>

									<br>
									<div class="modal-footer">
										<button type="submit" class="btn btn-sm btn-primary">신청하기</button>
									</div>
								</div>
								
							</div>
						


						<script>
							$(()=>{
								$.ajax({
									url: 'check-dealer',
									success:result=>{
										var value='';
										for(let i in result){
											value += '<option value="'+result[i].dealerPhone+'" class="dealerPhone">'+result[i].memName+' ('+result[i].dealerPhone +' / '+result[i].memEmail+')</option>'
										}
										$('.dealer').html(value);
									},
									error:()=>{
										console.log('실패');
									}
								});

							});
						</script>
						<script>
							$('#memPhone').keyup(()=>{
								var checkLength = ($('#memPhone').val()).length;
								var checkResult = $("#phoneCheck");
								if(checkLength<10){
									$('#phoneCheckBtn').attr("disabled",true);
								}else{
									$('#phoneCheckBtn').attr("disabled",false);
								}
							});
						</script>

						<script>
							function phoneCheck(){
								$.ajax({
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

						<script>
							function checkNumber(){
								var certification = $('#certification').val();
								var userNumber = $('#memPhoneCheck').val();

								if(certification === userNumber){
									$("#numberCheck").text("인증번호가 일치합니다.");
									$("#numberCheck").css("color","green");
									$("#numberIsOk").attr("disabled",true);
									$("#phoneCheckBtn").attr("disabled",true);							
								}
								else{
									$("#numberCheck").text("인증번호가 일치하지 않습니다. 다시 확인해주시기 바랍니다.");
									$("#numberCheck").css("color","red");
									$("#memPhone").val("");
									$("#memPhoneCheck").val("");
								}
							}
						</script>


					</div>

					<script>
						$(document).ready(function(){
						  $("#myBtn").click(function(){
							$("#myModal").modal();
						  });
						});
					</script>

				<script>
					function getNumericValue(str) {
						return parseInt(str.replace(/[^0-9]/g, ''));
					}

					function formatNumber(number) {
						return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					}

					$('#engine').on('change', 'input[type="radio"]', function() {
    					var engineOption = $(this).val();

						$.ajax({
								url: 'checkEnginePay',
								data: {
									engine: engineOption
								},
								success:result=>{
									var checkEnginePay = formatNumber(result);
									$('.engine').html('+ '+checkEnginePay+'원');
									updateTotalPrice();
								},
								error:()=>{
									console.log('실패');
								}
						});
					
					});

					$('#drive').on('change', 'input[type="radio"]', function() {
    					var driveOption = $(this).val();
						$.ajax({
								url: 'checkDrivePay',
								data: {
									drive: driveOption
								},
								success:result=>{
									var checkDrivePay = formatNumber(result);
									$('.drive').html('+ '+checkDrivePay+'원');
									updateTotalPrice();
								},
								error:()=>{
									console.log('실패');
								}
						});
					
					});

					$('#color').on('change', 'input[type="radio"]', function() {
    					var colorOption = $(this).val();
						$.ajax({
								url: 'checkColorPay',
								data: {
									color: colorOption
								},
								success:result=>{
									var checkColorPay = formatNumber(result);
									$('.color').html('+ '+checkColorPay+'원');
									updateTotalPrice();
								},
								error:()=>{
									console.log('실패');
								}
						});
					
					});

					$('#wheel').on('change', 'input[type="radio"]', function() {
    					var wheelOption = $(this).val();

						$.ajax({
								url: 'checkWheelPay',
								data: {
									wheel: wheelOption
								},
								success:result=>{
									var checkWheelPay = formatNumber(result);
									
									if ($('#wheel input:first').prop('checked')) {
										$('.wheel').html('+ 0원');
									}
									else{
										$('.wheel').html('+ '+checkWheelPay+'원');
									}
									updateTotalPrice();
								},
								error:()=>{
									console.log('실패');
								}
						});
					
					});

					$('#inner').on('change', 'input[type="radio"]', function() {
    					var innerOption = $(this).val();

						$.ajax({
								url: 'checkInnerPay',
								data: {
									inner: innerOption
								},
								success:result=>{
									var checkInnerPay = formatNumber(result);
									$('.inner').html('+ '+checkInnerPay+'원');
									updateTotalPrice();
								},
								error:()=>{
									console.log('실패');
								}
						});
					
					});

					$('#option').on('change', 'input[type="checkbox"]', function() {
						updateTotalPrice();
					});				

					function updateTotalPrice() {
						var enginePay = getNumericValue($('.engine').text());
						var drivePay = getNumericValue($('.drive').text());
						var colorPay = getNumericValue($('.color').text());
						var wheelPay = getNumericValue($('.wheel').text());
						var innerPay = getNumericValue($('.inner').text());
						var carPay = getNumericValue($('input[name="carPrice"]').val());

						var optionPay = 0;
						$('#option input[type="checkbox"]:checked').each(function() {
							var optionCode = $(this).val();
							var correspondingData = inventoryDataArray.find(data => data.invenCode === optionCode);
							if (correspondingData) {
								optionPay += correspondingData.invenPlusPay;
							}
						});

						var totalPay = carPay + enginePay + drivePay + colorPay + wheelPay + innerPay + optionPay;

						$('#totalPay').text('예상 가격: ' + formatNumber(totalPay) + '원');
						$('#totalPrice').val(totalPay);
					}

					updateTotalPrice();
				</script>

			</div>

		</form>

		</div>
		
			<script>
				const inventoryDataArray = [];

				var String = $('#hiddenInvenCode').val();
				const toArray = String.split(',');

				const inventoryDataString = '${inven}';
				const regex = /Inventory\(invenCode=([^,]+), invenName=([^,]+), itemCode=([^,]+), invenPlusPay=([^\)]+)\)/g;

				let match;
				while ((match = regex.exec(inventoryDataString)) !== null) {
					const [, invenCode, invenName, itemCode, invenPlusPay] = match;
					inventoryDataArray.push({ invenCode, invenName, itemCode, invenPlusPay: parseInt(invenPlusPay) });
				}

				const engine = "EN";
				const drive = "WD";
				const color = 'CR';
				const wheel = 'WH';
				const inner = 'ID';
				const option = 'OP';

				const filteredEngine = toArray.filter(item => item.includes(engine));
				const filteredDrive = toArray.filter(item => item.includes(drive));
				const filteredColor = toArray.filter(item => item.includes(color));
				const filteredWheel = toArray.filter(item => item.includes(wheel));
				const filteredInner = toArray.filter(item => item.includes(inner));
				const filteredOption = toArray.filter(item => item.includes(option));

				function createRadioButtons(container, array, groupName, inventoryDataArray) {
            		array.forEach(item => {
					const radioInput = document.createElement("input");
					radioInput.type = "radio";
					radioInput.name = groupName;
					radioInput.value = item;

					const label = document.createElement("label");
					const correspondingData = inventoryDataArray.find(data => data.invenCode === item);
        
					label.textContent = correspondingData ? correspondingData.invenName + '     ' : item + '     ';

					container.append(radioInput, label);
					});
        		}
				createRadioButtons($('#engine'), filteredEngine, 'engineGroup', inventoryDataArray);
				createRadioButtons($('#drive'), filteredDrive, 'driveGroup', inventoryDataArray);
				createRadioButtons($('#color'), filteredColor, 'colorGroup', inventoryDataArray);
				createRadioButtons($('#wheel'), filteredWheel, 'wheelGroup', inventoryDataArray);
				createRadioButtons($('#inner'), filteredInner, 'innerGroup', inventoryDataArray);

				$('#engine input:first').prop('checked', true);
				$('#drive input:first').prop('checked', true);
				$('#color input:first').prop('checked', true);
				$('#wheel input:first').prop('checked', true);
				$('#inner input:first').prop('checked', true);

				function createCheckboxes(container, array, groupName, inventoryDataArray) {
					array.forEach(item => {
						const checkboxInput = document.createElement("input");
						checkboxInput.type = "checkbox";
						checkboxInput.name = groupName;
						checkboxInput.value = item;

						const label = document.createElement("label");
						const correspondingData = inventoryDataArray.find(data => data.invenCode === item);

						label.textContent = correspondingData ? correspondingData.invenName + '     ' : item + '     ';

						const priceParagraph = document.createElement("span");
						var replacePay = correspondingData.invenPlusPay;
						var checkboxPay = replacePay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						priceParagraph.textContent = correspondingData ? '+'+ checkboxPay+'원 ' : "+ 0원 ";
						container.append(checkboxInput, label, priceParagraph);
					});
				}
				createCheckboxes($('#option'), filteredOption, 'checkBoxGroup', inventoryDataArray);
			</script>
			
		</div>

	</div>

</body>
</html>