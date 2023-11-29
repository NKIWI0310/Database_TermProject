package message;

import java.awt.*;
import java.sql.*;
import java.util.*;
import java.util.List;

import database.database;

public class MessageDAO {

    private String dbURL;
    private String dbID;
    private String dbPassword;

    public MessageDAO(String dbURL, String dbID, String dbPassword) {
        this.dbURL = dbURL;
        this.dbID = dbID;
        this.dbPassword = dbPassword;
    }

    public void sendMessage(String userId, String hostId, String content) {
        String insertQuery = "INSERT INTO message (user_id, host_id, content, message_time) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";

        try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
             PreparedStatement preparedStatement = conn.prepareStatement(insertQuery)) {

            preparedStatement.setString(1, userId);
            preparedStatement.setString(2, hostId);
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

    public List<Message> getMessagesForHost(String hostId) {
        List<Message> messages = new ArrayList<>();

        String selectQuery = "SELECT * FROM message WHERE host_id = ?";

        try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
             PreparedStatement preparedStatement = conn.prepareStatement(selectQuery)) {

            preparedStatement.setString(1, hostId);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Message message = new Message();
                message.setMessageId(resultSet.getInt("message_id"));
                message.setUserId(resultSet.getString("user_id"));
                message.setHostId(resultSet.getString("host_id"));
                message.setContent(resultSet.getString("content"));
                message.setMessageTime(resultSet.getTimestamp("message_time"));

                messages.add(message);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }

        return messages;
    }
}
