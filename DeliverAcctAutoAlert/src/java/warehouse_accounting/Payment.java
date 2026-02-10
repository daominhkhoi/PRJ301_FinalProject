package warehouse_accounting;

import java.sql.Timestamp;

public class Payment {
    private int paymentId;
    private int invoiceId;
    private double amount;
    private Timestamp paidDate;
    private String method; // "Cash", "Bank", "COD"

    public Payment() {
    }

    public Payment(int paymentId, int invoiceId, double amount, Timestamp paidDate, String method) {
        this.paymentId = paymentId;
        this.invoiceId = invoiceId;
        this.amount = amount;
        this.paidDate = paidDate;
        this.method = method;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Timestamp getPaidDate() {
        return paidDate;
    }

    public void setPaidDate(Timestamp paidDate) {
        this.paidDate = paidDate;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }
    
}
