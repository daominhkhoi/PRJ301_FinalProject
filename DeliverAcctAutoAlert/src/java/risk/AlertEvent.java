package risk;

import java.sql.Timestamp;

public class AlertEvent {
    private int alertId;
    private int orderId;
    private int ruleId;
    private Timestamp detectedAt;
    private double riskScore;
    private String status;

    public AlertEvent() {
    }

    public AlertEvent(int alertId, int orderId, int ruleId, Timestamp detectedAt, double riskScore, String status) {
        this.alertId = alertId;
        this.orderId = orderId;
        this.ruleId = ruleId;
        this.detectedAt = detectedAt;
        this.riskScore = riskScore;
        this.status = status;
    }

    public int getAlertId() {
        return alertId;
    }

    public void setAlertId(int alertId) {
        this.alertId = alertId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getRuleId() {
        return ruleId;
    }

    public void setRuleId(int ruleId) {
        this.ruleId = ruleId;
    }

    public Timestamp getDetectedAt() {
        return detectedAt;
    }

    public void setDetectedAt(Timestamp detectedAt) {
        this.detectedAt = detectedAt;
    }

    public double getRiskScore() {
        return riskScore;
    }

    public void setRiskScore(double riskScore) {
        this.riskScore = riskScore;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
