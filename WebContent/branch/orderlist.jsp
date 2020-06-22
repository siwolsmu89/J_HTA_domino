<%@page import="com.domino.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@page import="com.domino.dao.OrderDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<%
	String position = "branch";
%>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="header">
		<div class="row">	
			<div class="col-4">
				<h4>가맹점</h4>
			</div>			
			<div class="col-8">
				<ul class="nav justify-content-end">
				  <li class="nav-item"><a class="nav-link active" href="/domino/common/home.jsp">홈</a></li>
				    <li class="nav-item"><a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">></a></li>
				   <li class="nav-item"><a class="nav-link active" href="/domino/branch/info.jsp">가맹점</a></li>
				    <li class="nav-item"><a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">></a></li>
				    <li class="nav-item"><a class="nav-link disabled" href="#">메뉴</a></li>
				</ul>
			</div>
		</div>
	</div>
			<div style="background-color: black; height: 2px;" class="mb-2"></div>
			<div class="row ">
				<div class="col-12">
					<div class="navbar navbar-expand-sm ">
						<ul class="navbar-nav">
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted " href="info.jsp">메인</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-dark font-weight-bold" href="orderlist.jsp">주문</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="menulist.jsp">메뉴</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="eventlist.jsp">이벤트</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="qnaboard.jsp">1:1문의</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-muted" href="branchlist.jsp">가맹점</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="body">
			<%
				// 가맹점주 아이디로 로그인할 경우, session에 loginBranchNo 넣어주기
				int loginBranchNo = 100;
			
				//<!-- 페이지네이션  -->
				// 1. 한 화면에 표시할 행의 갯수
				int rowsPerPage = 10;

				// 2. 클라이언트가 요청한 페이지 번호 조회하기
				int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);

				// 3. 조회할 목록의 시작번호와 끝번호를 조회한다.
				int beginNumber = (pageNo - 1) * rowsPerPage + 1;
				int endNumber = pageNo * rowsPerPage;

				int rowCount = 0;
				//<!-- 페이지네이션  -->
			%>
			<div class="row">
				<div class="col-12">
					<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 시작 -->
					<!-- 검색조건, 정렬기준 입력 폼 시작 -->

					<div class="row">
						<div class="col-6">
							<form action="">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<select class="form-control" name="searchoption">
											<option value="orderno">주문번호</option>
											<option value="branchname">매장이름</option>
											<option value="orderstatus">주문상태</option>
										</select>
									</div>
									<input id="searchValue" type="text" class="form-control" name="searchvalue" placeholder="검색어를 입력하세요">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button" onclick="#">조회</button>
									</div>
								</div>
							</form>
																								
						</div>
						<div class="col-2 offset-4">
							<form action="">
								<div class="input-group mb-3">
									<select class="form-control" name="sort">
										<option value="title">전체보기</option>
										<option value="writer">완료된 주문</option>
										<option value="content">진행중인 주문</option>
									</select>
								</div>
							</form>
						</div>
					</div>

					<!-- 검색조건, 정렬기준 입력 폼 끝 -->
					<%
						OrderDao orderDao = new OrderDao();
						List<OrderDto> orders = orderDao.getAllOrdersByBranchNoWithRange(loginBranchNo, beginNumber, endNumber);
						rowCount = orderDao.getAllOrdersByBranchNo(loginBranchNo).size();
					%>
					<table class="table text-center">
						<colgroup>
							<col width="15%">
							<col width="15%">
							<col width="25%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead class="thead-dark">
							<tr>
								<th>주문번호</th>
								<th>매장이름</th>
								<th>주문한메뉴</th>
								<th>총금액</th>
								<th>배달요청시간</th>
								<th>주문상태</th>
							</tr>
						</thead>
						<tbody id="datas-body">
					<%
						if (orders.isEmpty()) {
							
					%>
						<tr><td colspan="6">주문정보가 없습니다.</td></tr>
					<%		
						} else {
							for(OrderDto order : orders) {
							 
								int orderNo = order.getOrderNo();
								String branchName = order.getBranchName();
								int totalAmount = order.getTotalAmount();
								int totalPrice = order.getTotalDiscountPrice();
	
								String menuName = "";
								if (order.getPizzaName() != null) {
									menuName = order.getPizzaName();
								} else if (order.getSideName() != null) {
									menuName = order.getSideName();
								} else {
									menuName = order.getEtcName(); 
								}
								
								int os = order.getOrderStatus();
								String statusStr = "";
								if (os == 0) {
									statusStr = "접수완료";
								} else if (os == 1) {
									statusStr = "요리중";
								} else if (os == 2) {
									statusStr = "배달중";
								} else if (os == 3) {
									statusStr = "배달완료";
								} else if (os == 4) {
									statusStr = "수령완료";
								} else {
									statusStr = "주문취소";
								}
								
								String requestTime = "임시";
					%>
							<tr>
								<td><%=orderNo %></td>
								<td><%=branchName %></td>
								<td><%=menuName %></td>
								<td><%=totalPrice %></td>
								<td><%=requestTime %></td>
								<td><button class="btn btn-dark"><%=statusStr %></button></td>
							</tr>
					<%
							}
						}
					%>
						</tbody>
					</table>
					<!-- 페이지 처리 시작 -->
					<ul class="pagination justify-content-center"
						style="margin: 20px 0">
						<%
							// 0. 한 화면당 표시할 페이지번호 갯수
							int pagesPerBlock = 5;

							// 1. 전체 행의 갯수를 조회한다.
							int rows = rowCount;

							// 2. 전체 페이지수를 계산한다.
							int totalPages = (int) Math.ceil((double) rows / rowsPerPage);

							// 3. 전체 페이지블록 갯수 계산하기
							int totalBlocks = (int) Math.ceil((double) totalPages / pagesPerBlock);

							// 4. 요청한 페이지가 어느 페이지 블록에 속하는지 계산하기
							int currentBlock = (int) Math.ceil((double) pageNo / pagesPerBlock);

							// 5. 요청한 페에지가 속한 블록의 시작페이지번호와 끝페이지번호 계산하기
							int beginPageNo = (currentBlock - 1) * pagesPerBlock + 1;
							int endPageNo = currentBlock * pagesPerBlock;
							if (currentBlock == totalBlocks) {
								endPageNo = totalPages;
							}
						
						%>
						<li class="page-item "><a class="page-link"
							href="orderlist.jsp?page=<%=pageNo - 1 %>"> 이전 </a></li>
						<%
							for (int num = beginPageNo; num <= endPageNo; num++) {
						%>
						<li class="page-item active"><a class="page-link"
							href="orderlist.jsp?page=<%=num %>"
							style="<%=pageNo == num ? "background-color: #4caf50;" : "" %>">
								<%=num %>
						</a></li>
						<%
							}
						%>
						<li class="page-item"><a class="page-link"
							href="orderlist.jsp?page=<%=pageNo + 1 %>"> 다음 </a></li>
					</ul>
					<!-- 페이지 처리 끝 -->
				</div>

			</div>
		</div>

	<%@ include file="../common/footer.jsp"%>
	
	<script type="text/javascript">
		function searchByValue() {
			// 검색 옵션
			var searchOption = document.querySelector("select[name=searchoption]").value;
			// 검색 값
			var searchValue = document.querySelector("#searchValue").value;
			
			var xhr = new XMLHttpRequest();
			
			
			xhr.onreadystatechange = function() {
				
				if(xhr.readyState == 4 && xhr.status == 200) {
					var text = xhr.responseText;
					var datas = JSON.parse(text);
					
					var rows = "";
					for(var i=0; i<datas.length; i++){
						var data = datas[i];
						
						alert(data);
						
					}
					
					document.getElementById("").innerHTML = rows;
				}
			}
			
			xhr.open("GET", "/JSON/orderlistdata.jsp?searchopt="+searchOption+"&&searchValue="+searchValue);
			
			xhr.send();
		}
	</script>
</body>
</html>