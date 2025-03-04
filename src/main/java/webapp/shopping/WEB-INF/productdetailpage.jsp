<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="webapp.shopping.model.dto.ProductDTO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상품 상세 정보</title>
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
        .product-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 20px;
        }
        .product-header {
            border-bottom: 1px solid #e9ecef;
            padding-bottom: 20px;
            margin-bottom: 20px;
        }
        .btn-action {
            margin-top: 10px;
            width: 100%;
            border-radius: 5px;
        }
        .product-info-table {
            margin-bottom: 30px;
        }
        .product-info-table td {
            padding: 15px;
            vertical-align: middle;
        }
        .product-info-label {
            background-color: #f1f8ff;
            font-weight: 600;
            width: 30%;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        .action-buttons form {
            flex: 1;
        }
        /* 좋아요 버튼 스타일 */
        .btn-liked {
            background-color: #dc3545;
            color: white;
            border-color: #dc3545;
        }
        .btn-liked:hover {
            background-color: #c82333;
            color: white;
            border-color: #bd2130;
        }
    </style>
</head>

<body>
<div class="container">
    <!-- 상품 상세 헤더 -->
    <div class="product-header text-center">
        <h1 class="display-5 fw-bold text-primary">상품 상세 정보</h1>
        <p class="lead text-muted">상품의 자세한 정보를 확인하세요</p>
    </div>

    <!-- 상품 정보 컨테이너 -->
    <div class="product-container">
        <%
            ProductDTO productDTO = (ProductDTO)request.getAttribute("productDTO");
            System.out.println("상세페이지 로그: " + productDTO);

            // 좋아요 여부 확인 - 간단한 예시 (실제 구현에서는 적절히 수정 필요)
            boolean isLiked = false;

            // 현재 상품이 좋아요 목록에 있는지 확인
            if(session.getAttribute("userName") != null) {
                // 세션에서 사용자 ID 가져오기
                String userId = (String)session.getAttribute("userName");

                // 이 부분은 실제 환경에 맞게 수정 필요
                // 예: DB에서 조회하거나 세션에 저장된 좋아요 목록 확인
                java.util.List<Integer> likedList = (java.util.List<Integer>)session.getAttribute("likedProducts");

                if(likedList != null && productDTO != null) {
                    isLiked = likedList.contains(productDTO.getP_num());
                }
            }
        %>

        <!-- 상품 정보 테이블 -->
        <table class="table table-bordered product-info-table">
            <tr>
                <td class="product-info-label text-center"><i class="fas fa-barcode me-2"></i>상품번호</td>
                <td>${productDTO.p_num}</td>
            </tr>
            <tr>
                <td class="product-info-label text-center"><i class="fas fa-tag me-2"></i>상품이름</td>
                <td class="fw-bold fs-5">${productDTO.p_name}</td>
            </tr>
            <tr>
                <td class="product-info-label text-center"><i class="fas fa-won-sign me-2"></i>상품가격</td>
                <td class="text-danger fw-bold">${productDTO.p_price}원</td>
            </tr>
            <tr>
                <td class="product-info-label text-center"><i class="fas fa-boxes me-2"></i>상품재고</td>
                <td>
                    <% if (productDTO.getP_stock() > 10) { %>
                    <span class="badge bg-success">${productDTO.p_stock}개 남음</span>
                    <% } else if (productDTO.getP_stock() > 0) { %>
                    <span class="badge bg-warning text-dark">품절임박! ${productDTO.p_stock}개 남음</span>
                    <% } else { %>
                    <span class="badge bg-danger">품절</span>
                    <% } %>
                </td>
            </tr>
            <tr>
                <td class="product-info-label text-center"><i class="fas fa-info-circle me-2"></i>상품설명</td>
                <td>${productDTO.p_description}</td>
            </tr>
        </table>

        <!-- 로그인 사용자를 위한 액션 버튼 -->
        <% if(session.getAttribute("userName") != null) { %>
        <div class="action-buttons">
            <form action="controller.jsp" method="post" class="d-inline">
                <input type="hidden" name="action" value="ADDCART">
                <input type="hidden" name="p_num" value="${productDTO.p_num}">
                <button type="submit" class="btn btn-primary btn-action">
                    <i class="fas fa-shopping-cart me-2"></i>장바구니 추가
                </button>
            </form>

            <form action="controller.jsp" method="post" class="d-inline">
                <% if(isLiked) { %>
                <input type="hidden" name="action" value="UNLIKEPRODUCT">
                <input type="hidden" name="p_num" value="${productDTO.p_num}">
                <button type="submit" class="btn btn-liked btn-action">
                    <i class="fas fa-heart me-2"></i>좋아요 취소
                </button>
                <% } else { %>
                <input type="hidden" name="action" value="LIKEPRODUCT">
                <input type="hidden" name="p_num" value="${productDTO.p_num}">
                <button type="submit" class="btn btn-outline-danger btn-action">
                    <i class="far fa-heart me-2"></i>좋아요
                </button>
                <% } %>
            </form>
        </div>
        <% } else { %>
        <div class="alert alert-warning mt-3" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i>
            장바구니 추가 및 좋아요 기능을 사용하시려면 로그인이 필요합니다.
        </div>
        <% } %>

        <!-- 메인으로 돌아가기 버튼 -->
        <div class="text-center mt-4">
            <a href="controller.jsp?action=MAINPAGE" class="btn btn-success">
                <i class="fas fa-home me-2"></i>메인으로 돌아가기
            </a>
        </div>
    </div>
</div>

<!-- Bootstrap JS 및 Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
