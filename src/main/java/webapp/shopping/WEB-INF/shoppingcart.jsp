<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>장바구니</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 30px;
            padding-bottom: 50px;
        }
        .cart-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 20px;
        }
        .cart-header {
            border-bottom: 1px solid #e9ecef;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }
        .cart-table {
            margin-bottom: 30px;
        }
        .cart-table th {
            background-color: #f1f8ff;
            font-weight: 600;
        }
        .cart-empty {
            text-align: center;
            padding: 30px;
            color: #6c757d;
        }
        .cart-footer {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
        }
        .total-price {
            font-size: 1.5rem;
            font-weight: bold;
            color: #dc3545;
        }
        .btn-continue {
            margin-top: 20px;
        }
        .product-name {
            font-weight: 500;
        }
        .product-price {
            font-weight: 600;
            color: #0d6efd;
        }
        .remove-btn {
            color: #dc3545;
            cursor: pointer;
        }
        .remove-btn:hover {
            color: #c82333;
        }
    </style>
</head>

<body>
<div class="container">
    <!-- 장바구니 헤더 -->
    <div class="cart-header text-center">
        <h1 class="display-5 fw-bold text-primary">
            <i class="fas fa-shopping-cart me-2"></i>장바구니
        </h1>
        <p class="lead text-muted">구매하실 상품을 확인해 주세요</p>
    </div>

    <!-- 장바구니 컨테이너 -->
    <div class="cart-container">
        <!-- 장바구니 테이블 -->
        <div class="table-responsive">
            <table class="table table-hover cart-table align-middle">
                <thead>
                <tr class="text-center">
                    <th scope="col" width="10%">번호</th>
                    <th scope="col" width="50%">상품명</th>
                    <th scope="col" width="20%">가격</th>
                    <th scope="col" width="20%">관리</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty sessionScope.cart}">
                        <c:set var="index" value="1" />
                        <c:forEach var="product" items="${sessionScope.cart}">
                            <tr class="text-center">
                                <td>${index}</td>
                                <td class="text-start product-name">
                                        ${product.p_name}
                                </td>
                                <td class="product-price">
                                    <fmt:formatNumber value="${product.p_price}" pattern="#,###" /> 원
                                </td>
                                <td>
                                    <form action="controller.jsp" method="post">
                                        <input type="hidden" name="action" value="REMOVEFROMCART">
                                        <input type="hidden" name="p_num" value="${product.p_num}">
                                        <button type="submit" class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash-alt me-1"></i>삭제
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <c:set var="index" value="${index + 1}" />
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="4" class="cart-empty">
                                <i class="fas fa-shopping-basket fa-3x mb-3"></i>
                                <p class="fs-5">장바구니가 비어 있습니다.</p>
                                <a href="controller.jsp?action=MAINPAGE" class="btn btn-primary">
                                    <i class="fas fa-store me-2"></i>쇼핑 시작하기
                                </a>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>

        <!-- 총 가격 정보 -->
        <c:if test="${not empty sessionScope.cart}">
            <div class="cart-footer">
                <div class="row">
                    <div class="col-md-6">
                        <p class="mb-0">총 상품 수: <strong>${sessionScope.cart.size()}개</strong></p>
                    </div>
                    <div class="col-md-6 text-end">
                        <c:choose>
                            <c:when test="${not empty requestScope.totalPrice}">
                                <c:set var="totalPrice" value="${requestScope.totalPrice}" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="totalPrice" value="0" />
                                <c:forEach var="product" items="${sessionScope.cart}">
                                    <c:set var="totalPrice" value="${totalPrice + product.p_price}" />
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        <p class="mb-0">총 결제 금액: <span class="total-price">
                            <fmt:formatNumber value="${totalPrice}" pattern="#,###" /> 원</span>
                        </p>
                    </div>
                </div>
            </div>

            <!-- 결제 및 계속 쇼핑하기 버튼 -->
            <div class="d-flex justify-content-between mt-4">
                <a href="controller.jsp?action=MAINPAGE" class="btn btn-outline-primary">
                    <i class="fas fa-arrow-left me-2"></i>쇼핑 계속하기
                </a>
                <a href="controller.jsp?action=CHECKOUT" class="btn btn-success">
                    <i class="fas fa-credit-card me-2"></i>결제하기
                </a>
            </div>
        </c:if>
    </div>
</div>

<!-- Bootstrap JS 및 Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
