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
					&nbsp;&nbsp;<button onclick="select();" class="btn btn-sm btn-default">조회</button>

					<script>
						function select(){
							console.log($('#classification').val());
							$.ajax({
								url: 'codeCheck',
								data: {
									classCode: $('#classification').val()
									},
								success:result=>{
									//console.log(result.list);
									let value= '';
									var pi = result.pi;
									var list = result.list;

									if(result.list.length === 0){
										value += '<tr><td colspan="4" style="text-align: center;">조회 결과가 없습니다.</td></tr>'
									}
									
									for(let i in list){
										value += '<tr>'
											  +  '<td>' + list[i].className	+ '</td>'
											  +  '<td>' + list[i].carName	+ '</td>'
											  +  '<td>' + list[i].carPrice	+ '</td>'
											  +  '<td>' + list[i].uploadDate+ '</td>'
											  +  '<td style="border:none; width: 20px;"><button onclick="delete();" class="btn btn-sm btn-default">삭제</button></td>'
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
					
							<form method="post" action="enroll-model" enctype="multipart/form-data">
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
												<select name="classCode" id="classCode">
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
												<input type="checkbox" name="invenCode" value="EN-G25T">&nbsp;가솔린 2.5T
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="EN-G35T">&nbsp;가솔린 3.5T
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="EN-G48V">&nbsp;가솔린 3.5T 48V
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="EN-EV00">&nbsp;전기모터
											</td>
										</tr>

										<tr style="height: 50px;">
											<th>구동 타입</th>
											<td colspan="5">
												<input type="checkbox" name="invenCode" value="2WD">&nbsp;2WD
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="AWD">&nbsp;AWD
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="AWD-LSD">&nbsp;AWD-LSD
											</td>
										</tr>

										<tr style="height: 110px;">
											<th>컬러</th>
											
											<td colspan="5">
												<input type="checkbox" name="invenCode" value="CR-UYH">&nbsp;우유니 화이트
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="CR-BRB">&nbsp;브루클린 블랙
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="CR-SSS">&nbsp;세빌 실버
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="CR-NCM">&nbsp;마칼루 그레이
												<br>

												<input type="checkbox" name="invenCode" value="CR-URA">&nbsp;테즈먼 블루
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="CR-MDY">&nbsp;한라산 그린
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="CR-RLA">&nbsp;캐번디시 레드
												<br>

												<input type="checkbox" name="invenCode" value="CR-PH3">&nbsp;[매트] 비크 블랙
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="CR-NA3">&nbsp;[매트] 배르비에 화이트
											</td>
										</tr>

										<tr style="height: 70px;">
											<th>휠/타이어</th>
											<td colspan="5">
												<input type="checkbox" name="invenCode" value="WH-18D">&nbsp;18인치 다이아
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="WH-19H">&nbsp;19인치 하이퍼
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="WH-19D">&nbsp;19인치 다이아
												<br>
												<input type="checkbox" name="invenCode" value="WH-20S">&nbsp;20인치 스퍼터링
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="WH-20D">&nbsp;20인치 다이아
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="WH-22D">&nbsp;22인치 다이아
											</td>
										</tr>

										<tr style="height: 70px;">
											<th>내장 디자인</th>
											<td colspan="5">
												<input type="checkbox" name="invenCode" value="ID-BN">&nbsp;옵시디언 블랙 모노톤
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="ID-CN">&nbsp;에크루 카멜 모노톤
												<br>
												<input type="checkbox" name="invenCode" value="ID-GB">&nbsp;에쉬 그레이/바닐라 베이지 투톤
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="ID-BB">&nbsp;마룬 브라운/포레스트 블루 투톤
											</td>
										</tr>

										<tr style="height: 70px;">
											<th>옵션</th>
											<td colspan="5">
												<input type="checkbox" name="invenCode" value="OP-SUN">&nbsp;파라노마 선루프
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="OP-HAD">&nbsp;헤드업 디스플레이
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="OP-MOR">&nbsp;뒷자석 듀얼 모니터
												<br>

												<input type="checkbox" name="invenCode" value="OP-DRA">&nbsp;드라이빙 어시스턴스 패키지
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="OP-BAN">&nbsp;뱅앤올룹슨 사운드 패키지
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="OP-BIL">&nbsp;빌트인 캠 패키지
											</td>
										</tr>

										<tr style="height: 50px;">
											<th>이미지</th>
											<td colspan="5"><input type="file" name="upfile"></td>
										</tr>

									</table>
									
								</div>
								<div class="modal-footer">
									<button type="submit">추가</button>
								</div>
							</div>
							</form>
							
						</div>
					</div>

					<div id="items-list">
						<table class="table table-hover table-size">
							<thead>
								<tr>
									<th>구분</th>
									<th>차량명</th>
									<th>기본가격</th>
									<th>일자</th>
								</tr>
							</thead>

							<tbody>
								<c:if test="${empty allList}">
									<tr>
										<td colspan="4" style="text-align: center;">조회 결과가 없습니다.</td>
									</tr>
								</c:if>

								<c:forEach items="${allList}" var="c">
									<tr data-toggle="modal" href="#resultModal">
										<td>${c.className}</td>
										<td class="cname">${c.carName}</td>
										<td class="price">${c.carPrice}</td>
										<td>${c.uploadDate}</td>
										<td style="border:none; width: 20px;" aria-readonly="true"><button onclick="delete();" class="btn btn-sm btn-default">삭제</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- Modal -->
					<div id="resultModal" class="modal fade" role="dialog">
						<div class="modal-dialog">
					
							<form method="post" action="enroll-model" enctype="multipart/form-data">
							<!-- Modal content-->
							<div class="modal-content"  style="width: 50vw;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">모델 정보</h4>
								</div>
								<div class="modal-body">
									<table>
										<tr style="height: 50px;">
											<th width="90">모델 타입</th>
											<td width="120">
												<select name="classCode" id="classCode">
												<option value="SD">세단</option>
												<option value="SV">SUV</option>
												<option value="EV">전기차</option>
												</select>
											</td>

											<th width="70">모델명</th>
											<td  width="230"><input type="text" name="carName" id="cname" readonly></td>

											<th width="90">기본 가격</th>
											<td width="230"><input type="number" name="carPrice"></td>
										</tr>

										<tr style="height: 50px;">
											<th  width="90">엔진 타입</th>
											<td colspan="5">
												<input type="checkbox" name="invenCode" value="EN-G25T">&nbsp;가솔린 2.5T
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="EN-G35T">&nbsp;가솔린 3.5T
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="EN-G48V">&nbsp;가솔린 3.5T 48V
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="EN-EV00">&nbsp;전기모터
											</td>
										</tr>

										<tr style="height: 50px;">
											<th>구동 타입</th>
											<td colspan="5">
												<input type="checkbox" name="invenCode" value="2WD">&nbsp;2WD
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="AWD">&nbsp;AWD
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="AWD-LSD">&nbsp;AWD-LSD
											</td>
										</tr>

										<tr style="height: 110px;">
											<th>컬러</th>
											
											<td colspan="5">
												<input type="checkbox" name="invenCode" value="CR-UYH">&nbsp;우유니 화이트
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="CR-BRB">&nbsp;브루클린 블랙
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="CR-SSS">&nbsp;세빌 실버
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="CR-NCM">&nbsp;마칼루 그레이
												<br>

												<input type="checkbox" name="invenCode" value="CR-URA">&nbsp;테즈먼 블루
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="CR-MDY">&nbsp;한라산 그린
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="CR-RLA">&nbsp;캐번디시 레드
												<br>

												<input type="checkbox" name="invenCode" value="CR-PH3">&nbsp;[매트] 비크 블랙
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="CR-NA3">&nbsp;[매트] 배르비에 화이트
											</td>
										</tr>

										<tr style="height: 70px;">
											<th>휠/타이어</th>
											<td colspan="5">
												<input type="checkbox" name="invenCode" value="WH-18D">&nbsp;18인치 다이아
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="WH-19H">&nbsp;19인치 하이퍼
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="WH-19D">&nbsp;19인치 다이아
												<br>
												<input type="checkbox" name="invenCode" value="WH-20S">&nbsp;20인치 스퍼터링
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="WH-20D">&nbsp;20인치 다이아
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="WH-22D">&nbsp;22인치 다이아
											</td>
										</tr>

										<tr style="height: 70px;">
											<th>내장 디자인</th>
											<td colspan="5">
												<input type="checkbox" name="invenCode" value="ID-BN">&nbsp;옵시디언 블랙 모노톤
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="ID-CN">&nbsp;에크루 카멜 모노톤
												<br>
												<input type="checkbox" name="invenCode" value="ID-GB">&nbsp;에쉬 그레이/바닐라 베이지 투톤
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="ID-BB">&nbsp;마룬 브라운/포레스트 블루 투톤
											</td>
										</tr>

										<tr style="height: 70px;">
											<th>옵션</th>
											<td colspan="5">
												<input type="checkbox" name="invenCode" value="OP-SUN">&nbsp;파라노마 선루프
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="OP-HAD">&nbsp;헤드업 디스플레이
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="OP-MOR">&nbsp;뒷자석 듀얼 모니터
												<br>

												<input type="checkbox" name="invenCode" value="OP-DRA">&nbsp;드라이빙 어시스턴스 패키지
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="OP-BAN">&nbsp;뱅앤올룹슨 사운드 패키지
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="checkbox" name="invenCode" value="OP-BIL">&nbsp;빌트인 캠 패키지
											</td>
										</tr>

										<tr style="height: 50px;">
											<th>이미지</th>
											<td colspan="5"><input type="file" name="upfile"></td>
										</tr>

									</table>
									
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-sm btn-success">수정하기</button>
									<button onclick="delete();" class="btn btn-sm btn-danger">삭제하기</button>
								</div>
							</div>

						<script>
							$(()=>{
								$('#items-list>table>tbody>tr').click(function () {
									var cname = $(this).children('.cname').text();
									$('#cname').val(cname);
									console.log(cname);

									
									$.ajax({
										url: 'detail-item',
										data: {
											carName: cname
											},
										success:result=>{
											console.log(result.list);
											
										},
										error:()=>{
											console.log('실패');
										}
									});
								});
						   })
						</script>

					</div>
				</div>
				<div id="pagingArea" style="border: 1px solid red; display: block; margin: auto;">
					<ul class="pagination"  style="border: 1px solid green; text-align: center !important; width: auto;">
						<c:choose>
							<c:when test="${pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="item-management?cPage=${pi.currentPage-1}">Previous</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${pi.startPage}" end="${pi.endPage}" var ="p">
							<li class="page-item"><a class="page-link" href="item-management?cPage=${p}">${p}</a></li>
						</c:forEach>
						<c:choose>
							<c:when test="${pi.endPage eq pi.maxPage}">
								<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="item-management?cPage=${pi.currentPage+11}">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			
		</div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>