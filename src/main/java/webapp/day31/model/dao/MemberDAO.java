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
    final String SELECTONE_MID = "SELECT * FROM MEMBER WHERE MID=?";
    final String INSERT = "INSERT INTO MEMBER (MID, PASSWORD, NAME) VALUES (?, ?, ?)";
    final String UPDATE = "UPDATE MEMBER SET NAME = ? WHERE MID = ?";
    final String DELETE = "DELETE FROM MEMBER WHERE MID = ?";

    MemberDTO data = null;
    Connection conn = null;
    PreparedStatement pstmt = null;

    // 신규회원목록보기
    public ArrayList<MemberDTO> selectAll(MemberDTO memberDTO) {
        ArrayList<MemberDTO> datas = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(SELECTALL);
            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {
                MemberDTO member = new MemberDTO();
                member.setMid(rs.getString("MID"));
                member.setPassword(rs.getString("PASSWORD"));
                member.setName(rs.getString("NAME"));
                member.setRegdate(rs.getDate("REGDATE"));
                datas.add(member);
            }
            rs.close();
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }

        return datas;
    }

    // 로그인 & 로그아웃
    public MemberDTO selectOne(MemberDTO memberDTO){
        MemberDTO data=null;
        Connection conn=null;
        PreparedStatement pstmt=null;
        try {
            conn=JDBCUtil.connect();
            if(memberDTO.getCondition().equals("LOGIN")) {
                pstmt=conn.prepareStatement(SELECTONE);
                pstmt.setString(1, memberDTO.getMid());
                pstmt.setString(2, memberDTO.getPassword());
            }
            else if(memberDTO.getCondition().equals("MYPAGE")) {
                pstmt=conn.prepareStatement(SELECTONE_MID);
                pstmt.setString(1, memberDTO.getMid());
            }
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()) {
                data = new MemberDTO();
                data.setMid(rs.getString("MID"));
                data.setPassword(rs.getString("PASSWORD"));
                data.setName(rs.getString("NAME"));
                data.setRegdate(rs.getDate("REGDATE"));
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
        return data;
    }

    // 회원가입
    public boolean insert(MemberDTO memberDTO) {
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(INSERT);
            pstmt.setString(1, memberDTO.getMid());
            pstmt.setString(2, memberDTO.getPassword());
            pstmt.setString(3, memberDTO.getName());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
    }


    // 이름변경
    public boolean update(MemberDTO memberDTO) {
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(UPDATE);
            pstmt.setString(1, memberDTO.getName());
            pstmt.setString(2, memberDTO.getMid());

            // executeUpdate()는 변경된 행의 수를 반환합니다
            int result = pstmt.executeUpdate();

            // 하나 이상의 행이 변경되었다면 true 반환
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
    }

    // 회원탈퇴
    public boolean delete(MemberDTO memberDTO){
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(DELETE);
            pstmt.setString(1, memberDTO.getMid());

            int result = pstmt.executeUpdate();

            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
    }
}
