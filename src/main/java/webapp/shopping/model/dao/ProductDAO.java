package webapp.shopping.model.dao;

import webapp.shopping.model.common.JDBCUtil;
import webapp.shopping.model.dto.ProductDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


// 아직 DB연결 안됨 

public class ProductDAO {
    final String SELECTALL = "SELECT * FROM PRODUCT ORDER BY PRODUCT_NUM DESC"; // 상품 전체 목록 (상품번호 내림차순)
    final String SELECTALL_SEARCH_HIGH_PRICE = "SELECT * FROM PRODUCT ORDER BY PRODUCT_PRICE DESC"; // 가격 높은 순 정렬
    final String SELECTALL_SEARCH_LOW_PRICE = "SELECT * FROM PRODUCT ORDER BY PRODUCT_PRICE ASC"; // 가격 낮은 순 정렬
    // 회원이 좋아요한 상품 조회
    final String SELECTALL_LIKED_PRODUCTS_BY_MEMBER = "SELECT P.* FROM PRODUCT P INNER JOIN LIKES L ON L.PRODUCT_NUM = P.PRODUCT_NUM INNER JOIN MEMBER M ON M.MEMBER_ID = L.MEMBER_ID WHERE M.MEMBER_ID = ? ORDER BY P.PRODUCT_NUM ASC;";
    // 상품별 좋아요 순위
    final String SELECTALL_HEART_LANKING = "SELECT P.PRODUCT_NUM, P.PRODUCT_NAME, P.PRODUCT_DESCRIPTION, P.PRODUCT_PRICE, P.PRODUCT_STOCK, P.PRODUCT_REGDATE, COUNT(L.LIKE_NUM) AS `좋아요 개수` FROM PRODUCT P " +
            "LEFT JOIN LIKES L ON L.PRODUCT_NUM = P.PRODUCT_NUM GROUP BY P.PRODUCT_NUM ORDER BY `좋아요 개수` DESC";

    final String SELECTONE = "SELECT * FROM PRODUCT WHERE PRODUCT_NUM = ?"; // 특정 상품 조회
    final String INSERT = "INSERT INTO PRODUCT (PRODUCT_NAME,PRODUCT_DESCRIPTION,PRODUCT_PRICE,PRODUCT_STOCK) VALUE(?,?,?,?)";

    public ArrayList<ProductDTO> selectAll(ProductDTO productDTO) {
        ArrayList<ProductDTO> datas = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        System.out.println("ProductDAO 로그:");
        System.out.println(productDTO.getCondition());
        System.out.println(productDTO.getM_id());
        try {
            conn = JDBCUtil.connect();
            // 만약, 상품 전체 출력이라면
            if (productDTO.getCondition().equals("SELECTALL"))
                pstmt = conn.prepareStatement(SELECTALL);
                // 만약, 상품이 가격 높은 순 이라면?(내림차순)
            else if (productDTO.getCondition().equals("SELECTALL_SEARCH_HIGH_PRICE")) {
                pstmt = conn.prepareStatement(SELECTALL_SEARCH_HIGH_PRICE);

            }
            // 만약, 상품이 가격 낮은 순 이라면?(올림차순)
            else if (productDTO.getCondition().equals("SELECTALL_SEARCH_LOW_PRICE")) {
                pstmt = conn.prepareStatement(SELECTALL_SEARCH_LOW_PRICE);
            }

            // 인기순 정렬
            else if (productDTO.getCondition().equals("SELECTALL_HEART_LANKING")) {
                pstmt = conn.prepareStatement(SELECTALL_HEART_LANKING);
                ResultSet rs = pstmt.executeQuery();
            }

            // 회원이 좋아요한 상품 조회
            else if (productDTO.getCondition().equals("SELECTALL_LIKED_PRODUCTS_BY_MEMBER")) {
                pstmt = conn.prepareStatement(SELECTALL_LIKED_PRODUCTS_BY_MEMBER);
                pstmt.setString(1, productDTO.getM_id()); // MEMBER_ID를 파라미터로 설정
            }

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductDTO data = new ProductDTO();
                data.setP_num(rs.getInt("PRODUCT_NUM")); // 상품 번호
                data.setP_name(rs.getString("PRODUCT_NAME")); // 상품이름
                data.setP_description(rs.getString("PRODUCT_DESCRIPTION")); // 상품 설명
                data.setP_price(rs.getInt("PRODUCT_PRICE")); // 상품 가격
                data.setP_stock(rs.getInt("PRODUCT_STOCK")); // 상품 재고
                data.setP_regdate(rs.getDate("PRODUCT_REGDATE")); // 등록 날짜
                if (productDTO.getCondition().equals("SELECTALL_HEART_LANKING")) {
                    data.setLikes(rs.getInt("좋아요 개수"));
                }

                datas.add(data);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
        return datas;
    }

    public ProductDTO selectOne(ProductDTO productDTO) {
        ProductDTO data = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(SELECTONE);
            pstmt.setInt(1, productDTO.getP_num());


            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) { //
                data = new ProductDTO();
                data.setP_num(rs.getInt("PRODUCT_NUM")); // 상품 번호
                data.setP_name(rs.getString("PRODUCT_NAME")); // 상품이름
                data.setP_description(rs.getString("PRODUCT_DESCRIPTION")); // 상품 설명
                data.setP_price(rs.getInt("PRODUCT_PRICE")); // 상품 가격
                data.setP_stock(rs.getInt("PRODUCT_STOCK")); // 상품 재고
                data.setP_regdate(rs.getDate("PRODUCT_REGDATE"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
        return data;
    }


    // 관리자 상품 추가 하기
    public boolean insert(ProductDTO productDTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = JDBCUtil.connect();

            pstmt = conn.prepareStatement(INSERT);
            pstmt.setString(1, productDTO.getP_name());
            pstmt.setInt(2, productDTO.getP_price());
            pstmt.setInt(3, productDTO.getP_stock());
            pstmt.setString(4, productDTO.getP_description());

            int result = pstmt.executeUpdate();
            if (result <= 0) {
                return false;
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
    }

    public boolean update(ProductDTO productDTO) {
        return false;

    }

    public boolean delete(ProductDTO productDTO) {
        return false;

    }
}
