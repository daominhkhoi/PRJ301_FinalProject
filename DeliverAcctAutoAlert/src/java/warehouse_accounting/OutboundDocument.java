package warehouse_accounting;

import java.sql.Timestamp;

public class OutboundDocument {
    private int outboundId;
    private int orderId;
    private int warehouseId;
    private Timestamp docDate;
    private String status;

    public OutboundDocument() {
    }

    public OutboundDocument(int outboundId, int orderId, int warehouseId, Timestamp docDate, String status) {
        this.outboundId = outboundId;
        this.orderId = orderId;
        this.warehouseId = warehouseId;
        this.docDate = docDate;
        this.status = status;
    }

    public int getOutboundId() {
        return outboundId;
    }

    public void setOutboundId(int outboundId) {
        this.outboundId = outboundId;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
