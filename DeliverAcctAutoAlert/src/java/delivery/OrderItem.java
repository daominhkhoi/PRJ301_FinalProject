package delivery;

public class OrderItem {
    private int orderItemId;
    private int orderId;
    private int productId;
    private int qty;
    private double unitPrice;
    private double subtotal; // Cột tính toán trong DB, nhưng Java cũng cần hứng dữ liệu
    
    //Thuộc tính phụ
    private String productName;
    private String sku;

    public OrderItem() {
    }

    public OrderItem(int orderItemId, int orderId, int productId, int qty, double unitPrice, double subtotal, String productName, String sku) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.productId = productId;
        this.qty = qty;
        this.unitPrice = unitPrice;
        this.subtotal = subtotal;
        this.productName = productName;
        this.sku = sku;
    }

    public OrderItem(int orderItemId, int orderId, int productId, int qty, double unitPrice, String productName, String sku) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.productId = productId;
        this.qty = qty;
        this.unitPrice = unitPrice;
        this.subtotal = qty*unitPrice;
        this.productName = productName;
        this.sku = sku;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }
    
}
