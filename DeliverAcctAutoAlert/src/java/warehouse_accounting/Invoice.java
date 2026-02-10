package warehouse_accounting;

import java.sql.Timestamp;

public class Invoice {
    private int invoiceId;
    private int orderId;
    private Timestamp issueDate;
    private double totalAmount;
    private String status;

    public Invoice() {
    }

    public Invoice(int invoiceId, int orderId, Timestamp issueDate, double totalAmount, String status) {
        this.invoiceId = invoiceId;
        this.orderId = orderId;
        this.issueDate = issueDate;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Timestamp getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Timestamp issueDate) {
        this.issueDate = issueDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
