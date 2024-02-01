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

            <div class="content" style="border: 1px solid rgba(222, 222, 222, 0.913)">
                <div class="contentWrap" style="border: 1px solid rgba(222, 222, 222, 0.913)">
                    
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
                        $(document).ready(() => {
                            // inventoryDataArray 초기화
                            const inventoryDataString = '${inven}';
                            const regex = /Inventory\(invenCode=([^,]+), invenName=([^,]+), itemCode=([^,]+), invenPlusPay=([^\)]+)\)/g;
                            const inventoryDataArray = [];
                    
                            let match;
                            while ((match = regex.exec(inventoryDataString)) !== null) {
                                const invenCode = match[1];
                                const invenName = match[2];
                                inventoryDataArray.push({ invenCode, invenName });
                            }
                    
                            // 클릭 이벤트 핸들러 등록
                            $('#estimateList>table>tbody>tr').click(function () {
                                var exNum = $(this).find('.exNum').val();
                    
                                $.ajax({
                                    url: 'detail-estimate',
                                    data: {
                                        exNum: exNum
                                    },
                                    success: result => {
                                        console.log(result);
                                        $('#resultCarName').html('선택모델 : ' + result.carName);
                    
                                        var exInven = result.exInven;
                                        var stringArray = exInven.split(',');
                    
                                        function getInventoryName(codeArray) {
                                            return codeArray.map(code => {
                                                const inventoryItem = inventoryDataArray.find(item => item.invenCode === code);
                                                return inventoryItem ? inventoryItem.invenName : code;
                                            });
                                        }
                    
                                        var enItems = stringArray.filter(item => item.includes('EN'));
                                        var wdItems = stringArray.filter(item => item.includes('WD'));
                                        var crItems = stringArray.filter(item => item.includes('CR'));
                                        var whItems = stringArray.filter(item => item.includes('WH'));
                                        var idItems = stringArray.filter(item => item.includes('ID'));
                                        var opItems = stringArray.filter(item => item.includes('OP'));
                    

                                        var enType = getInventoryName(enItems);
                                        var wdType = getInventoryName(wdItems);
                                        var crColor = getInventoryName(crItems);
                                        var whType = getInventoryName(whItems);
                                        var idDesignColor = getInventoryName(idItems);
                                        var opOptions = getInventoryName(opItems);
                    

                                        $('#resultEnItems').html('엔진타입 : ' + enType);
                                        $('#resultWdItems').html(' 구동타입 : ' + wdType);
                                        $('#resultCrItems').html(' 외장컬러 : ' + crColor);
                                        $('#resultWhItems').html('휠&타이어 : ' + whType);
                                        $('#resultIdItems').html('내장디자인&컬러 : ' + idDesignColor);
                                        $('#resultOpItems').html('추가 옵션 : ' + opOptions.join(', '));

                                        $('#resultExDate').html(result.exDate);
                                        $('#resultExPrice').html('예상가격 : ' + result.exPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'원');
                                        $('#resultMemberPhone').html(formatPhoneNumber(result.memberPhone));

                                    },
                                    error: () => {
                                        console.log('실패');
                                    }
                                });
                            });
                        });
                    </script>
                    
                    
                    
                    
                    <!-- Modal -->
					<div id="resultModal" class="modal modal-center fade" role="dialog">
						<div class="modal-dialog">
					
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">세부내역 </h4>
								</div>
								<div class="modal-body" style="font-size: 15px;">
                                    <br>
                                    <p id="resultCarName" style="height: 20px;"></p>
                                    <p id="resultEnItems"></p>
                                    <p id="resultWdItems"></p>
                                    <p id="resultCrItems"></p>
                                    <p id="resultWhItems"></p>
                                    <p id="resultIdItems"></p>
                                    <p id="resultOpItems"></p>
                                    <br>
                                    <p id="resultExPrice" class="exprice"></p>
                                    <br>
								</div>
								<div class="modal-footer">
                                    고객 번호 : <span id="resultMemberPhone"></span> / 
									견적일 : <span id="resultExDate"></span>
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