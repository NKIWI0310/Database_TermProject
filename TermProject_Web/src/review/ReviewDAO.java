package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReviewDAO {
    private String dbURL;
    private String dbID;
    private String dbPassword;

    public ReviewDAO(String dbURL, String dbID, String dbPassword) {
        this.dbURL = dbURL;
        this.dbID = dbID;
        this.dbPassword = dbPassword;
    }


    public void insertQuery(String userId, int roomId, String content) {
        String insertQuery = "INSERT INTO review (user_id, room_id, content, date) VALUES (?, ?, ? ,CURRENT_TIMESTAMP)";

        try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
             PreparedStatement preparedStatement = conn.prepareStatement(insertQuery)) {

            preparedStatement.setString(1, userId);
            preparedStatement.setInt(2, roomId);
            preparedStatement.setString(3, content);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Message sent successfully.");
            } else {
                System.out.println("Failed to send message.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
        }
    }
}
