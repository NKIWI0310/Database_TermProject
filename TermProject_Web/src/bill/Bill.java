package bill;

import java.util.Date;

public class Bill {
    private int bill_id;
    private Date date;
    private int price;
    private String user_id;
    private int contract_id;
    private String status;
    private String pay_method;

    public int getBillId() {
        return bill_id;
    }

    public void setBillId(int bill_id) {
        this.bill_id = bill_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getUserId() {
        return user_id;
    }

    public void setUserId(String user_id) {
        this.user_id = user_id;
    }

    public int getContractId() {
        return contract_id;
    }

    public void setContractId(int contract_id) {
        this.contract_id = contract_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPayMethod() {
        return pay_method;
    }

    public void setPayMethod(String pay_method) {
        this.pay_method = pay_method;
    }
}
