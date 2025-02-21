package webapp.signinup;

import java.sql.*;

public class MemberDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private static final String url = "jdbc:mysql://localhost:3306/test";
    private static final String user = "root";
    private static final String pw = "12345678";
    final String SELECT = "SELECT * FROM members WHERE id = ? AND password = ?";

    public boolean login(MemberDTO member) {
        boolean flag = false;

        try {
            conn = DriverManager.getConnection(url, user, pw);
            pstmt = conn.prepareStatement(SELECT);

            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());

            rs = pstmt.executeQuery();

            if(rs.next()) {
                flag = true;
            }

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            try {
                if(rs != null) {
                    rs.close();
                }
                if(pstmt != null) {
                    pstmt.close();
                }
                if(conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }

}
