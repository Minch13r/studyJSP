package webapp.shopping.model.dao;


import webapp.shopping.model.common.JDBCUtil;
import webapp.shopping.model.dto.LikeDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class LikeDAO {
    final String INSERT = "INSERT INTO LIKES (MEMBER_ID, PRODUCT_NUM) VALUES (?,?)";
    Connection conn = null;
    PreparedStatement pstmt = null;

    public ArrayList<LikeDTO> selectAll() {
        return null;
    }

    // X
    public LikeDTO selectOne(LikeDTO likeDTO) {
        return null;
    }

    // 좋아요 누르기
    public boolean insert(LikeDTO likeDTO) {
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(INSERT);
            pstmt.setString(1, likeDTO.getL_m_id());
            pstmt.setInt(2, likeDTO.getL_p_num());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (Exception e){
            e.printStackTrace();
            return false;
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
    }

    // 사용 X
    public boolean update(LikeDTO likeDTO) {
        return false;
    }

    // 사용 X
    public boolean delete(LikeDTO likeDTO) {
        return false;
    }
}
