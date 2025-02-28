package webapp.shopping.model.dto;

import java.util.Date;

// 회원 DTO
public class MemberDTO {
    // 회원 ID
    private String m_id;

    // 회원 비밀번호
    private String m_pw;

    // 회원 이름
    private String m_name;

    // 회원 이메일
    private String m_mail;

    // 회원 전화번호
    private String m_phone;

    // 회원 가입일
    private Date m_regdate;

    // 회원 등급
    private String m_role;

    // 컨디션
    private String condition;

    // SearchKeyword
    private String searchKeyword;

    public String getM_id() {
        return m_id;
    }

    public void setM_id(String m_id) {
        this.m_id = m_id;
    }

    public String getM_pw() {
        return m_pw;
    }

    public void setM_pw(String m_pw) {
        this.m_pw = m_pw;
    }

    public String getM_name() {
        return m_name;
    }

    public void setM_name(String m_name) {
        this.m_name = m_name;
    }

    public String getM_mail() {
        return m_mail;
    }

    public void setM_mail(String m_mail) {
        this.m_mail = m_mail;
    }

    public String getM_phone() {
        return m_phone;
    }

    public void setM_phone(String m_phone) {
        this.m_phone = m_phone;
    }

    public Date getM_regdate() {
        return m_regdate;
    }

    public void setM_regdate(Date m_regdate) {
        this.m_regdate = m_regdate;
    }

    public String getM_role() {
        return m_role;
    }

    public void setM_role(String m_role) {
        this.m_role = m_role;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }

    @Override
    public String toString() {
        return "MemberDTO{" +
                "m_id='" + m_id + '\'' +
                ", m_pw='" + m_pw + '\'' +
                ", m_name='" + m_name + '\'' +
                ", m_mail='" + m_mail + '\'' +
                ", m_phone='" + m_phone + '\'' +
                ", m_regdate=" + m_regdate +
                ", m_role='" + m_role + '\'' +
                ", condition='" + condition + '\'' +
                ", searchKeyword='" + searchKeyword + '\'' +
                '}';
    }
}
