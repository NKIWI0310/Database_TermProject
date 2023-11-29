package contract;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContractDAO {

    private final String dbURL;
    private final String dbID;
    private final String dbPassword;

    public ContractDAO(String dbURL, String dbID, String dbPassword) {
        this.dbURL = dbURL;
        this.dbID = dbID;
        this.dbPassword = dbPassword;
    }

    public int insertContract(String userId, int roomId, String contractDate, int price, int duration, String startTime, String endTime) {
        int generatedId = -1;

        try {
            String query = "INSERT INTO contract (user_id, room_id, contract_date, price, duration, start_time, end_time) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";

            try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
                 PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

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

                    // 생성된 ID 가져오기
                    try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            generatedId = generatedKeys.getInt(1);
                            System.out.println("생성된 계약서 ID: " + generatedId);
                        } else {
                            System.out.println("계약서 ID를 가져올 수 없습니다.");
                        }
                    }
                } else {
                    System.out.println("실패");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return generatedId;  // 생성된 ID 반환
    }


    public List<Contract> getContractsByHostId(String hostId) {
        List<Contract> contracts = new ArrayList<>();

        String selectQuery = "SELECT * FROM contract WHERE room_id IN (SELECT room_id FROM room WHERE host_id = ?)";

        try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
             PreparedStatement preparedStatement = conn.prepareStatement(selectQuery)) {

            preparedStatement.setString(1, hostId);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Contract contract = new Contract();
                contract.setContractId(resultSet.getInt("contract_id"));
                contract.setUserId(resultSet.getString("user_id"));
                contract.setRoomId(resultSet.getInt("room_id"));
                contract.setContractDate(resultSet.getDate("contract_date").toLocalDate());
                contract.setPrice(resultSet.getInt("price"));
                contract.setDuration(resultSet.getInt("duration"));
                contract.setStartTime(resultSet.getTimestamp("start_time").toLocalDateTime());
                contract.setEndTime(resultSet.getTimestamp("end_time").toLocalDateTime());

                contracts.add(contract);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return contracts;
    }
    public boolean deleteContract(int contractId) {
        boolean isDeleted = false;

        try {
            String query = "DELETE FROM contract WHERE contract_id = ?";

            try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
                 PreparedStatement preparedStatement = conn.prepareStatement(query)) {

                preparedStatement.setInt(1, contractId);

                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    isDeleted = true;
                    System.out.println("계약서 삭제 성공");
                } else {
                    System.out.println("계약서 삭제 실패");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isDeleted;
    }

}
