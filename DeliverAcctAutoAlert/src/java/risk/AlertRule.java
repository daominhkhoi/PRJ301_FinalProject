package risk;

public class AlertRule {
    private int ruleId;
    private String ruleName;
    private String condition;
    private String severity;

    public AlertRule() {
    }

    public AlertRule(int ruleId, String ruleName, String condition, String severity) {
        this.ruleId = ruleId;
        this.ruleName = ruleName;
        this.condition = condition;
        this.severity = severity;
    }

    public int getRuleId() {
        return ruleId;
    }

    public void setRuleId(int ruleId) {
        this.ruleId = ruleId;
    }

    public String getRuleName() {
        return ruleName;
    }

    public void setRuleName(String ruleName) {
        this.ruleName = ruleName;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getSeverity() {
        return severity;
    }

    public void setSeverity(String severity) {
        this.severity = severity;
    }
    
}
