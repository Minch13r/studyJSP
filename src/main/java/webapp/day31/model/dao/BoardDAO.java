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
    final String SELECTONE = "SELECT * FROM BOARD WHERE BNUM = ?";
    final String INSERT = "INSERT INTO BOARD (TITLE, CONTENT, WRITER) VALUES (?, ?, ?)";
    final String UPDATE_CONTENT = "UPDATE BOARD SET CONTENT = ? WHERE BNUM = ?";
    final String UPDATE_CNT = "UPDATE BOARD SET CNT = CNT + 1 WHERE BNUM = ?";
    final String DELETE = "DELETE FROM BOARD WHERE BNUM = ?";

    Connection conn = null;
    PreparedStatement pstmt = null;

    // 글목록보기
    // 글검색하기
    public ArrayList<BoardDTO> selectAll(BoardDTO boardDTO){
        ArrayList<BoardDTO> datas = new ArrayList<>();
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
                pstmt.setString(1, boardDTO.getTitle());
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
                pstmt.setString(1, boardDTO.getWriter());
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

    // 글 선택하기
    public BoardDTO selectOne(BoardDTO boardDTO){
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(SELECTONE);
            pstmt.setInt(1, boardDTO.getBnum());
            ResultSet rs = pstmt.executeQuery();

            if(rs.next()) {
                BoardDTO board = new BoardDTO();
                board.setBnum(rs.getInt("BNUM"));
                board.setTitle(rs.getString("TITLE"));
                board.setWriter(rs.getString("WRITER"));
                board.setContent(rs.getString("CONTENT"));
                board.setCnt(rs.getInt("CNT"));
                board.setRegdate(rs.getDate("REGDATE"));
                return board;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
        return null;
    }


    // 글작성
    public boolean insert(BoardDTO boardDTO){
        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(INSERT);
            pstmt.setString(1, boardDTO.getTitle());
            pstmt.setString(2, boardDTO.getContent());
            pstmt.setString(3, boardDTO.getWriter());
            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (Exception e){
            e.printStackTrace();
            return false;
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
    }


    // 내용변경
    // 조회수++
    public boolean update(BoardDTO boardDTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBCUtil.connect();

            if(boardDTO.getCondition().equals("UPDATE_CONTENT")) {
                pstmt = conn.prepareStatement(UPDATE_CONTENT);
                pstmt.setString(1, boardDTO.getContent());
                pstmt.setInt(2, boardDTO.getBnum());
            }
            else if(boardDTO.getCondition().equals("UPDATE_CNT")) {
                pstmt = conn.prepareStatement(UPDATE_CNT);
                pstmt.setInt(1, boardDTO.getBnum());
            }

            int result = pstmt.executeUpdate();
            return result > 0; // 업데이트된 행이 있으면 true 반환

        } catch(Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            JDBCUtil.disconnect(conn, pstmt);
        }
    }


    // 글삭제
    public boolean delete(BoardDTO boardDTO) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = JDBCUtil.connect();
            pstmt = conn.prepareStatement(DELETE);
            pstmt.setInt(1, boardDTO.getBnum());
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
