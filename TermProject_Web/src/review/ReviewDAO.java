package review;

import java.sql.*;

public class ReviewDAO {
    private String dbURL;
    private String dbID;
    private String dbPassword;

    public ReviewDAO(String dbURL, String dbID, String dbPassword) {
        this.dbURL = dbURL;
        this.dbID = dbID;
        this.dbPassword = dbPassword;
    }


    public void insertReviewIfContractExists(String userId, int roomId, String content) {
        // 1. 방에 대한 계약이 있는지 확인하는 쿼리 작성
        String selectQuery = "SELECT COUNT(*) AS contractCount FROM contract WHERE user_id = ? AND room_id = ?";

        try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
             PreparedStatement selectStatement = conn.prepareStatement(selectQuery)) {

            // 사용자 ID 및 방 ID를 설정
            selectStatement.setString(1, userId);
            selectStatement.setInt(2, roomId);

            // SELECT 쿼리 실행
            ResultSet resultSet = selectStatement.executeQuery();

            // 결과에서 계약 수 가져오기
            if (resultSet.next()) {
                int contractCount = resultSet.getInt("contractCount");

                // 2. 계약이 존재하면 리뷰를 삽입하는 쿼리 실행
                if (contractCount > 0) {
                    String insertQuery = "INSERT INTO review (user_id, room_id, content, date) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";

                    try (PreparedStatement insertStatement = conn.prepareStatement(insertQuery)) {
                        // 리뷰에 대한 매개변수 설정
                        insertStatement.setString(1, userId);
                        insertStatement.setInt(2, roomId);
                        insertStatement.setString(3, content);

                        // INSERT 쿼리 실행
                        int rowsAffected = insertStatement.executeUpdate();

                        if (rowsAffected > 0) {
                            System.out.println("Review added successfully.");
                        } else {
                            System.out.println("Failed to add review.");
                        }
                    }
                } else {
                    System.out.println("No contract found for the specified user and room. Review not added.");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
        }
    }

}
