package webapp.day31.model.dto;

import java.util.Date;

public class ReplyDTO {
    private int rnum; // PK
    private String content;
    private String writer; // FK
    private Date regdate;
    private int bnum; // FK



    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRnum() {
        return rnum;
    }

    public void setRnum(int rnum) {
        this.rnum = rnum;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public int getBnum() {
        return bnum;
    }

    public void setBnum(int bnum) {
        this.bnum = bnum;
    }

    @Override
    public String toString() {
        return "ReplyDTO{" +
                "rnum=" + rnum +
                ", content='" + content + '\'' +
                ", writer='" + writer + '\'' +
                ", regdate=" + regdate +
                ", bnum=" + bnum +
                '}';
    }
}
