package webapp.day31.model.dao;


import webapp.day31.model.common.JDBCUtil;
import webapp.day31.model.dto.ReplyDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyDAO {
    final String SELECTALL = "SELECT * FROM REPLY WHERE BNUM = ?";
    final String INSERT = "INSERT INTO REPLY (CONTENT,WRITER,BNUM) VALUES(?,?,?)";
    final String UPDATE = "UPDATE REPLY SET CONTENT = ? WHERE RNUM = ? AND BNUM = ?";
    final String DELETE = "DELETE FROM REPLY WHERE RNUM = ? AND BNUM = ?";

    Connection conn = null;
    PreparedStatement pstmt = null;

    // 댓글전체보기
    public ArrayList<ReplyDTO> selectAll(ReplyDTO replyDTO) {
        ArrayList<ReplyDTO> datas = new ArrayList<>();
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(SELECTALL);
            pstmt.setInt(1, replyDTO.getBnum()); // 게시글 번호로 필터링
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ReplyDTO dto = new ReplyDTO();
                dto.setRnum(rs.getInt("RNUM"));
                dto.setContent(rs.getString("CONTENT"));
                dto.setWriter(rs.getString("WRITER"));
                dto.setRegdate(rs.getDate("REGDATE"));
                dto.setBnum(rs.getInt("BNUM"));
                datas.add(dto);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
        return datas;
    }

    // selectOne은 사용할 곳이 없어서 구현 X
    private ReplyDTO selectOne(ReplyDTO replyDTO){
        return null;
    }

    // 댓글작성
    public boolean insert(ReplyDTO replyDTO){
        try {
            conn=JDBCUtil.connect();
            pstmt=conn.prepareStatement(INSERT);
            pstmt.setString(1, replyDTO.getContent());
            pstmt.setString(2, replyDTO.getWriter());
            pstmt.setInt(3, replyDTO.getBnum());
            int rs=pstmt.executeUpdate();
            if(rs<=0) {
                return false;
            }
        }catch(Exception e) {
            e.printStackTrace();
            return false;
        }finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
        return true;
    }

    // 댓글내용변경
    public boolean update(ReplyDTO replyDTO){
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(UPDATE);
            pstmt.setString(1, replyDTO.getContent());
            pstmt.setInt(2, replyDTO.getRnum());
            pstmt.setInt(3, replyDTO.getBnum());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (Exception e){
            e.printStackTrace();
            return false;
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
    }


    // 댓글삭제
    public boolean delete(ReplyDTO replyDTO){
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(DELETE);
            pstmt.setInt(1, replyDTO.getRnum());
            pstmt.setInt(2, replyDTO.getBnum());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (Exception e){
            e.printStackTrace();
            return false;
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
    }
}
