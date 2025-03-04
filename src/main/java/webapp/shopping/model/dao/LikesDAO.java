package webapp.shopping.model.dao;


import webapp.shopping.model.common.JDBCUtil;
import webapp.shopping.model.dto.LikesDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class LikesDAO {
    final String SELECTONE = "SELECT * FROM LIKES WHERE MEMBER_ID = ? AND PRODUCT_NUM = ?;";
    final String INSERT = "INSERT INTO LIKES (MEMBER_ID, PRODUCT_NUM) VALUES (?,?)";
    Connection conn = null;
    PreparedStatement pstmt = null;

    // X
    public ArrayList<LikesDTO> selectAll(LikesDTO likeDTO) {

        return null;
    }

    // 좋아요 중복 검사
    public LikesDTO selectOne(LikesDTO likeDTO) {
        LikesDTO data = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(SELECTONE);
            pstmt.setString(1, likeDTO.getL_m_id());   // 아이디
            pstmt.setInt(2, likeDTO.getL_p_num());     // 좋아요 고유 번호
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                data = new LikesDTO();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }

        return data; // 좋아요가 없으면 null 반환
    }

    // 좋아요 누르기
    public boolean insert(LikesDTO likeDTO) {
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(INSERT);
            pstmt.setString(1, likeDTO.getL_m_id());
            pstmt.setInt(2, likeDTO.getL_p_num());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
    }

    // 사용 X
    public boolean update(LikesDTO likeDTO) {
        return false;
    }

    // 사용 X
    public boolean delete(LikesDTO likeDTO) {
        return false;
    }
}
