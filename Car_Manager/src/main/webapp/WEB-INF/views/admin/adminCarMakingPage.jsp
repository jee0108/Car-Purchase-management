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
							<input type="text" name="memName">
							<button type="button" class="btn btn-sm btn-primary">검색</button>
							<div>검색 결과입니다. / 검색 결과가 없습니다.</div>
							<br>
							<div>
								<select id="member" name="memPhone" style="width: 290px; height: 25px;">
									<option value="mycarPhone">이름 / 전화번호</option>
								</select>
							</div>

							<br><br><br>

							<label>차량 선택 : </label>
							<select id="selectCarName" name="carName"  style="width: 150px; height: 25px; text-align: center;">
								<c:forEach items="${list}" var="c">
									<option class="carName">${c.carName}</option>
								</c:forEach>
							</select>
							<br><br>
							<img class="carImg" src="${uploadName}" alt="${originalName}" width="400" height="200"> <br><br>

							<br>

							<label>기본 가격 : </label>
							<span id="standardCarPrice">70,000,000</span>
							<br>

							<label>추가 가격 : </label>
							<span id="plusCarPrice"> + 8,000,000</span>
							<br><br>

							<label>총 가격 : </label>
							<span id="totalPay"> 78,000,000</span>
						</div>

						<div class="right">
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
								<p class="optionPay"> + 0원</p>
							</div>
	
							<br>
							
							<br><br>
							<div>
								<button type="button" class="btn btn-sm btn-warning">견적서 발송</button>
							</div>
						</div>

                    </div>

                </div>
                
            </div>

        <div>
	<script>
		$(document).on('change', '#selectCarName', function() {
			var selectedOption = $(this).val();
			sendAjaxRequest(selectedOption);
		});

		function sendAjaxRequest(selectedOption) {

			$.ajax({
				url: 'selectCar',
				data: { carName: selectedOption },
				success: result=> {
					console.log(result);
				},
				error: ()=>{
					console.log('실패');
				}
			});
		}
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

			$('#optionPay').val(optionPay);

			$('#totalPay').text(formatNumber(totalPay) + '원');
			$('#totalPrice').val(totalPay);
		}

		updateTotalPrice();
	</script>

	<script>
		function result(){
			
			$.ajax({
					url: 'estimation',
					data: {
						wheel: wheelOption
					},
					success:result=>{
						var checkWheelPay = result.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						$('.wheel').html('+ '+checkWheelPay+'원');
					},
					error:()=>{
						console.log('실패');
					}
			});
		}
	</script>
	<script>
		var String = $('#hiddenInvenCode').val();
		const toArray = String.split(',');

		const inventoryDataString = '${inven}';
		const regex = /Inventory\(invenCode=([^,]+), invenName=([^,]+), itemCode=([^,]+), invenPlusPay=([^\)]+)\)/g;
		const inventoryDataArray = [];

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

		const inventoryPayString = '${pay}';
		
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

</body>
</html>