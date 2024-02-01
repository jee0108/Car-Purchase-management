<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드바이저 페이지</title>
<!-- css-->
<link rel="stylesheet" href="resources/css/dealer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

    <jsp:include page="../common/adminHeader.jsp" />

    <div>
        <div class="wrap">

            <div class="content">
                <div class="contentWrap">
                    
                    <h4 style="font-weight: bold; text-align: center;">구매상담 신청 목록</h4>
                    <br><br>
                    <div id="estimateList">
                        <table class="table table-hover table-size">
                            <thead>
                                <tr >
                                    <th>분류</th>
                                    <th>예상견적</th>
                                    <th>고객번호</th>
                                    <th>일자</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <c:forEach items="${estimate}" var="e">  
                                    <tr data-toggle="modal" href="#resultModal">
                                        <input type="hidden" name="exNum" value="${e.exNum}" class="exNum">
                                        <td>${e.carName}</td>
                                        <td class="exprice">${e.exPrice}</td>
                                        <td class="memberPhone">${e.memberPhone}</td>
                                        <td>${e.exDate}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <script>
                        $('.exprice').each(function () {
                            var exprice = $(this).text();
                            var replacePay = exprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                            $(this).html(replacePay + '원');
                        });
        
                        $('.memberPhone').each(function () {
                            var memphone = $(this).text();
                            var replacePhone = formatPhoneNumber(memphone);
                            $(this).html(replacePhone);
                        });
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
                        $(()=>{
                            $.ajax({
								url: 'detail-estimate',
								data: {
									exNum: $('.exNum').val()
								},
								success:result=>{
									
								},
								error:()=>{
									console.log('실패');
								}
						    });
                        })
                    </script>

                    <!-- Modal -->
					<div id="resultModal" class="modal modal-center fade" role="dialog">
						<div class="modal-dialog modal-lg">
					
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">세부내역</h4>
								</div>
								<div class="modal-body">
									

								</div>
								<div class="modal-footer">
									
								</div>

							</div>

					</div>

                </div>
                
            </div>

            <div id="pageInfo">
                <ul class="pagination" style="float: inline-end; margin-right: 50px;">
                    <c:choose>
                        <c:when test="${pi.currentPage eq 1 }">
                            <li class="page-item disabled"><a class="page-link" href="#">◄</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="estimate?cPage=${pi.currentPage-1}">◄</a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var ="p">
                        <li class="page-item"><a class="page-link" href="estimate?cPage=${p}">${p}</a></li>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${pi.endPage eq pi.maxPage}">
                            <li class="page-item disabled"><a class="page-link" href="#">►</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="estimate?cPage=${pi.currentPage+11}">►</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
			</div>

        <div>
    </div>

</body>
</html>