package host;

import database.database;
import user.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class HostDAO {

    private Connection conn = null;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public HostDAO(){
        try{
            String dbURL = database.dbURL;
            String dbID = database.dbID;
            String dbPassword = database.dbPassword;
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int login(String HostID, String hostPassword){
        String SQL = "SELECT password FROM host WHERE host_id = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1,HostID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(hostPassword)){
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
    public int join(Host host) {
        String SQL = "INSERT INTO host VALUES (?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, host.getHost_id());
            pstmt.setString(2, host.getPassword());
            pstmt.setString(3, host.getName());
            pstmt.setString(4, host.getEmail());
            pstmt.setString(5, host.getPhone_num());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

}
