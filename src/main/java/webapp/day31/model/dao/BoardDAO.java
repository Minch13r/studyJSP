package webapp.day31.model.dao;

import webapp.day31.model.common.JDBCUtil;
import webapp.day31.model.dto.BoardDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
    final String SELECTALL = "SELECT * FROM BOARD";
    final String SELECTALL_SEARCH_TITLE = "SELECT * FROM BOARD WHERE TITLE LIKE CONCAT('%',?,'%')";
    final String SELECTALL_SEARCH_WRITER = "SELECT * FROM BOARD WHERE WRITER LIKE CONCAT('%',?,'%')";
    final String SELECTONE = "SELECT * FROM MEMBER WHERE BNUM = ?";
    final String INSERT = "INSERT INTO BOARD (BNUM, TITLE, WRITER) VALUES (?, ?, ?)";
    final String UPDATE_CONTENT = "UPDATE BOARD SET WRITER = ? WHERE BNUM = ?";
    final String UPDATE_CNT = "UPDATE BOARD SET CNT = CNT + 1 WHERE BNUM = ?";
    final String DELETE = "DELETE FROM BOARD WHERE BNUM = ?";

    // 글목록보기
    // 글검색하기
    public ArrayList<BoardDTO> selectAll(BoardDTO boardDTO){
        ArrayList<BoardDTO> datas = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = JDBCUtil.connect();
            if(boardDTO.getCondition().equals("SELECTALL")){
                pstmt = conn.prepareStatement(SELECTALL);
                ResultSet rs = pstmt.executeQuery();

                while(rs.next()) {
                    BoardDTO board = new BoardDTO();
                    board.setBnum(rs.getInt("BNUM"));
                    board.setTitle(rs.getString("TITLE"));
                    board.setWriter(rs.getString("WRITER"));
                    datas.add(board);
                }
                rs.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
        return datas;
    }
    public BoardDTO selectOne(BoardDTO boardDTO){
        // 글선택하기
        return null;
    }
    public boolean insert(BoardDTO boardDTO){
        // 글작성
        return false;
    }
    public boolean update(BoardDTO boardDTO){
        // 내용변경
        // 조회수++
        return false;
    }
    public boolean delete(BoardDTO boardDTO){
        // 글삭제
        return false;
    }
}
