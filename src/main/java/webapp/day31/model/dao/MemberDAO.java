package webapp.day31.model.dao;

import webapp.day31.model.dto.MemberDTO;

import java.util.ArrayList;

public class MemberDAO {
    final String SELECTALL = "SELECT * FROM MEMBER";
    final String SELECTONE = "SELECT * FROM MEMBER WHERE MID = ?";
    final String INSERT = "INSERT INTO MEMBER (MID, PASSWORD, NAME) VALUES (?, ?, ?)";
    final String UPDATE = "UPDATE MEMBER SET NAME = ? WHERE MID = ?";
    final String DELETE = "DELETE FROM MEMBER WHERE MID = ?";

    public ArrayList<MemberDTO> selectAll(MemberDTO memberDTO){
        // 신규회원목록보기
        return null;
    }
    public MemberDTO selectOne(MemberDTO memberDTO){
        // 로그인 & 로그아웃
        return null;
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
