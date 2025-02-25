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
                    board.setContent(rs.getString("CONTENT"));
                    board.setCnt(rs.getInt("CNT"));
                    board.setRegdate(rs.getDate("REGDATE"));
                    datas.add(board);
                }
                rs.close();
            }
            else if(boardDTO.getCondition().equals("SELECTALL_SEARCH_TITLE")){
                pstmt = conn.prepareStatement(SELECTALL_SEARCH_TITLE);
                ResultSet rs = pstmt.executeQuery();
                while(rs.next()) {
                    BoardDTO board = new BoardDTO();
                    board.setBnum(rs.getInt("BNUM"));
                    board.setTitle(rs.getString("TITLE"));
                    board.setWriter(rs.getString("WRITER"));
                    board.setContent(rs.getString("CONTENT"));
                    board.setCnt(rs.getInt("CNT"));
                    board.setRegdate(rs.getDate("REGDATE"));
                    datas.add(board);
                }
                rs.close();
            }
            else if(boardDTO.getCondition().equals("SELECTALL_SEARCH_WRITER")){
                pstmt = conn.prepareStatement(SELECTALL_SEARCH_WRITER);
                ResultSet rs = pstmt.executeQuery();
                while(rs.next()) {
                    BoardDTO board = new BoardDTO();
                    board.setBnum(rs.getInt("BNUM"));
                    board.setTitle(rs.getString("TITLE"));
                    board.setWriter(rs.getString("WRITER"));
                    board.setContent(rs.getString("CONTENT"));
                    board.setCnt(rs.getInt("CNT"));
                    board.setRegdate(rs.getDate("REGDATE"));
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

    // 글선택하기
    public BoardDTO selectOne(BoardDTO boardDTO){
        return null;
    }

    // 글작성
    public boolean insert(BoardDTO boardDTO){

        return false;
    }

    // 내용변경
    // 조회수++
    public boolean update(BoardDTO boardDTO){

        return false;
    }

    // 글삭제
    public boolean delete(BoardDTO boardDTO){
        return false;
    }
}
