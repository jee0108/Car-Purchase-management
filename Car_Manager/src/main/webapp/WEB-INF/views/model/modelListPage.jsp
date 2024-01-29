<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모델</title>
<!-- css-->
<link rel="stylesheet" href="resources/css/model.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="wrap">
	
		<div class="li-list">
			<ul class="list">
				<label>모델</label>
				<br><br>
				<li onclick="modelAll();">ALL</li>
				<li onclick="modelSedan();">SEDAN</li>
				<li onclick="modelSuv();">SUV</li>
				<li onclick="modelEv();">EV</li>
			</ul>
		</div>

		<div class="img-list">
			
			<div class="img-result">
				<c:if test="${empty list}">
					<div style="color: white;">조회 결과가 없습니다.</div>
				</c:if>

				<c:forEach items="${list}" var="c">
					<div style="margin-right: 30px;">
						<form action="carMaking">
							<label class="carName">${c.carName}</label>
							<input type="hidden" name="carName" value="${c.carName}">
							<button type="submit" class="btn btn-sm btn-end" onclick="carMaking();">견적내기</button>
							<br>
							<img class="carImg" src="${c.uploadName}" alt="${c.originalName}" width="300" height="150">
						</form>
					</div>
				</c:forEach>
			</div>
			
		</div>

		<script>
			function modelAll (){
				$.ajax({
					url: 'modelAll',
					success:result=>{
						console.log(result);
						let value ='';
						if(result.length === 0){
							value += '<div style="color: white;">조회 결과가 없습니다.</div>'
						}
						for(let i in result){
							value += '<div style="margin-right: 30px;"><label class="carName">'+result[i].carName+'</label>'
								  + '<input type="hidden" name="carName" value="'+result[i].carName+'">'
								  + '<button type="button" class="btn btn-sm btn-end" onclick="carMaking();">견적내기</button>'
								  + '<br>'
								  + '<img class="carImg" src="'+result[i].uploadName+'" width="300" height="150"></div>'
						}
						$('.img-result').html(value);
					},
					error:()=>{
						console.log('실패');
					}
				});
			}

			function modelSedan (){
				$.ajax({
					url: 'modelSedan',
					success:result=>{
						console.log(result);
						let value ='';
						if(result.length === 0){
							value += '<div style="color: white;">조회 결과가 없습니다.</div>'
						}
						for(let i in result){
							value += '<div style="margin-right: 30px;"><label class="carName">'+result[i].carName+'</label>'
								  + '<input type="hidden" name="carName" value="'+result[i].carName+'">'
								  + '<button type="button" class="btn btn-sm btn-end" onclick="carMaking();">견적내기</button>'
								  + '<br>'
								  + '<img class="carImg" src="'+result[i].uploadName+'" width="300" height="150"></div>'
						}
						$('.img-result').html(value);
					},
					error:()=>{
						console.log('실패');
					}
				});
			}

			function modelSuv (){
				$.ajax({
					url: 'modelSuv',
					success:result=>{
						console.log(result);
						let value ='';
						if(result.length === 0){
							value += '<div style="color: white;">조회 결과가 없습니다.</div>'
						}
						for(let i in result){
							value += '<div style="margin-right: 30px;"><label class="carName">'+result[i].carName+'</label>'
								  + '<input type="hidden" name="carName" value="'+result[i].carName+'">'
								  + '<button type="button" class="btn btn-sm btn-end" onclick="carMaking();">견적내기</button>'
								  + '<br>'
								  + '<img class="carImg" src="'+result[i].uploadName+'" width="300" height="150"></div>'
						}
						$('.img-result').html(value);
					},
					error:()=>{
						console.log('실패');
					}
				});
			}

			function modelEv (){
				$.ajax({
					url: 'modelEv',
					success:result=>{
						console.log(result);
						let value ='';
						if(result.length === 0){
							value += '<div style="color: white;">조회 결과가 없습니다.</div>'
						}
						for(let i in result){
							value += '<div style="margin-right: 30px;"><label class="carName">'+result[i].carName+'</label>'
								  + '<input type="hidden" name="carName" value="'+result[i].carName+'">'
								  + '<button type="button" class="btn btn-sm btn-end">견적내기</button>'
								  + '<br>'
								  + '<img class="carImg" src="'+result[i].uploadName+'" width="300" height="150"></div>'
						}
						$('.img-result').html(value);
					},
					error:()=>{
						console.log('실패');
					}
				});
			}
		</script>

	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>