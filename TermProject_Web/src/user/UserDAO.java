package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    private Connection conn = null;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO(){
        try{

            String dbURL = "jdbc:mysql://192.168.56.101:4567/Term_project";
            String dbID = "dongmin-lee";
            String dbPassword = "1234";
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int login(String UserID, String userPassword){
        String SQL = "SELECT password FROM user WHERE user_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1,UserID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(userPassword)){
                    return 1;
                }
                else  return 0; //비밀번호 오류
            }
            return -1; //아이디 존재 x
        }catch (Exception e){
            e.printStackTrace();
        }
        return -2; //DB 오류
    }
    public int join(User user) {
        String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUser_id());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPhone_num());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

}
