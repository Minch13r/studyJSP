package webapp.day31.model.dao;

import webapp.day31.model.dto.BoardDTO;

import java.util.ArrayList;

public class BoardDAO {
    final String SELECTALL = "";
    final String SELECTALL_SEARCH_TITLE = "";
    final String SELECTALL_SEARCH_WRITER = "";
    final String SELECTONE = "";
    final String INSERT = "";
    final String UPDATE_CONTENT = "";
    final String UPDATE_CNT = "";
    final String DELETE = "";

    public ArrayList<BoardDTO> selectAll(BoardDTO BoardDTO){
        // 글목록보기
        // 글검색하기
        return null;
    }

    public BoardDTO selectOne(BoardDTO BoardDTO){
        // 글선택하기
        return null;
    }

    public boolean insert(BoardDTO BoardDTO){
        // 글작성
        return false;
    }

    public boolean update(BoardDTO BoardDTO){
        // 내용변경
        // 조회수++
        return false;
    }

    public boolean delete(BoardDTO BoardDTO){
        // 글삭제
        return false;
    }
}
