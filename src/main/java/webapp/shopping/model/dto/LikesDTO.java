package webapp.shopping.model.dto;

import java.util.Date;

public class LikesDTO {
    // 좋아요 번호
    private String l_num; // pk

    // 회원 아이디
    private String l_m_id; // fk

    // 상품번호
    private int l_p_num; // fk

    // 좋아요 누른 시간
    private Date l_date;

    public String getL_num() {
        return l_num;
    }

    public void setL_num(String l_num) {
        this.l_num = l_num;
    }

    public int getL_p_num() {
        return l_p_num;
    }

    public void setL_p_num(int l_p_num) {
        this.l_p_num = l_p_num;
    }

    public String getL_m_id() {
        return l_m_id;
    }

    public void setL_m_id(String l_m_id) {
        this.l_m_id = l_m_id;
    }

    public Date getL_date() {
        return l_date;
    }

    public void setL_date(Date l_date) {
        this.l_date = l_date;
    }

    @Override
    public String toString() {
        return "LikeDTO{" + "l_num='" + l_num + '\'' +
                ", l_m_id='" + l_m_id + '\'' +
                ", l_p_num='" + l_p_num + '\'' +
                ", l_date=" + l_date +
                '}';
    }
}

