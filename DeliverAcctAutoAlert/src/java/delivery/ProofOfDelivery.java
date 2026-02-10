package delivery;

import java.sql.Timestamp;

public class ProofOfDelivery {
    private int podId;
    private int shipmentId;
    private String imageUrl;
    private String signedBy;
    private Timestamp receivedAt;
    private String status;

    public ProofOfDelivery() {
    }

    public ProofOfDelivery(int podId, int shipmentId, String imageUrl, String signedBy, Timestamp receivedAt, String status) {
        this.podId = podId;
        this.shipmentId = shipmentId;
        this.imageUrl = imageUrl;
        this.signedBy = signedBy;
        this.receivedAt = receivedAt;
        this.status = status;
    }

    public int getPodId() {
        return podId;
    }

    public void setPodId(int podId) {
        this.podId = podId;
    }

    public int getShipmentId() {
        return shipmentId;
    }

    public void setShipmentId(int shipmentId) {
        this.shipmentId = shipmentId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getSignedBy() {
        return signedBy;
    }

    public void setSignedBy(String signedBy) {
        this.signedBy = signedBy;
    }

    public Timestamp getReceivedAt() {
        return receivedAt;
    }

    public void setReceivedAt(Timestamp receivedAt) {
        this.receivedAt = receivedAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
