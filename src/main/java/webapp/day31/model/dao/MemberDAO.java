package webapp.day31.model.dao;

import webapp.day31.model.common.JDBCUtil;
import webapp.day31.model.dto.MemberDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
    final String SELECTALL = "SELECT * FROM MEMBER";
    final String SELECTONE = "SELECT * FROM MEMBER WHERE MID = ? AND PASSWORD = ?";
    final String INSERT = "INSERT INTO MEMBER (MID, PASSWORD, NAME) VALUES (?, ?, ?)";
    final String UPDATE = "UPDATE MEMBER SET NAME = ? WHERE MID = ?";
    final String DELETE = "DELETE FROM MEMBER WHERE MID = ?";

    public ArrayList<MemberDTO> selectAll(MemberDTO memberDTO){
        // 신규회원목록보기
        return null;
    }
    // 로그인 & 로그아웃
    public MemberDTO selectOne(MemberDTO memberDTO){
        MemberDTO data = null;
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn=JDBCUtil.connect();
            pstmt=conn.prepareStatement(SELECTONE);
            pstmt.setString(1, memberDTO.getMid());
            pstmt.setString(2, memberDTO.getPassword());
            ResultSet rs = pstmt.executeQuery() ;
            if(rs.next()){
                data = new MemberDTO();
                data.setMid(rs.getString("MID"));
                data.setPassword(rs.getString("PASSWORD"));
                data.setName(rs.getString("NAME"));
                data.setRegdate(rs.getDate("REGDATE"));
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
        return data;
    }
    public boolean insert(MemberDTO memberDTO){
        // 회원가입
        return false;
    }
    public boolean update(MemberDTO memberDTO){
        // 이름변경
        return false;
    }
    public boolean delete(MemberDTO memberDTO){
        // 회원탈퇴
        return false;
    }
}
