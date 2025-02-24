package webapp.day31.model.dto;

import java.util.Date;

public class BoardDTO {
    private int bnum; // PK
    private String title;
    private String content;
    private String writer; // FK
    private int cnt;

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getBnum() {
        return bnum;
    }

    public void setBnum(int bnum) {
        this.bnum = bnum;
    }

    private Date regdate;

    @Override
    public String toString() {
        return "BoardDTO{" +
                "bnum=" + bnum +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", writer='" + writer + '\'' +
                ", cnt=" + cnt +
                ", regdate=" + regdate +
                '}';
    }
}
