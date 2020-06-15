<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container mt-3"><!-- 내비 컨테이너 -->
	<div class="row">
		<div class="col-12">
			<div class="row">
				<div class="col-3"> <!-- 로고 -->
					<a class="navbar-brand" href="home.jsp">
						<img src="../resource/images/logo/domino.png" alt="도미노 로고"/>
					</a> 
				</div>
				<div class="col-6">	<!-- 검색창 -->
					<div class="row row-vh align-items-center">
						<div class="col-12">
							<form class="form-inline d-flex justify-content-center md-form form-sm">
		  						<input class="form-control form-control-sm mr-3 w-75" type="text" placeholder="Search" aria-label="Search">
		  						<i class="fas fa-search" aria-hidden="true"></i>
							</form>
						</div>
					</div>
				</div>
				<div class="col-3"><!-- 작은 버튼 -->
					<div class="row">
						<div class="col-6"><small><a class="btn">로그인</a></small></div>
						<div class="col-6"><small><a class="btn">회원가입</a></small></div>
					</div>
				</div>
			</div>
			<div class="row"><!-- 메뉴바 -->
				<div class="col-10"><!-- 상세메뉴 -->
					<div class="navbar navbar-expand-sm ">
			
						<!-- 링크들 (메뉴 중앙정렬) -->
						<ul class="navbar-nav">
							<li class="nav-item  d-flex justify-content-between align-itens-center"><a class="nav-link" href="">메뉴</a></li>
							<li class="nav-item  d-flex justify-content-between align-itens-center"><a class="nav-link" href="">이벤트/제휴</a></li>
							<li class="nav-item  d-flex justify-content-between align-itens-center"><a class="nav-link" href="">주문</a></li>
							<li class="nav-item  d-flex justify-content-between align-itens-center"><a class="nav-link" href="">매장검색</a></li>
							<li class="nav-item  d-flex justify-content-between align-itens-center"><a class="nav-link" href="">가맹점</a></li>
							<li class="nav-item  d-flex justify-content-between align-itens-center"><a class="nav-link" href="">관리자</a></li>
				
						</ul>
					</div>
				
				</div>
				<div class="col-2"><!-- 더보기 -->
					<div class="navbar navbar-expand-sm ">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="">전자책</a>
						<div class="dropdown-menu">
							<a class="dropdown-item">소설</a>
							<a class="dropdown-item">인문</a>
							<a class="dropdown-item">외국어</a>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>