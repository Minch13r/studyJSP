package webapp.day31.model.dao;


import webapp.day31.model.dto.ReplyDTO;

import java.util.ArrayList;

public class ReplyDAO {
    final String SELECTALL = "SELECT * FROM REPLY";
    final String INSERT = "INSERT INTO REPLY (CONTENT, WRITER, BNUM) VALUES (?, ?, ?)";
    final String UPDATE = "UPDATE REPLY SET CONTENT = ? WHERE RNUM = ?";
    final String DELETE = "DELETE FROM REPLY WHERE RNUM = ?";

    public ArrayList<ReplyDTO> selectAll(ReplyDTO replyDTO){
        // 댓글전체보기
        return null;
    }
    private ReplyDTO selectOne(ReplyDTO replyDTO){
        return null;
    }
    public boolean insert(ReplyDTO replyDTO){
        // 댓글작성
        return false;
    }
    public boolean update(ReplyDTO replyDTO){
        // 댓글내용변경
        return false;
    }
    public boolean delete(ReplyDTO replyDTO){
        // 댓글삭제
        return false;
    }
}
