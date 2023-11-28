package message;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import database.database;

public class MessageDAO {

    private String dbURL;
    private String dbID;
    private String dbPassword;

    public MessageDAO(String dbURL, String dbID, String dbPassword) {
        this.dbURL = database.dbURL;
        this.dbID = database.dbID;
        this.dbPassword = database.dbID;
    }

    public void sendMessage(String userId, String hostId, String content) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword)) {
                String insertQuery = "INSERT INTO message (user_id, host_id, content, message_time) VALUES (?, ?, ?, NOW())";
                try (PreparedStatement preparedStatement = conn.prepareStatement(insertQuery)) {
                    preparedStatement.setString(1, userId);
                    preparedStatement.setString(2, hostId);
                    preparedStatement.setString(3, content);
                    preparedStatement.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
