package webapp.day31.model.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBCUtil {
    static final String driverName = "com.mysql.cj.jdbc.Driver";
    static final String url = "jdbc:mysql://localhost:3306/test";
    static final String userName = "root";
    static final String password = "12345678";

    public static Connection connect(){
        Connection conn = null;
        try {
            // 1. 드라이버 연결(메모리에 데이터 적재)
            Class.forName(driverName);
            // 2. conn 연결
            conn = DriverManager.getConnection(url, userName, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void disconnect(Connection conn, PreparedStatement pstmt){
        // 4. DB 연결 해제
        try {
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}