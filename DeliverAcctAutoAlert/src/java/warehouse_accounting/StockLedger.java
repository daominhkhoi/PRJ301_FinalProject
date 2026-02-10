package warehouse_accounting;

import java.sql.Timestamp;

public class StockLedger {
    private int ledgerId;
    private int warehouseId;
    private int productId;
    private int refId;     // ID của phiếu nhập/xuất
    private String refType; // "IN" hoặc "OUT"
    private int qtyChange;
    private int balanceAfter;
    private Timestamp createdAt;
    
    // Thuộc tính phụ
    private String productName;
    private String warehouseName;

    public StockLedger() {
    }

    public StockLedger(int ledgerId, int warehouseId, int productId, int refId, String refType, int qtyChange, int balanceAfter, Timestamp createdAt, String productName, String warehouseName) {
        this.ledgerId = ledgerId;
        this.warehouseId = warehouseId;
        this.productId = productId;
        this.refId = refId;
        this.refType = refType;
        this.qtyChange = qtyChange;
        this.balanceAfter = balanceAfter;
        this.createdAt = createdAt;
        this.productName = productName;
        this.warehouseName = warehouseName;
    }

    public int getLedgerId() {
        return ledgerId;
    }

    public void setLedgerId(int ledgerId) {
        this.ledgerId = ledgerId;
    }

    public int getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(int warehouseId) {
        this.warehouseId = warehouseId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getRefId() {
        return refId;
    }

    public void setRefId(int refId) {
        this.refId = refId;
    }

    public String getRefType() {
        return refType;
    }

    public void setRefType(String refType) {
        this.refType = refType;
    }

    public int getQtyChange() {
        return qtyChange;
    }

    public void setQtyChange(int qtyChange) {
        this.qtyChange = qtyChange;
    }

    public int getBalanceAfter() {
        return balanceAfter;
    }

    public void setBalanceAfter(int balanceAfter) {
        this.balanceAfter = balanceAfter;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }
    
    
}
