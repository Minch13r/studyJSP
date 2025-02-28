package webapp.shopping.model.dao;



import webapp.shopping.model.common.JDBCUtil;
import webapp.shopping.model.dto.MemberDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
    final String SELECTONE = "SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PASSWORD = ?";
    final String INSERT = "INSERT INTO MEMBER (MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_MAIL, MEMBER_PHONE) VALUES (?, ?, ?, ?, ?)";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // 사용 X
    public ArrayList<MemberDTO> selectAll() {
        return null;
    }

    // 로그인
    public MemberDTO selectOne(MemberDTO memberDTO) {
        MemberDTO data = null;
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(SELECTONE);
            pstmt.setString(1, memberDTO.getM_id());
            pstmt.setString(2, memberDTO.getM_pw());
            rs = pstmt.executeQuery();

            if(rs.next()) {
                data = new MemberDTO();
                data.setM_id(rs.getString("MEMBER_ID"));
                data.setM_pw(rs.getString("MEMBER_PASSWORD"));
                data.setM_name(rs.getString("MEMBER_NAME"));
                data.setM_mail(rs.getString("MEMBER_MAIL"));
                data.setM_phone(rs.getString("MEMBER_PHONE"));
                data.setM_regdate(rs.getDate("MEMBER_REGDATE"));
                data.setM_role(rs.getString("MEMBER_ROLE"));
            }
            return data;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
    }

    // 회원가입
    public boolean insert(MemberDTO memberDTO) {
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(INSERT);
            pstmt.setString(1, memberDTO.getM_id());
            pstmt.setString(2, memberDTO.getM_pw());
            pstmt.setString(3, memberDTO.getM_name());
            pstmt.setString(4, memberDTO.getM_mail());
            pstmt.setString(5, memberDTO.getM_phone());
            //pstmt.executeUpdate();
            int result = pstmt.executeUpdate();
            System.out.println("insert 로그:"+result);
            return result > 0;
        } catch (Exception e){
            e.printStackTrace();
            return false;
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
    }

    // 사용 X
    public boolean update(MemberDTO memberDTO) {
        return false;
    }

    // 사용 X
    public boolean delete(MemberDTO memberDTO) {
        return false;
    }
}
