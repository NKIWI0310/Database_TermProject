package host;

public class Host {
    private String host_id;
    private String password;
    private String name;
    private String email;
    private String phone_num;

    // Constructors
    public Host() {
    }

    public Host(String host_id, String password, String name, String email, String phone_num) {
        this.host_id = host_id;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phone_num = phone_num;
    }

    // Getter and Setter methods
    public String getHost_id() {
        return host_id;
    }

    public void setHost_id(String host_id) {
        this.host_id = host_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }

    // toString method (optional)
    @Override
    public String toString() {
        return "Host{" +
                "host_id='" + host_id + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone_num='" + phone_num + '\'' +
                '}';
    }
}
