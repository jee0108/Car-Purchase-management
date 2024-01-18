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
					<button onclick="select();" class="btn btn-sm btn-default">조회</button>

					<script>
						function select(){
						
							$.ajax({
								url: 'check-class',
								data: {
									classCode: $('#classification').val()
									},
								success:result=>{
									console.log(result.list);
									
									var pi = result.pi;
									var list = result.list;

									let value= '';
									for(let i in list){
										value += '<tr>'
											  +  '<td>' +list[i].className+ '</td>'
											  +  '<td>' +list[i].carName+ '</td>'
											  +  '<td>' +list[i].carPrice+ '</td>'
											  +  '<td>' +'<a href= "'+list[i].filePath+'/'+list[i].uploadName+'" download="'+list[i].originName+'">'+list[i].originName+ '<a/></td>'
											  +  '<td style="border:none;"><button onclick="delete();" class="btn btn-sm btn-default">삭제</button></td>'
											  +  '</tr>'
									}

									$('#items-list tbody').html(value);
								},
								error:()=>{
									console.log('실패');
								}
							});
						}
					</script>
					<button class="btn btn-sm btn-end btn-default" data-toggle="modal" data-target="#myModal">추가</button>
					<br><br>
					
					<!-- Modal -->
					<div id="myModal" class="modal fade" role="dialog">
						<div class="modal-dialog">
					
							<!-- Modal content-->
							<div class="modal-content"  style="width: 50vw;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">모델 추가</h4>
								</div>
								<div class="modal-body">
									<table>
										<tr style="height: 50px;">
											<th width="90">모델 타입</th>
											<td width="120">
												<select name="classCode">
												<option value="SD">세단</option>
												<option value="SV">SUV</option>
												<option value="EV">전기차</option>
												</select>
											</td>

											<th width="70">모델명</th>
											<td  width="230"><input type="text" name="carName"></td>

											<th width="90">기본 가격</th>
											<td width="230"><input type="number" name="carPrice"></td>
										</tr>

										<tr style="height: 50px;">
											<th  width="90">엔진 타입</th>
											<td colspan="5">
												<input type="checkbox" name="" value="">&nbsp;가솔린 2.5T
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;가솔린 3.5T
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;가솔린 3.5T 48V
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;전기모터
											</td>
										</tr>

										<tr style="height: 50px;">
											<th>구동 타입</th>
											<td colspan="5">
												<input type="checkbox" name="" value="">&nbsp;2WD
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;AWD
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;AWD-LSD
											</td>
										</tr>

										<tr style="height: 70px;">
											<th>컬러</th>
											<td colspan="5">
												<input type="checkbox" name="" value="">&nbsp;우유니 화이트
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;세빌 실버
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;마칼루 그레이
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;비크 블랙
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;테즈먼 블루

												<br>
												<input type="checkbox" name="" value="">&nbsp;한라산 그린
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;브루클린 브라운
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;캐번디시 레드
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;배르비에 화이트
											</td>
										</tr>

										<tr style="height: 70px;">
											<th>휠/타이어</th>
											<td colspan="5">
												<input type="checkbox" name="" value="">&nbsp;18인치 다이아
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;19인치 하이퍼
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;19인치 다이아
												<br>
												<input type="checkbox" name="" value="">&nbsp;20인치 스퍼터링
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;20인치 다이아
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;22인치 다이아
											</td>
										</tr>

										<tr style="height: 70px;">
											<th>내장 디자인</th>
											<td colspan="5">
												<input type="checkbox" name="" value="">&nbsp;옵시디언 블랙 모노톤
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;에크루 카멜 모노톤
												<br>
												<input type="checkbox" name="" value="">&nbsp;에쉬 그레이/바닐라 베이지 투톤
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;마룬 브라운/포레스트 블루 투톤
											</td>
										</tr>

										<tr style="height: 70px;">
											<th>옵션</th>
											<td colspan="5">
												<input type="checkbox" name="" value="">&nbsp;파라노마 선루프
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;헤드업 디스플레이
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;뒷자석 듀얼 모니터
												<br>

												<input type="checkbox" name="" value="">&nbsp;드라이빙 어시스턴스 패키지
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;뱅앤올룹슨 사운드 패키지
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="" value="">&nbsp;빌트인 캠 패키지
											</td>
										</tr>

										<tr style="height: 50px;">
											<th>이미지</th>
											<td colspan="5"><input type="file" name="originalName"></td>
										</tr>

									</table>
									
								</div>
								<div class="modal-footer">
									<button type="button" onclick="enrollCar()">추가</button>
								</div>
							</div>
							
							<script>
								function enrollCar(){
						
									$.ajax({
										url: 'enroll-model',
										data: {
											
											},
										success:result=>{
											console.log(result.list);
										},
										error:()=>{
											console.log('실패');
										}
									});
								}

							</script>
						</div>
					</div>

					<div id="items-list">
						<table class="table table-hover table-size">
							<thead>
								<tr>
									<th>구분</th>
									<th>차량명</th>
									<th>기본가격</th>
									<th>이미지</th>
								</tr>
							</thead>

							<tbody>
								
							</tbody>
						</table>

					</div>
				</div>
				<div id="pagingArea" style="border: 1px solid red;">
					
				</div>
			</div>

		</div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>