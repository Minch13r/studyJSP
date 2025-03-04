<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="webapp.shopping.model.dto.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <style>
        .product-container {
            background-color: #f8f9fa;
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .product-header {
            background-color: #6c757d;
            color: white;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .table-hover tbody tr:hover {
            background-color: rgba(0, 123, 255, 0.1);
            cursor: pointer;
        }

        .product-link {
            color: #0d6efd;
            text-decoration: none;
            font-weight: 500;
        }

        .product-link:hover {
            text-decoration: underline;
        }

        .sort-form {
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 5px;
            margin-top: 15px;
        }

        .likes-badge {
            background-color: #dc3545;
            color: white;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 0.8rem;
        }
    </style>
    <script>
        function sort() {
            // 선택된 정렬 조건
            var condition = $('#sortList').val();

            // 폼 데이터 직렬화 (필요한 경우, 필요한 값만 직렬화)
            var formData = $('#sortForm').serialize();

            // Ajax 비동기 요청
            $.ajax({
                url: 'sortListServlet',  // 서블릿 URL
                type: 'GET',
                data: formData,  // 폼 데이터 전송
                success: function(response) {
                    // 상품 목록을 동적으로 갱신
                    $('#productList').html(response);
                },
                error: function(xhr, status, error) {
                    alert("오류 발생: " + error);
                }
            });
        }
    </script>
</head>
<body>

<% if(session.getAttribute("userName") == null) {%>
<%--로그아웃 상태일 떄 --%>
<div id="logout" class="container mt-5">
    <form action="controller.jsp" method="POST">
        <input type="hidden" name="action" value="LOGIN">
        <table class="table table-bordered">
            <tr>
                <td product-info-label text-center><i class="fas fa-barcode me-2"></i>아이디</td>
                <td><input type="text" name="m_id" class="form-control" required></td>
            </tr>
            <tr>
                <td product-info-label text-center><i class="fas fa-barcode me-2"></i>비밀번호</td>
                <td><input type="password" name="m_pw" class="form-control" required></td>
            </tr>
            <tr>
                <td colspan="2" align="right"><input type="submit" class="btn btn-primary"value="로그인">&nbsp;<a href="controller.jsp?action=REGPAGE" class="btn btn-success">회원가입</a></td>
            </tr>
        </table>
    </form>
</div>

<% }else{ %>
<%--로그인 상태일 떄 --%>
<div id="login" class="container mt-5">
    <div class="card shadow border-0">
        <div class="card-body">
            <%if(session.getAttribute("role").equals("admin")) {%>
            <div class="alert alert-primary mb-3 d-flex align-items-center" role="alert">
                <i class="bi bi-shield-lock-fill me-2"></i>
                <strong>[${role}]</strong> 관리자 계정으로 로그인하셨습니다
            </div>
            <%} %>

            <div class="text-center mb-4">
                <h4 class="fw-bold">${userName} 님</h4>
                <p class="text-muted">환영합니다</p>
            </div>

            <div class="list-group list-group-flush">
                <a href="controller.jsp?action=SHOPPINGCART" class="list-group-item list-group-item-action d-flex align-items-center py-3">
                    <i class="bi bi-cart me-3 text-primary"></i>
                    <span>내 장바구니</span>
                    <i class="bi bi-chevron-right ms-auto"></i>
                </a>
                <a href="controller.jsp?action=LIKEPAGE" class="list-group-item list-group-item-action d-flex align-items-center py-3">
                    <i class="bi bi-heart me-3 text-danger"></i>
                    <span>좋아요 목록</span>
                    <i class="bi bi-chevron-right ms-auto"></i>
                </a>
                <%if(session.getAttribute("role").equals("admin")) {%>
                <a href="controller.jsp?action=ADDPRODUCTPAGE" class="list-group-item list-group-item-action d-flex align-items-center py-3">
                    <i class="bi bi-plus-circle me-3 text-success"></i>
                    <span>상품 추가</span>
                    <i class="bi bi-chevron-right ms-auto"></i>
                </a>
                <%} %>
            </div>

            <div class="mt-4 text-center">
                <a href="controller.jsp?action=LOGOUT" class="btn btn-outline-danger px-4">
                    <i class="bi bi-box-arrow-right me-2"></i>로그아웃
                </a>
            </div>
        </div>
    </div>
</div>
<% } %>

<br><hr><br>

<div class="container product-container">
    <div class="product-header">
        <h3 class="mb-0"><i class="bi bi-box-seam me-2"></i>상품목록</h3>
    </div>

    <!-- 정렬 폼 -->
    <div class="sort-form mb-3">
        <form id="sortForm" onsubmit="sort()" class="row g-3 align-items-center">
            <div class="col-auto">
                <label for="sortList" class="col-form-label fw-bold">정렬 방식:</label>
            </div>
            <div class="col-auto">
                <input type="hidden" name="action" value="MAINPAGE">
                <select id="sortList" name="condition" class="form-select">
                    <option value="SELECTALL_HEART_LANKING">인기순</option>
                    <option value="SELECTALL_SEARCH_HIGH_PRICE">가격높은순</option>
                    <option value="SELECTALL_SEARCH_LOW_PRICE">가격낮은순</option>
                </select>
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-sort-down me-1"></i>정렬
                </button>
            </div>
        </form>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-dark">
            <tr class="text-center">
                <th>상품 번호</th>
                <th>상품 명</th>
                <th>가격</th>
                <th>재고</th>
                <th>등록날짜</th>
                <th>좋아요</th>
            </tr>
            </thead>
            <tbody>
            <%
                if(request.getAttribute("productDatas") == null) {
            %>
            <tr class="text-center">
                <td colspan="6" class="py-3 text-muted">
                    <i class="bi bi-exclamation-circle me-2"></i>상품이 없습니다!
                </td>
            </tr>
            <%
            } else {
                for(ProductDTO data : (ArrayList<ProductDTO>)request.getAttribute("productDatas")) {
            %>
            <tr class="text-center">
                <td><%= data.getP_num() %></td>
                <td>
                    <a href="controller.jsp?action=PRODUCTDETAILPAGE&p_num=<%= data.getP_num() %>" class="product-link">
                        <%= data.getP_name() %>
                    </a>
                </td>
                <td class="fw-bold"><%= String.format("%,d원", data.getP_price()) %></td>
                <td>
                    <% if(data.getP_stock() > 0) { %>
                    <span class="badge bg-success"><%= data.getP_stock() %>개</span>
                    <% } else { %>
                    <span class="badge bg-danger">품절</span>
                    <% } %>
                </td>
                <td><%= data.getP_regdate() %></td>
                <td>
                        <span class="likes-badge">
                            <i class="bi bi-heart-fill me-1"></i><%= data.getLikes() %>
                        </span>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS 및 Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

