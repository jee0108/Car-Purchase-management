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

</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="wrap">
		
		<div style="margin: auto; padding-left: 350px; padding-top: 70px;">
			<div class="">
					<h1>선택 차량 : ${car.carName}</h1>
					<input type="hidden" name="carName" value="${car.carName}">
			</div>
			<br><br>

			<div class="radio-list">
				<div class="radio-result">
					<input type="hidden" name="carPrice" value="${car.carPrice}">
					<input type="hidden" id="hiddenInvenCode" value="${car.invenCode}">

					<div>
						<label class="labelfont">엔진타입 선택</label> <br>
						<div id="engine"></div>
						<p class="engine"> + 0원</p>
					</div>

					<br><br>
					<div>
						<label>구동타입 선택</label> <br>
						<div id="drive"></div>
						<p class="drive"> + 0원</p>
					</div>

					<br><br>
					<div>
						<label>외장컬러 선택</label> <br>
						<div id="color"></div>
						<p class="color"> + 0원</p>
					</div>

					<br><br>
					<div>
						<label>휠&타이어 선택</label> <br>
						<div id="wheel"></div>
						<p class="wheel"> + 0원</p>
					</div>

					<br><br>
					<div>
						<label>내장디자인&컬러 선택</label> <br>
						<div id="inner"></div>
						<p class="inner"> + 0원</p>
					</div>

					<br><br>
					<div>
						<label>옵션 선택</label> <br>
						<div id="option"></div>
						<p class="option"></p>
					</div>

					<br><br><br>
					<div>
						<button onclick="result();" class="btn-end">견적조회</button>
					</div>
				
				<script>
					$('#engine').on('change', 'input[type="radio"]', function() {
    					var engineOption = $(this).val();

						$.ajax({
								url: 'checkEnginePay',
								data: {
									engine: engineOption
								},
								success:result=>{
									var checkEnginePay = result.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
									$('.engine').html('+ '+checkEnginePay+'원');
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
									var checkDrivePay = result.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
									$('.drive').html('+ '+checkDrivePay+'원');
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
									console.log(result);
									var checkColorPay = result.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
									console.log(checkColorPay);
									$('.color').html('+ '+checkColorPay+'원');
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
									var checkWheelPay = result.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
									$('.wheel').html('+ '+checkWheelPay+'원');
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
									var checkInnerPay = result.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
									$('.inner').html('+ '+checkInnerPay+'원');
								},
								error:()=>{
									console.log('실패');
								}
						});
					
					});


				</script>

				<script>
					function result(){

					}
				</script>
			</div>
		</div>
		
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

				function createRadioButtons(container, array, name, inventoryDataArray) {
            		array.forEach(item => {
					const radioInput = document.createElement("input");
					radioInput.type = "radio";
					radioInput.name = name;
					radioInput.value = item;

					const label = document.createElement("label");
					const correspondingData = inventoryDataArray.find(data => data.invenCode === item);
        
					label.textContent = correspondingData ? correspondingData.invenName + '     ' : item + '     ';

					container.append(radioInput, label);
					});
        		}
				createRadioButtons($('#engine'), filteredEngine, 'engine', inventoryDataArray);
				createRadioButtons($('#drive'), filteredDrive, 'drive', inventoryDataArray);
				createRadioButtons($('#color'), filteredColor, 'color', inventoryDataArray);
				createRadioButtons($('#wheel'), filteredWheel, 'wheel', inventoryDataArray);
				createRadioButtons($('#inner'), filteredInner, 'inner', inventoryDataArray);

				$('#engine input:first').prop('checked', true);
				$('#drive input:first').prop('checked', true);
				$('#color input:first').prop('checked', true);
				$('#wheel input:first').prop('checked', true);
				$('#inner input:first').prop('checked', true);

				const inventoryPayString = '${pay}';
				

				function createCheckboxes(container, array, name, inventoryDataArray) {
					array.forEach(item => {
						const checkboxInput = document.createElement("input");
						checkboxInput.type = "checkbox";
						checkboxInput.name = name;
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
				createCheckboxes($('#option'), filteredOption, 'option', inventoryDataArray);



			</script>

			
		</div>

	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>