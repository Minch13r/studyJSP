<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>좋아요 목록</title>
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Font Awesome 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<style>
		body {
			background-color: #f8f9fa;
			padding-top: 20px;
			padding-bottom: 50px;
		}
		.wishlist-container {
			background-color: white;
			border-radius: 10px;
			box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
			padding: 30px;
			margin-top: 20px;
		}
		.wishlist-header {
			border-bottom: 1px solid #e9ecef;
			padding-bottom: 20px;
			margin-bottom: 20px;
		}
		.wishlist-table {
			margin-bottom: 30px;
		}
		.wishlist-table th {
			background-color: #f1f8ff;
			font-weight: 600;
		}
		.wishlist-empty {
			text-align: center;
			padding: 30px;
			color: #6c757d;
		}
		.product-link {
			color: #0d6efd;
			text-decoration: none;
			font-weight: 500;
		}
		.product-link:hover {
			text-decoration: underline;
		}
		.price-value {
			font-weight: 600;
			color: #0d6efd;
		}
		.stock-badge {
			font-size: 0.85rem;
		}
		.likes-count {
			color: #dc3545;
			font-weight: 600;
		}
		.logo-container {
			text-align: center;
			margin-bottom: 20px;
		}
		.logo-container img {
			max-height: 80px;
		}
		.date-value {
			font-size: 0.9rem;
			color: #6c757d;
		}
	</style>
</head>

<body>
<div class="container">
	<!-- 로고 및 네비게이션 -->
	<div class="logo-container">
		<a href="controller.jsp?action=MAINPAGE" class="text-decoration-none">
			<h1 class="text-primary"><i class="fas fa-store me-2"></i>쇼핑몰</h1>
		</a>
	</div>

	<!-- 좋아요 목록 헤더 -->
	<div class="wishlist-header text-center">
		<h2 class="fw-bold text-primary">
			<i class="fas fa-heart me-2"></i>내가 좋아하는 상품
		</h2>
		<p class="lead text-muted">관심있는 상품을 모아서 볼 수 있습니다</p>
	</div>

	<!-- 좋아요 목록 컨테이너 -->
	<div class="wishlist-container">
		<c:choose>
			<c:when test="${empty requestScope.likeList}">
				<div class="wishlist-empty">
					<i class="far fa-heart fa-3x mb-3"></i>
					<p class="fs-5">아직 좋아하는 상품이 없습니다!</p>
					<a href="controller.jsp?action=MAINPAGE" class="btn btn-primary mt-3">
						<i class="fas fa-store me-2"></i>쇼핑하러 가기
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="table-responsive">
					<table class="table table-hover align-middle wishlist-table">
						<thead class="text-center">
						<tr>
							<th scope="col">상품번호</th>
							<th scope="col">상품명</th>
							<th scope="col">가격</th>
							<th scope="col">설명</th>
							<th scope="col">재고</th>
							<th scope="col">등록날짜</th>
							<th scope="col">관리</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${requestScope.likeList}">
							<tr>
								<td class="text-center">${data.p_num}</td>
								<td>
									<a href="controller.jsp?action=PRODUCTDETAILPAGE&p_num=${data.p_num}" class="product-link">
											${data.p_name}
									</a>
								</td>
								<td class="text-end price-value">
									<fmt:formatNumber value="${data.p_price}" pattern="#,###" /> 원
								</td>
								<td><small>${data.p_description}</small></td>
								<td class="text-center">
									<c:choose>
										<c:when test="${data.p_stock > 10}">
											<span class="badge bg-success stock-badge">${data.p_stock}개 남음</span>
										</c:when>
										<c:when test="${data.p_stock > 0}">
											<span class="badge bg-warning text-dark stock-badge">품절임박! ${data.p_stock}개</span>
										</c:when>
										<c:otherwise>
											<span class="badge bg-danger stock-badge">품절</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-center date-value">${data.p_regdate}</td>
								<td class="text-center">
									<div class="btn-group">
										<a href="controller.jsp?action=PRODUCTDETAILPAGE&p_num=${data.p_num}" class="btn btn-sm btn-outline-primary">
											<i class="fas fa-eye"></i>
										</a>
										<form action="controller.jsp" method="post" class="d-inline">
											<input type="hidden" name="action" value="UNLIKEPRODUCT">
											<input type="hidden" name="p_num" value="${data.p_num}">
											<button type="submit" class="btn btn-sm btn-outline-danger">
												<i class="fas fa-heart-broken"></i>
											</button>
										</form>
										<form action="controller.jsp" method="post" class="d-inline">
											<input type="hidden" name="action" value="ADDCART">
											<input type="hidden" name="p_num" value="${data.p_num}">
											<button type="submit" class="btn btn-sm btn-outline-success">
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- 페이지 하단 버튼 -->
				<div class="d-flex justify-content-between mt-4">
					<a href="controller.jsp?action=MAINPAGE" class="btn btn-primary">
						<i class="fas fa-arrow-left me-2"></i>메인으로 돌아가기
					</a>
					<a href="controller.jsp?action=CARTPAGE" class="btn btn-success">
						<i class="fas fa-shopping-cart me-2"></i>장바구니 보기
					</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<!-- Bootstrap JS 및 Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
