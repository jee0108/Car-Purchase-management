<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자모드</title>
<!-- css-->
<link rel="stylesheet" href="resources/css/admin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
</head>
<body>
	<jsp:include page="../common/adminHeader.jsp" />

	<div class="main-wrap">
		<div class="admin-title">
			<p>관리자 페이지</p>
		</div>
		<br><br>

		<c:if test="${loginUser.memRole eq 'R'}">
			<div class="content">
			
				<div class="main-top">
					
					<div class="top float">
						<p>비품 관리</p>
						<br>
						<div>
							<table class="table table-hover table-size">
								<thead>
									<tr>
										<th>일자</th>
										<th>품번</th>
										<th>품명</th>
										<th>재고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2024-01-10</td>
										<td>a-1015</td>
										<td>어쩌고</td>
										<td>5</td>
									</tr>

									<tr>
										<td>2023-12-31</td>
										<td>b-5815</td>
										<td>저쩌고</td>
										<td>3</td>
									</tr>

									<tr>
										<td>2023-12-30</td>
										<td>x-7894</td>
										<td>웅앵웅</td>
										<td>3</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div class="top">
						<p>품목 관리</p>
						<br>
						<div>
							품목 통계 그래프 자리
						</div>
					</div>

				</div>

				<br><br>
				<div class="main-bottom">
					<p>조달 관리</p>
					<br>
					<div>
						<table class="table table-hover table-size">
							<thead>
								<tr>
									<th>일자</th>
									<th>차대번호</th>
									<th>금액</th>
									<th>출고</th>
									<th>검수</th>
									<th>담당 관리자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2023-12-12</td>
									<td>ajskf1521a</td>
									<td>100,000,000</td>
									<td>조립중</td>
									<td>x</td>
									<td>20230109</td>
								</tr>

								<tr>
									<td>2023-12-30</td>
									<td>ajskf1521a</td>
									<td>100,000,000</td>
									<td>배달중</td>
									<td>x</td>
									<td>20230109</td>
								</tr>

								<tr>
									<td>2023-12-30</td>
									<td>ajskf1521a</td>
									<td>100,000,000</td>
									<td>납품완료</td>
									<td>검수완료</td>
									<td>20230109</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${loginUser.memRole eq 'D'}">
			<div class="content">
			
				<div class="main-top">

					<div class="bigTop">
						<p>상담 신청</p>
						<br>
						<div>
							<table class="table table-hover table-size">
								<thead>
									<tr>
										<th>일자</th>
										<th>분류</th>
										<th>고객명</th>
										<th>고객번호</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2024-01-10</td>
										<td>G80</td>
										<td>어쩌고</td>
										<td>010-0000-0000</td>
									</tr>

									<tr>
										<td>2024-01-10</td>
										<td>G80</td>
										<td>어쩌고</td>
										<td>010-0000-0000</td>
									</tr>

									<tr>
										<td>2024-01-10</td>
										<td>G80</td>
										<td>어쩌고</td>
										<td>010-0000-0000</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>

				</div>

				<br><br>
				<div class="main-bottom">
					<p>견적 관리</p>
						<br>
						<div>
							<table class="table table-hover table-size">
								<thead>
									<tr>
										<th>분류</th>
										<th>차대번호</th>
										<th>고객명</th>
										<th>고객번호</th>
										<th>현황</th>
										<th>일자</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>G80</td>
										<td>KMH24020109450001</td>
										<td>어쩌고</td>
										<td>010-0000-0000</td>
										<td>계약확인</td>
										<td>2024-01-10</td>
									</tr>

									<tr>
										<td>G80</td>
										<td>KMH24020109450001</td>
										<td>어쩌고</td>
										<td>010-0000-0000</td>
										<td>조립중</td>
										<td>2024-01-10</td>
									</tr>

									<tr>
										<td>G80</td>
										<td>KMH24020109450001</td>
										<td>어쩌고</td>
										<td>010-0000-0000</td>
										<td>배송중</td>
										<td>2024-01-10</td>
									</tr>

								</tbody>
								
							</table>
						</div>
				</div>
				
			</div>
		</c:if>



	</div>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>