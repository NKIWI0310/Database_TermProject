package bill;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDAO {
    private static final String DB_URL = "jdbc:mysql://192.168.56.101:4567/Term_project";
    private static final String DB_USER = "dongmin-lee";
    private static final String DB_PASSWORD = "1234";

    public static List<Bill> getBillsByUserId(String userId) {
        List<Bill> bills = new ArrayList<>();

        try (Connection connection = getConnection()) {
            String query = "SELECT * FROM bill WHERE user_id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, userId);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Bill bill = new Bill();
                        bill.setBillId(resultSet.getInt("bill_id"));
                        bill.setDate(resultSet.getDate("date"));
                        bill.setPrice(resultSet.getInt("price"));
                        bill.setUserId(resultSet.getString("user_id"));
                        bill.setContractId(resultSet.getInt("contract_id"));
                        bill.setStatus(resultSet.getString("status"));
                        bill.setPayMethod(resultSet.getString("pay_method"));

                        bills.add(bill);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bills;
    }

    private static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}
