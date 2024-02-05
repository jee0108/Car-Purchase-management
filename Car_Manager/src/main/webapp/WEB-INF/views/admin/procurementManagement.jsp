<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목관리</title>
<!-- css-->
<link rel="stylesheet" href="resources/css/procurement.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>

	<jsp:include page="../common/adminHeader.jsp" />
	
	<div class="main-wrap">
		
		<p style="font-weight: bold; font-size: 18px; text-align: center; padding-top: 30px;">조달 관리 목록</p>

		<div class="contentWrap">

			<div class="content"  style="padding-top: 30px;" id="procurementManagement">
				<table class="table table-hover table-size">
					<input type="hidden" value="${inven}" id="hiddenInvenList">
					<thead>
						<tr>
							<th>견적번호</th>
							<th>차대번호</th>
							<th>차량명</th>
							<th>차량가격</th>
							<th>담당 어드바이저</th>
							<th>견적일</th>
							<th>상태</th>
							<th>상태변경일</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${carPart}" var="cp">
							<c:if test="${cp.carStatus eq 'R'}">
								<tr data-toggle="modal" href="#resultModal">
							</c:if>
									<td class="mycarNum">${cp.mycarNum}</td>
									<td class="carNum">${cp.carNum}</td>
									<td class="carName">${cp.carName}</td>
									<td class="mycarPrice">${cp.mycarPrice}</td>
									<td class="mycarDealer">${cp.memName} / ${cp.mycarDealer}</td>
									<td class="mycarDate">${cp.mycarDate}</td>
									<td class="carStatus">${cp.carStatus}</td>
									<td class="carDate">${cp.carDate}</td>
									<td style="display: none;" class="invenCode">${cp.invenCode}</td>
									<input type="hidden" value="${cp.carStatus}" class="carStatus">
								</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>

		<div id="pageInfo" style="margin: auto; text-align: center; width: 90vw;">
			<ul class="pagination" style="display: flex; justify-content: center;">
				<c:choose>
					<c:when test="${pi.currentPage eq 1 }">
						<li class="page-item disabled"><a class="page-link" href="#">◄</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="procurement-Management?cPage=${pi.currentPage-1}">◄</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var ="p">
					<li class="page-item"><a class="page-link" href="procurement-Management?cPage=${p}">${p}</a></li>
				</c:forEach>

				<c:choose>
					<c:when test="${pi.endPage eq pi.maxPage}">
						<li class="page-item disabled"><a class="page-link" href="#">►</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="procurement-Management?cPage=${pi.currentPage+11}">►</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		
	</div>

	 <!-- Modal -->
	 <div id="resultModal" class="modal modal-center fade" role="dialog">
		<div class="modal-dialog">
	
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">상태변경</h4>
				</div>
				<div class="modal-body" style="font-size: 15px;">
					<p style="font-weight: bold;">사용 예정 부품</p>
					<div id="resultEnItems"></div>
					<div id="resultWdItems"></div>
					<div id="resultCrItems"></div>
					<div id="resultWhItems"></div>
					<div id="resultIdItems"></div>
					<div id="resultOpItems"></div>
					<input type="hidden" name="engineGroup" id="engineGroup">
					<input type="hidden" name="driveGroup" id="driveGroup">
					<input type="hidden" name="colorGroup" id="colorGroup">
					<input type="hidden" name="wheelGroup" id="wheelGroup">
					<input type="hidden" name="innerGroup" id="innerGroup">
					<input type="hidden" name="checkBoxGroup" id="checkBoxGroup">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-warning" onclick="delivery();">납품하기</button>
				</div>

			</div>

	</div>

	<script>
		$('.carStatus').each(function () {
			var carStatus = $(this).text();
			
			if(carStatus === 'R'){
				$(this).html('계약서 확인중');
			}
			if (carStatus === 'A'){
				$(this).html('조립중');
			}
			if (carStatus === 'Y'){
				$(this).html('배송중');
			}
			if (carStatus === 'S'){
				$(this).html('인수완료');
				$(this).css('color', 'green');
			}
			if (carStatus === 'N'){
				$(this).html('인수거부');
				$(this).css('color', 'red');
			}
		})
	</script>

	<!-- 금액변환/전화번호 변환 -->
	<script>
		function getNumericValue(str) {
			return parseInt(str.replace(/[^0-9]/g, ''));
		}
		function formatNumber(number) {
			return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}

		function formatPhoneNumber(phoneNumber) {
			const cleaned = ('' + phoneNumber).replace(/\D/g, '');
			const match = cleaned.match(/^(\d{3})(\d{4})(\d{4})$/);
			if (match) {
				const formattedNumber = match[1] + '-' + match[2] + '-' + match[3];
				return formattedNumber;
			}
			return phoneNumber;
		}

	</script>
	
	<script>
		$('.mycarPrice').each(function () {
			var exprice = $(this).text();
			var replacePay = exprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$(this).html(replacePay + '원');
		});

		$('.mycarDealer').each(function () {
			var String = $(this).text();
			var splittedArray = String.split('/');

			var name = splittedArray[0].trim();
        	var phoneNumber = splittedArray[1].trim(); 

			var replacePhone = formatPhoneNumber(phoneNumber);
			$(this).html(name+' / '+replacePhone);

		});
	</script>
	
	<!-- 부품 이름 변경 /모달내부 -->
	<script>
		$('#procurementManagement>table>tbody>tr').click(function () {

			const inventoryDataString = '${inven}';
			const regex = /Inventory\(invenCode=([^,]+), invenName=([^,]+), itemCode=([^,]+), invenPlusPay=([^\)]+)\)/g;
			const inventoryDataArray = [];
	
			let match;
			while ((match = regex.exec(inventoryDataString)) !== null) {
				const invenCode = match[1];
				const invenName = match[2];
				inventoryDataArray.push({ invenCode, invenName });
			}

			function getInventoryName(codeArray) {
				return codeArray.map(code => {
					const inventoryItem = inventoryDataArray.find(item => item.invenCode === code);
					return inventoryItem ? inventoryItem.invenName : code;
				});
			}	

			var invenCode = $(this).children('.invenCode').text();
			var invenCodeArray = invenCode.split(',');

			var enItems = invenCodeArray.filter(item => item.includes('EN'));
			var wdItems = invenCodeArray.filter(item => item.includes('WD'));
			var crItems = invenCodeArray.filter(item => item.includes('CR'));
			var whItems = invenCodeArray.filter(item => item.includes('WH'));
			var idItems = invenCodeArray.filter(item => item.includes('ID'));
			var opItems = invenCodeArray.filter(item => item.includes('OP'));

			var enType = getInventoryName(enItems);
			var wdType = getInventoryName(wdItems);
			var crColor = getInventoryName(crItems);
			var whType = getInventoryName(whItems);
			var idDesignColor = getInventoryName(idItems);
			var opOptions = getInventoryName(opItems);

			$('#resultEnItems').html('엔진타입 : ' + enType + ' [ '+enItems+' ] ');
			$('#resultWdItems').html(' 구동타입 : ' + wdType+ ' [ '+wdItems+' ] ');
			$('#resultCrItems').html(' 외장컬러 : ' + crColor+ ' [ '+crItems+' ] ');
			$('#resultWhItems').html('휠&타이어 : ' + whType+ ' [ '+whItems+' ] ');
			$('#resultIdItems').html('내장디자인&컬러 : ' + idDesignColor+ ' [ '+idItems+' ] ');
			$('#resultOpItems').html('추가 옵션 : ' + opOptions.join(', ')+ ' [ '+opItems+' ] ');

			$('#engineGroup').val(enItems);
			$('#driveGroup').val(wdItems);
			$('#colorGroup').val(crItems);
			$('#wheelGroup').val(whItems);
			$('#innerGroup').val(idItems);
			$('#checkBoxGroup').val(opItems);

		});
	</script><!-- 부품 이름 변경 /모달내부 끝 -->

	<script>
		function delivery(){
			$.ajax({
				url: 'delivery',
				data: {
					engineGroup: $('#engineGroup').val(),
					driveGroup: $('#driveGroup').val(),
					colorGroup: $('#colorGroup').val(),
					wheelGroup: $('#wheelGroup').val(),
					innerGroup: $('#innerGroup').val(),
					checkBoxGroup: $('#checkBoxGroup').val()
				},
				success:result=>{
					console.log(result);
				},
				error:()=>{
					console.log('실패');
				}
			});
		}
	</script>
</body>
</html>