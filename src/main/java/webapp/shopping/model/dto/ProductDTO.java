package webapp.shopping.model.dto;

import java.util.Date;

public class ProductDTO {
    private int p_num;            //상품 번호 pk
    private String p_name;         //상품 이름
    private String p_description;  //상품 설명
    private int p_price;           //상품 가격
    private int p_stock;           //상품 재고
    private Date p_regdate;        //상품 등록 날짜
    private String m_id;           //회원 아이디
    private int likes;           //좋아요 갯수


    // 컨디션
    private String condition;

    // SearchKeyword
    private String searchKeyword;


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
    public int getP_num() {
        return p_num;
    }
    public void setP_num(int p_num) {
        this.p_num = p_num;
    }
    public String getP_name() {
        return p_name;
    }
    public void setP_name(String p_name) {
        this.p_name = p_name;
    }
    public String getP_description() {
        return p_description;
    }
    public void setP_description(String p_description) {
        this.p_description = p_description;
    }
    public int getP_price() {
        return p_price;
    }
    public void setP_price(int p_price) {
        this.p_price = p_price;
    }
    public int getP_stock() {
        return p_stock;
    }
    public void setP_stock(int p_stock) {
        this.p_stock = p_stock;
    }
    public Date getP_regdate() {
        return p_regdate;
    }
    public void setP_regdate(Date p_regdate) {
        this.p_regdate = p_regdate;
    }
    public int getLikes() {
        return likes;
    }
    public void setLikes(int likes) {
        this.likes = likes;
    }
    public String getM_id() {
        return m_id;
    }
    public void setM_id(String m_id) {
        this.m_id = m_id;
    }
    @Override
    public String toString() {
        return "ProductDTO [p_num=" + p_num + ", p_name=" + p_name + ", p_description=" + p_description + ", p_price="
                + p_price + ", p_stock=" + p_stock + ", p_regdate=" + p_regdate + ", m_id=" + m_id + ", condition="
                + condition + ", searchKeyword=" + searchKeyword + "]";
    }
}
