package room;

public class Room {
    private int room_id;
    private String name;
    private String location;
    private String host_id;
    private int room_size;
    private int room_price;
    private String room_shape;

    // Constructors
    public Room() {
    }

    public Room(int room_id, String name, String location, String host_id, int room_size, int room_price, String room_shape) {
        this.room_id = room_id;
        this.name = name;
        this.location = location;
        this.host_id = host_id;
        this.room_size = room_size;
        this.room_price = room_price;
        this.room_shape = room_shape;
    }

    // Getter and Setter methods
    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getHost_id() {
        return host_id;
    }

    public void setHost_id(String host_id) {
        this.host_id = host_id;
    }

    public int getRoom_size() {
        return room_size;
    }

    public void setRoom_size(int room_size) {
        this.room_size = room_size;
    }

    public int getRoom_price() {
        return room_price;
    }

    public void setRoom_price(int room_price) {
        this.room_price = room_price;
    }

    public String getRoom_shape() {
        return room_shape;
    }

    public void setRoom_shape(String room_shape) {
        this.room_shape = room_shape;
    }

}
