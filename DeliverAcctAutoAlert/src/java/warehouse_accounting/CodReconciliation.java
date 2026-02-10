package warehouse_accounting;

public class CodReconciliation {
    private int codId;
    private int orderId;
    private double expectedCod;
    private double receivedCod;
    private double mismatchAmount; // Cột tính toán
    private String status;

    public CodReconciliation() {
    }

    public CodReconciliation(int codId, int orderId, double expectedCod, double receivedCod, double mismatchAmount, String status) {
        this.codId = codId;
        this.orderId = orderId;
        this.expectedCod = expectedCod;
        this.receivedCod = receivedCod;
        this.mismatchAmount = mismatchAmount;
        this.status = status;
    }

    public CodReconciliation(int codId, int orderId, double expectedCod, double receivedCod, String status) {
        this.codId = codId;
        this.orderId = orderId;
        this.expectedCod = expectedCod;
        this.receivedCod = receivedCod;
        this.mismatchAmount = expectedCod - receivedCod;
        this.status = status;
    }

    public int getCodId() {
        return codId;
    }

    public void setCodId(int codId) {
        this.codId = codId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public double getExpectedCod() {
        return expectedCod;
    }

    public void setExpectedCod(double expectedCod) {
        this.expectedCod = expectedCod;
    }

    public double getReceivedCod() {
        return receivedCod;
    }

    public void setReceivedCod(double receivedCod) {
        this.receivedCod = receivedCod;
    }

    public double getMismatchAmount() {
        return mismatchAmount;
    }

    public void setMismatchAmount(double mismatchAmount) {
        this.mismatchAmount = mismatchAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
