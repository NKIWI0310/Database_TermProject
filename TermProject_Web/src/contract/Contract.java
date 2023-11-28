package contract;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Contract {
    private int contractId;
    private String userId;
    private String hostId;
    private LocalDate contractDate;
    private int price;
    private int duration;
    private LocalDateTime startTime;
    private LocalDateTime endTime;


    public Contract() {

    }

    public Contract(String userId, String hostId, LocalDate contractDate, int price, int duration, LocalDateTime startTime, LocalDateTime endTime) {
        this.userId = userId;
        this.hostId = hostId;
        this.contractDate = contractDate;
        this.price = price;
        this.duration = duration;
        this.startTime = startTime;
        this.endTime = endTime;
    }


    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getHostId() {
        return hostId;
    }

    public void setHostId(String hostId) {
        this.hostId = hostId;
    }

    public LocalDate getContractDate() {
        return contractDate;
    }

    public void setContractDate(LocalDate contractDate) {
        this.contractDate = contractDate;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public LocalDateTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }

}
