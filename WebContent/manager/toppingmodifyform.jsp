<%@page import="com.domino.vo.Topping"%>
<%@page import="com.domino.dao.ToppingDao"%>
<%@page import="com.domino.util.NumberUtil"%>
<%@page import="com.domino.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<%
	String position = "manager";
%>
	<%@ include file="../common/navbar.jsp"%>
	<div class="container">
		<div class="header">
			<div class="row">
				<div class="col-4">
					<!-- 페이지명 바꿔서 사용하기 -->
					<h4>관리자</h4>
				</div>

				<div class="col-8">
					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link active" href="#">홈</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">></a></li>
						<li class="nav-item"><a class="nav-link active" href="#">관리자</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#"
							tabindex="-1" aria-disabled="true">></a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#">메뉴</a></li>
					</ul>
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
								class="nav-link text-muted " href="orderlist.jsp">주문</a></li>
							<li
								class="nav-item  d-flex justify-content-between align-itens-center small"><a
								class="nav-link text-dark font-weight-bold" href="menulist.jsp">메뉴</a></li>
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
			<div class="row">
				<div class="col-12">
					<div class="card ">
						<div class="card-header text-center">
							<strong>토핑 정보 수정</strong>
						</div>
						<div class="card-body">
						<%
							String yn = StringUtil.nullToValue(request.getParameter("yn"), "n");
							int toppingNo = NumberUtil.stringToInt(request.getParameter("toppingno"));
							ToppingDao toppingDao = new ToppingDao();
							Topping topping = toppingDao.getToppingByNo(toppingNo);
						%>
							<form method="post" action="toppingmodify.jsp" enctype="multipart/form-data">
								<input type="hidden" name="sideno" value="<%=toppingNo%>">
								<input type="hidden" name="yn" value="<%=yn%>">
								<div class="form-group">
									<label>토핑 이름</label> 
									<input type="text" class="form-control"
										name="name" value="<%=topping.getName() %>" />
								</div>
								<div class="form-group">
									<label>토핑 가격</label> 
									<input type="text" class="form-control"
										name="price" value="<%=topping.getPrice() %>" />
								</div>
								<div class="form-group">
									<label>카테고리</label> 
									<select name="category" class="form-control">
										<option value="1" <%=(1==topping.getCategory()) ? "selected":"" %>>메인</option>
										<option value="2" <%=(2==topping.getCategory()) ? "selected":"" %>>치즈</option>
										<option value="3" <%=(3==topping.getCategory()) ? "selected":"" %>>애프터</option>
									</select>
								</div>
								<!-- 사진등록 -->
								<div class="form-group">
									<label>첨부파일</label>
									<div>
										<input type="file" name="upfile" />
									</div>
								</div>

								<div class="text-right">
									<button type="submit" class="btn btn-primary">수정하기</button>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>