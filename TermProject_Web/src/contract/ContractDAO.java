package contract;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContractDAO {

    private final String dbURL;
    private final String dbID;
    private final String dbPassword;

    public ContractDAO(String dbURL, String dbID, String dbPassword) {
        this.dbURL = dbURL;
        this.dbID = dbID;
        this.dbPassword = dbPassword;
    }

    public void insertContract(String userId, int roomId, String contractDate, int price, int duration, String startTime, String endTime) {
        try {
            String query = "INSERT INTO contract (user_id, room_id, contract_date, price, duration, start_time, end_time) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";

            try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
                 PreparedStatement preparedStatement = conn.prepareStatement(query)) {

                preparedStatement.setString(1, userId);
                preparedStatement.setInt(2, roomId);
                preparedStatement.setString(3, contractDate);
                preparedStatement.setInt(4, price);
                preparedStatement.setInt(5, duration);
                preparedStatement.setString(6, startTime);
                preparedStatement.setString(7, endTime);

                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("성공");
                } else {
                    System.out.println("실패");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
