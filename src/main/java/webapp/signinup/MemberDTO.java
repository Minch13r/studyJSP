package webapp.signinup;

public class MemberDTO {
    private String email;
    private String phoneNumber;
    private String id;
    private String password;

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "MemberDTO{" + "email='" + email + '\'' + ", phoneNumber='" + phoneNumber + '\'' + ", id='" + id + '\'' + ", password='" + password + '\'' + '}';
    }
}
