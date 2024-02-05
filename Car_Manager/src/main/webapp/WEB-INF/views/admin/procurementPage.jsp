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
		
		<p style="font-weight: bold; font-size: 18px; text-align: center; padding-top: 30px;">조달 신청 목록</p>

		<div class="contentWrap">

			<div class="content"  style="padding-top: 30px;">
				<table class="table table-hover table-size">
					<thead>
						<tr>
							<th>견적번호</th>
							<th>차대번호</th>
							<th>차량명</th>
							<th>차량가격</th>
							<th>구매자</th>
							<th>견적일</th>
							<th>상태</th>
							<th>상태변경일</th>
						</tr>
					</thead>

					<tbody>
							<c:forEach items="${carPart}" var="cp">
									<tr>
									<td class="mycarNum">${cp.mycarNum}</td>
									<td class="mycarNum">${cp.carNum}</td>
									<td class="carName">${cp.carName}</td>
									<td class="mycarPrice">${cp.mycarPrice}</td>
									<td class="mycarPhone">${cp.memName} / ${cp.mycarPhone}</td>
									<td class="mycarDate">${cp.mycarDate}</td>
									<td class="carStatus">${cp.carStatus}</td>
									<td class="carDate">${cp.carDate}</td>
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
						<li class="page-item"><a class="page-link" href="procurement?cPage=${pi.currentPage-1}">◄</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var ="p">
					<li class="page-item"><a class="page-link" href="procurement?cPage=${p}">${p}</a></li>
				</c:forEach>

				<c:choose>
					<c:when test="${pi.endPage eq pi.maxPage}">
						<li class="page-item disabled"><a class="page-link" href="#">►</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="procurement?cPage=${pi.currentPage+11}">►</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
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

		$('.mycarPhone').each(function () {
			var String = $(this).text();
			var splittedArray = String.split('/');

			var name = splittedArray[0].trim();
        	var phoneNumber = splittedArray[1].trim(); 

			var replacePhone = formatPhoneNumber(phoneNumber);
			$(this).html(name+' / '+replacePhone);

		});
	</script>
</body>
</html>