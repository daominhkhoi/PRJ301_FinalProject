package risk;

import java.sql.Timestamp;

public class AlertAction {
    private int actionId;
    private int caseId;
    private String actionTaken;
    private int performedBy; //Id của User thực hiện
    private Timestamp actionTime;
    
    // Thuộc tính phụ
    private String performedByName;

    public AlertAction() {
    }

    public AlertAction(int actionId, int caseId, String actionTaken, int performedBy, Timestamp actionTime, String performedByName) {
        this.actionId = actionId;
        this.caseId = caseId;
        this.actionTaken = actionTaken;
        this.performedBy = performedBy;
        this.actionTime = actionTime;
        this.performedByName = performedByName;
    }

    public int getActionId() {
        return actionId;
    }

    public void setActionId(int actionId) {
        this.actionId = actionId;
    }

    public int getCaseId() {
        return caseId;
    }

    public void setCaseId(int caseId) {
        this.caseId = caseId;
    }

    public String getActionTaken() {
        return actionTaken;
    }

    public void setActionTaken(String actionTaken) {
        this.actionTaken = actionTaken;
    }

    public int getPerformedBy() {
        return performedBy;
    }

    public void setPerformedBy(int performedBy) {
        this.performedBy = performedBy;
    }

    public Timestamp getActionTime() {
        return actionTime;
    }

    public void setActionTime(Timestamp actionTime) {
        this.actionTime = actionTime;
    }

    public String getPerformedByName() {
        return performedByName;
    }

    public void setPerformedByName(String performedByName) {
        this.performedByName = performedByName;
    }
    
    
}
