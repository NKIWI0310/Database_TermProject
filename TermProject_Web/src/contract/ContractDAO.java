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

    public boolean insertContract(String userId, String contractDate, String price, String duration, String startTime, String endTime) {
        try {
            int Realprice = Integer.parseInt(price);
            int Realduartion = Integer.parseInt(duration);
            String query = "INSERT INTO contract (user_id, contract_date, Realprice, Realduartion, start_time, end_time) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";

            Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setString(1, userId);
                preparedStatement.setString(2, contractDate);
                preparedStatement.setInt(3, Realprice);
                preparedStatement.setInt(4, Realduartion);
                preparedStatement.setString(5, startTime);
                preparedStatement.setString(6, endTime);

                int rowsAffected = preparedStatement.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
