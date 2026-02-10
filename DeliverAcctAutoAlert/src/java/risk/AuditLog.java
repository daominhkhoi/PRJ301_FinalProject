package risk;

import java.sql.Timestamp;
        
public class AuditLog {
    private int logId;
    private int userId;
    private String action;
    private String tableName;
    private int recordId;
    private Timestamp actionTime;
    
    //Thuộc tính phụ
    private String username; // Để biết ai làm

    public AuditLog() {
    }

    public AuditLog(int logId, int userId, String action, String tableName, int recordId, Timestamp actionTime, String username) {
        this.logId = logId;
        this.userId = userId;
        this.action = action;
        this.tableName = tableName;
        this.recordId = recordId;
        this.actionTime = actionTime;
        this.username = username;
    }

    public int getLogId() {
        return logId;
    }

    public void setLogId(int logId) {
        this.logId = logId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public int getRecordId() {
        return recordId;
    }

    public void setRecordId(int recordId) {
        this.recordId = recordId;
    }

    public Timestamp getActionTime() {
        return actionTime;
    }

    public void setActionTime(Timestamp actionTime) {
        this.actionTime = actionTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    
}
