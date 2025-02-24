package webapp.day31.model.dto;

import java.util.Date;

public class MemberDTO {
    private String mid; // PK
    private String password;
    private String name;
    private Date regdate;

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    @Override
    public String toString() {
        return "MemberDTO{" +
                "mid='" + mid + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", regdate='" + regdate + '\'' +
                '}';
    }
}
