package masterData;

import java.sql.Timestamp;

public class Product {
    private int productId;
    private String sku;
    private String productName;
    private String category;
    private String unit;
    private double price;
    private Timestamp createdAt;

    public Product() {
    }

    public Product(int productId, String sku, String productName, String category, String unit, double price, Timestamp createdAt) {
        this.productId = productId;
        this.sku = sku;
        this.productName = productName;
        this.category = category;
        this.unit = unit;
        this.price = price;
        this.createdAt = createdAt;
    }

    public Product(int productId, String sku, String productName, String category, String unit, double price) {
        this.productId = productId;
        this.sku = sku;
        this.productName = productName;
        this.category = category;
        this.unit = unit;
        this.price = price;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
    
}
