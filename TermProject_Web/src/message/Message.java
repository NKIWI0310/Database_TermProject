package message;

import java.util.Date;

public class Message {

    private int messageId;
    private String userId;
    private String hostId;
    private String content;
    private Date messageTime;

    public Message() {

    }
    public Message(int messageId, String userId, String hostId, String content, Date messageTime) {
        this.messageId = messageId;
        this.userId = userId;
        this.hostId = hostId;
        this.content = content;
        this.messageTime = messageTime;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(Date messageTime) {
        this.messageTime = messageTime;
    }
}
