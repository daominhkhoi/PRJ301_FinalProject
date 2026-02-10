package warehouse_accounting;

import java.sql.Timestamp;

public class InboundDocument {
    private int inboundId;
    private int orderId;
    private int warehouseId;
    private Timestamp docDate;
    private String reason;

    public InboundDocument(int inboundId, int orderId, int warehouseId, Timestamp docDate, String reason) {
        this.inboundId = inboundId;
        this.orderId = orderId;
        this.warehouseId = warehouseId;
        this.docDate = docDate;
        this.reason = reason;
    }

    public InboundDocument() {
    }

    public int getInboundId() {
        return inboundId;
    }

    public void setInboundId(int inboundId) {
        this.inboundId = inboundId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(int warehouseId) {
        this.warehouseId = warehouseId;
    }

    public Timestamp getDocDate() {
        return docDate;
    }

    public void setDocDate(Timestamp docDate) {
        this.docDate = docDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
    
}
