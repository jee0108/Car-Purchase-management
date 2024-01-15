<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- css-->
<link rel="stylesheet" href="resources/css/admin.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
</head>
<body>
	<jsp:include page="../common/adminHeader.jsp" />

	<div class="main-wrap">
		<div class="admin-title">
			<p>관리자 페이지</p>
		</div>
		<br><br>
		<div class="content">
		
			<div class="main-top">

				<div class="top float">
					<p>비품 관리</p>
					<br>
					<div>
						<label>재고 현황</label>

						<table>
							<tr>
								<td width="100">일자</td>
								<td width="100">품번</td>
								<td width="100">입고</td>
								<td width="100">납품</td>
								<td width="100">재고</td>
							</tr>

							<tr>
								<td>2024-01-10</td>
								<td>a-1015</td>
								<td>5</td>
								<td>0</td>
								<td>5</td>
							</tr>

							<tr>
								<td>2023-12-31</td>
								<td>b-5815</td>
								<td>0</td>
								<td>2</td>
								<td>3</td>
							</tr>

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
					<label>차량 입고 관리</label>
					<table>
						<tr>
							<td>일자</td>
						</tr>

						<tr>

						</tr>
					</table>
				</div>
			</div>
		</div>

	</div>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>