<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목관리</title>
<!-- css-->
<link rel="stylesheet" href="resources/css/item.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<jsp:include page="../common/adminHeader.jsp" />
	
	<div class="main-wrap">

		<div class="graph">
			<p>품목별 통계</p>
			<div class="item-graph">
				<div class="inner">
					세단 SUV EV
				</div>
				
			</div>
		</div>

		<div class="items">
			<p>품목별 관리</p>
			<div class="items-inner">
				<div class="inner">
					<label>차량 구분&nbsp;&nbsp;</label>
					<select name="classCode" id="classification">
						<option value="AL">ALL</option>
						<option value="SD">세단</option>
						<option value="SV">SUV</option>
						<option value="EV">전기차</option>
					</select>

					<script>
						$(()=>{
							$.ajax({
								url: 'check-class',
								data: {
									classCode: $('#classification').val()
									},
								success:result=>{
									console.log(result);
									$('#items-list').val();
								},
								error:()=>{
									console.log('실패');
								}
							});
						})
					</script>
					<button class="btn btn-sm btn-end btn-default">추가</button>
					<br><br>

					<div id="items-list">
						<table class="table table-hover table-size">
							<thead>
								<tr>
									<th>구분</th>
									<th>차량명</th>
									<th>기본가격</th>
									<th>이미지첨부</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td>세단</td>
									<td>G80</td>
									<td>100,000,000</td>
									<td>미리보기</td>
								</tr>
								<tr>
									<td>세단</td>
									<td>G70</td>
									<td>100,000,000</td>
									<td>미리보기</td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>