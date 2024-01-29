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
				</div>

				<br><br>
				<div>
					<label>구동타입 선택</label> <br>
					<div id="drive"></div>
				</div>

				<br><br>
				<div>
					<label>외장컬러 선택</label> <br>
					<div id="color"></div>
				</div>

				<br><br>
				<div>
					<label>휠&타이어 선택</label> <br>
					<div id="wheel"></div>
				</div>

				<br><br>
				<div>
					<label>내장디자인&컬러 선택</label> <br>
					<div id="inner"></div>
				</div>

				<br><br>
				<div>
					<label>옵션 선택</label> <br>
					<div id="option"></div>
				</div>

				<div>
					<button onclick="result();">견적조회</button>
				</div>
				
				<script>
					function result(){
						
					}
				</script>

			</div>

			<script>
				var String = $('#hiddenInvenCode').val();
				const toArray = String.split(',');

				const inventoryDataString = '${inven}';
				const regex = /Inventory\(invenCode=([^,]+), invenName=([^,]+), itemCode=([^)]+)\)/g;
				const inventoryDataArray = [];

				let match;
				while ((match = regex.exec(inventoryDataString)) !== null) {
					const [, invenCode, invenName, itemCode] = match;
					inventoryDataArray.push({ invenCode, invenName, itemCode });
				}

				console.log(inventoryDataArray);

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
        
					// Use invenName if found, otherwise, use the invenCode
					label.textContent = correspondingData ? correspondingData.invenName + '     ' : item + '     ';

					container.append(radioInput, label);
					});
        		}

				createRadioButtons($('#engine'), filteredEngine, 'engine', inventoryDataArray);
				createRadioButtons($('#drive'), filteredDrive, 'drive', inventoryDataArray);
				createRadioButtons($('#color'), filteredColor, 'color', inventoryDataArray);
				createRadioButtons($('#wheel'), filteredWheel, 'wheel', inventoryDataArray);
				createRadioButtons($('#inner'), filteredInner, 'inner', inventoryDataArray);
				createRadioButtons($('#option'), filteredOption, 'option', inventoryDataArray);

				$('#engine input:first').prop('checked', true);
				$('#drive input:first').prop('checked', true);
				$('#color input:first').prop('checked', true);
				$('#wheel input:first').prop('checked', true);
				$('#inner input:first').prop('checked', true);
				$('#option input:first').prop('checked', true);
			</script>

			
		</div>

	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>