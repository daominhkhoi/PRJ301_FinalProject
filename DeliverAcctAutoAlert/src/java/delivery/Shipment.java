package delivery;

import java.sql.Timestamp;

public class Shipment {
    private int shipmentId;
    private int orderId;
    private String driverName;
    private Timestamp shipDate;
    private Timestamp deliveryDate;
    private String status;

    public Shipment() {
    }

    public Shipment(int shipmentId, int orderId, String driverName, Timestamp shipDate, Timestamp deliveryDate, String status) {
        this.shipmentId = shipmentId;
        this.orderId = orderId;
        this.driverName = driverName;
        this.shipDate = shipDate;
        this.deliveryDate = deliveryDate;
        this.status = status;
    }

    public int getShipmentId() {
        return shipmentId;
    }

    public void setShipmentId(int shipmentId) {
        this.shipmentId = shipmentId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public Timestamp getShipDate() {
        return shipDate;
    }

    public void setShipDate(Timestamp shipDate) {
        this.shipDate = shipDate;
    }

    public Timestamp getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Timestamp deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
