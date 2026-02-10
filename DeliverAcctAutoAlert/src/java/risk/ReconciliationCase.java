package risk;

public class ReconciliationCase {
    private int caseId;
    private int orderId;
    private int alertId;
    private int assignedTo; // User ID
    private String issueType;
    private String status;

    // Thuộc tính phụ
    private String assignedUserFullName; // Tên nhân viên xử lý

    public ReconciliationCase() {
    }

    public ReconciliationCase(int caseId, int orderId, int alertId, int assignedTo, String issueType, String status, String assignedUserFullName) {
        this.caseId = caseId;
        this.orderId = orderId;
        this.alertId = alertId;
        this.assignedTo = assignedTo;
        this.issueType = issueType;
        this.status = status;
        this.assignedUserFullName = assignedUserFullName;
    }

    public int getCaseId() {
        return caseId;
    }

    public void setCaseId(int caseId) {
        this.caseId = caseId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getAlertId() {
        return alertId;
    }

    public void setAlertId(int alertId) {
        this.alertId = alertId;
    }

    public int getAssignedTo() {
        return assignedTo;
    }

    public void setAssignedTo(int assignedTo) {
        this.assignedTo = assignedTo;
    }

    public String getIssueType() {
        return issueType;
    }

    public void setIssueType(String issueType) {
        this.issueType = issueType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAssignedUserFullName() {
        return assignedUserFullName;
    }

    public void setAssignedUserFullName(String assignedUserFullName) {
        this.assignedUserFullName = assignedUserFullName;
    }
    
    
}
