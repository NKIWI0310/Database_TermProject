package room;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {
    private String dbURL;
    private String dbID;
    private String dbPassword;

    public RoomDAO(String dbURL, String dbID, String dbPassword) {
        this.dbURL = dbURL;
        this.dbID = dbID;
        this.dbPassword = dbPassword;
    }
    public List<Room> getRoomsByHostId(String hostId) {
        List<Room> rooms = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
             PreparedStatement statement = conn.prepareStatement("SELECT * FROM room WHERE host_id = ?")) {
            statement.setString(1, hostId);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Room room = new Room();
                room.setRoom_id(resultSet.getInt("room_id"));
                room.setName(resultSet.getString("name"));
                room.setLocation(resultSet.getString("location"));
                room.setHost_id(resultSet.getString("host_id"));
                room.setRoom_size(resultSet.getInt("room_size"));
                room.setRoom_price(resultSet.getInt("room_price"));
                room.setRoom_shape(resultSet.getString("room_shape"));
                rooms.add(room);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rooms;
    }

    public boolean deleteRoom(String roomId) {
        String deleteQuery = "DELETE FROM room WHERE room_id = ?";

        try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
             PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery)) {
            deleteStatement.setString(1, roomId);

            int rowsAffected = deleteStatement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
