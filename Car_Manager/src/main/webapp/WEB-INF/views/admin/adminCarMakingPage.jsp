<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드바이저 페이지</title>
<!-- css-->
<link rel="stylesheet" href="resources/css/adminDealer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

    <jsp:include page="../common/adminHeader.jsp" />

    <div>
        <div class="wrap">

            <div class="content" style="border: 1px solid rgba(222, 222, 222, 0.913)">
                <div class="contentWrap" style="border: 1px solid rgba(222, 222, 222, 0.913)">
                    
                    <h4 style="font-weight: bold; text-align: center;">견적서 작성</h4>
                    <br><br>

                    <div id="estimateList">

						<div class="left">
							<label>담당 : ${loginUser.memName}</label><br><br>
							<input type="hidden" name="mycarDealer" value="${loginUser.memPhone}">

							<label>회원명 : </label>
							<input type="text" name="memName" id="searchMember">
							<button type="button" class="btn btn-sm btn-primary" onclick="searchMember();">검색</button>
							<div id="searchMemResult" style="height: 15px;"></div>
							<br>
							<div>
								<select id="member" name="memPhone" style="width: 290px; height: 25px; text-align: center;">
									<option value="mycarPhone">성명 / 전화번호</option>
								</select>
							</div>

							<br><br><br>

							<label>차량 선택 : </label>
							<select id="selectCarName" name="carName"  style="width: 150px; height: 25px; text-align: center;">
									<option id="carNameOption">차를 선택해주세요</option>
								<c:forEach items="${list}" var="c">
									<option class="carName">${c.carName}</option>
								</c:forEach>
							</select>
							<br><br>
									<img class="carImg" 
									src="data:image/png;base64,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"
									alt="초기화면" width="400" height="200"> 
							<br><br><br>

							<label>기본 가격 : </label>
							<span id="standardCarPrice"> 0 원</span>
							<br>

							<label>추가 가격 : </label>
							<span id="plusPay"> + 0 원</span>
							<br><br>

							<label>총 가격 : </label>
							<span id="totalPay"> 0 원</span>
						</div>

						<div class="right">
							<input type="hidden" id="hiddenInvenCode" value="">
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
								<p class="optionPay"> + 0원</p>
							</div>
	
							<div>
								<button type="button" class="btn btn-sm btn-warning" style="float: inline-end;">견적서 발송</button>
							</div>
						</div>

                    </div>

                </div>
                
            </div>

        <div>

	<!-- 회원검색 -->
	<script>
		function searchMember() {

			$.ajax({
				url: 'searchMember',
				data: { 
					memName: $('#searchMember').val()
				},
				success: result=> {

					var value='';

					if(result.length === 0){
						$('#searchMemResult').html('검색결과가 없습니다. 회원가입을 진행해주세요');
						$('#searchMemResult').css('color', 'red');
					}else{
						$('#searchMemResult').html('검색결과 <b>'+result.length+'</b> 건이 조회되었습니다.');
						$('#searchMemResult').css('color', 'green');
					}

					for(let i in result){
							value += '<option value="mycarPhone">'
								+ result[i].memName + ' / ' + result[i].memPhone
								+'</option>'
					}
					$('#member').html(value);
					
				},
				error: ()=>{
					console.log('실패');
				}
			});
		}
	</script> <!-- 회원 검색 끝 -->
	
	<!-- 차 선택 -->
	<script>
		$(document).on('change', '#selectCarName', function() {
			var selectedCar = $(this).val();
			sendAjaxRequest(selectedCar);
		});

		function sendAjaxRequest(selectedCar) {

			$.ajax({
				url: 'selectCar',
				data: { carName: selectedCar },
				success: result=> {
					var standardCarPrice = result.carPrice;
					$('#standardCarPrice').html(standardCarPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'원');
					$('#carNameOption').prop('disabled', true);
					$('.carImg').attr('src', result.uploadName);
					
					console.log(result.carPrice);
				},
				error: ()=>{
					console.log('실패');
				}
			});

			$.ajax({
				url: 'selectCarOption',
				data: { carName: selectedCar },
				success: result=> {

					$('#hiddenInvenCode').val(result.invenCode);
					performNextSteps();

				},
				error: ()=>{
					console.log('실패');
				}
			});
		}
	</script> <!-- 차 선택 끝 -->

	<!-- 차종별 옵션버튼 뿌려주기 -->
	<script>
		function performNextSteps() {
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

				const label = document.createElement("span");
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

					const label = document.createElement("span");
					const correspondingData = inventoryDataArray.find(data => data.invenCode === item);

					label.textContent = correspondingData ? correspondingData.invenName + '     ' : item + '     ';

					container.append(checkboxInput, label);
				});
			}
			createCheckboxes($('#option'), filteredOption, 'checkBoxGroup', inventoryDataArray);

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
						$('.wheel').html('+ '+checkWheelPay+'원');
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
			var checkBoxOption = $(this).val();

			$.ajax({
					url: 'checkOptionPay',
					data: {
						option: checkBoxOption
					},
					success:result=>{
						var checkOptionPay = formatNumber(result);

						$('.optionPay').html('+ '+checkOptionPay+'원');
						updateTotalPrice();
					},
					error:()=>{
						console.log('실패');
					}
			});
		});

		function updateTotalPrice() {
			var enginePay = getNumericValue($('.engine').text());
			var drivePay = getNumericValue($('.drive').text());
			var colorPay = getNumericValue($('.color').text());
			var wheelPay = getNumericValue($('.wheel').text());
			var innerPay = getNumericValue($('.inner').text());

			var carPay = getNumericValue($('#standardCarPrice').text());

			var optionPay = 0;

			$('#option input[type="checkbox"]:checked').each(function() {
				var optionCode = $(this).val();
				var correspondingData = inventoryDataArray.find(data => data.invenCode === optionCode);

				if (correspondingData) {
					optionPay += correspondingData.invenPlusPay;
				}
			});

			var totalPay = carPay + enginePay + drivePay + colorPay + wheelPay + innerPay + optionPay;
			var plusPay = enginePay + drivePay + colorPay + wheelPay + innerPay + optionPay;

			$('.optionPay').text('+ '+ formatNumber(optionPay) + '원');

			$('#totalPay').text(formatNumber(totalPay) + '원');
			$('#totalPrice').val(totalPay);

			$('#plusPay').text('+ '+ formatNumber(plusPay) + '원');
		}

		updateTotalPrice();

		}
	</script>

    </div>

</body>
</html>