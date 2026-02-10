package delivery;

import java.sql.Timestamp;

public class DeliveryOrder {
    private int orderId;
    private int customerId;
    private int warehouseId;
    private Timestamp orderDate;
    private String route;
    private String hasCod; // "Y" hoặc "N"
    private double totalAmount;
    private String status;
    
    //Thuộc tính phụ
    private String customerName;
    private String warehouseName;
    
    public DeliveryOrder() {
    }

    public DeliveryOrder(int orderId, int customerId, int warehouseId, Timestamp orderDate, String route, String hasCod, double totalAmount, String status, String customerName, String warehouseName) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.warehouseId = warehouseId;
        this.orderDate = orderDate;
        this.route = route;
        this.hasCod = hasCod;
        this.totalAmount = totalAmount;
        this.status = status;
        this.customerName = customerName;
        this.warehouseName = warehouseName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }
    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(int warehouseId) {
        this.warehouseId = warehouseId;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public String getHasCod() {
        return hasCod;
    }

    public void setHasCod(String hasCod) {
        this.hasCod = hasCod;
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
