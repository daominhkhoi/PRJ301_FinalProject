------------------------------
-- CREATE DATABASE
------------------------------
CREATE DATABASE DeliverAcctDB;
GO
USE DeliverAcctDB;
GO

--------------------------------------------------
-- 1) ROLES
--------------------------------------------------
CREATE TABLE Roles (
    role_id INT IDENTITY PRIMARY KEY,
    role_name NVARCHAR(50) NOT NULL
);

--------------------------------------------------
-- 2) USERS
--------------------------------------------------
CREATE TABLE Users (
    user_id INT IDENTITY PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    password_hash NVARCHAR(255) NOT NULL,
    full_name NVARCHAR(100),
    role_id INT,
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT fk_users_roles 
        FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

--------------------------------------------------
-- 3) CUSTOMERS
--------------------------------------------------
CREATE TABLE Customers (
    customer_id INT IDENTITY PRIMARY KEY,
    customer_name NVARCHAR(150) NOT NULL,
    phone NVARCHAR(20),
    email NVARCHAR(100),
    address NVARCHAR(255),
    created_at DATETIME DEFAULT GETDATE()
);

--------------------------------------------------
-- 4) WAREHOUSES
--------------------------------------------------
CREATE TABLE Warehouses (
    warehouse_id INT IDENTITY PRIMARY KEY,
    warehouse_name NVARCHAR(100) NOT NULL,
    location NVARCHAR(255),
    manager NVARCHAR(100),
    created_at DATETIME DEFAULT GETDATE()
);

--------------------------------------------------
-- 5) PRODUCTS
--------------------------------------------------
CREATE TABLE Products (
    product_id INT IDENTITY PRIMARY KEY,
    sku NVARCHAR(50) NOT NULL UNIQUE,
    product_name NVARCHAR(150) NOT NULL,
    category NVARCHAR(100),
    unit NVARCHAR(20),
    price DECIMAL(12,2),
    created_at DATETIME DEFAULT GETDATE()
);

--------------------------------------------------
-- 6) DELIVERY ORDERS
--------------------------------------------------
CREATE TABLE DeliveryOrders (
    order_id INT IDENTITY PRIMARY KEY,
    customer_id INT,
    warehouse_id INT,
    order_date DATETIME DEFAULT GETDATE(),
    route NVARCHAR(100),
    has_cod CHAR(1) CHECK (has_cod IN ('Y','N')),
    total_amount DECIMAL(12,2),
    status NVARCHAR(30),
    CONSTRAINT fk_deliveryorders_customers 
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT fk_deliveryorders_warehouses 
        FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id)
);

--------------------------------------------------
-- 7) ORDER ITEMS
--------------------------------------------------
CREATE TABLE OrderItems (
    order_item_id INT IDENTITY PRIMARY KEY,
    order_id INT,
    product_id INT,
    qty INT,
    unit_price DECIMAL(12,2),
    subtotal AS (qty * unit_price),
    CONSTRAINT fk_orderitems_orders 
        FOREIGN KEY (order_id) REFERENCES DeliveryOrders(order_id),
    CONSTRAINT fk_orderitems_products 
        FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

--------------------------------------------------
-- 8) SHIPMENTS
--------------------------------------------------
CREATE TABLE Shipments (
    shipment_id INT IDENTITY PRIMARY KEY,
    order_id INT,
    driver_name NVARCHAR(100),
    ship_date DATETIME,
    delivery_date DATETIME,
    status NVARCHAR(30),
    CONSTRAINT fk_shipments_orders 
        FOREIGN KEY (order_id) REFERENCES DeliveryOrders(order_id)
);

--------------------------------------------------
-- 9) PROOF OF DELIVERY (POD)
--------------------------------------------------
CREATE TABLE ProofOfDeliveries (
    pod_id INT IDENTITY PRIMARY KEY,
    shipment_id INT,
    image_url NVARCHAR(255),
    signed_by NVARCHAR(100),
    received_at DATETIME,
    status NVARCHAR(30),
    CONSTRAINT fk_pods_shipments 
        FOREIGN KEY (shipment_id) REFERENCES Shipments(shipment_id)
);

--------------------------------------------------
-- 10) OUTBOUND DOCS
--------------------------------------------------
CREATE TABLE OutboundDocuments (
    outbound_id INT IDENTITY PRIMARY KEY,
    order_id INT,
    warehouse_id INT,
    doc_date DATETIME DEFAULT GETDATE(),
    status NVARCHAR(30),
    CONSTRAINT fk_outbound_orders 
        FOREIGN KEY (order_id) REFERENCES DeliveryOrders(order_id),
    CONSTRAINT fk_outbound_warehouses 
        FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id)
);

--------------------------------------------------
-- 11) INBOUND DOCS
--------------------------------------------------
CREATE TABLE InboundDocuments (
    inbound_id INT IDENTITY PRIMARY KEY,
    order_id INT,
    warehouse_id INT,
    doc_date DATETIME DEFAULT GETDATE(),
    reason NVARCHAR(100),
    CONSTRAINT fk_inbound_orders 
        FOREIGN KEY (order_id) REFERENCES DeliveryOrders(order_id),
    CONSTRAINT fk_inbound_warehouses 
        FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id)
);

--------------------------------------------------
-- 12) STOCK LEDGER
--------------------------------------------------
CREATE TABLE StockLedgers (
    ledger_id INT IDENTITY PRIMARY KEY,
    warehouse_id INT,
    product_id INT,
    ref_id INT,
    ref_type NVARCHAR(20),
    qty_change INT,
    balance_after INT,
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT fk_ledgers_warehouses 
        FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id),
    CONSTRAINT fk_ledgers_products 
        FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

--------------------------------------------------
-- 13) INVOICES
--------------------------------------------------
CREATE TABLE Invoices (
    invoice_id INT IDENTITY PRIMARY KEY,
    order_id INT,
    issue_date DATETIME DEFAULT GETDATE(),
    total_amount DECIMAL(12,2),
    status NVARCHAR(30),
    CONSTRAINT fk_invoices_orders 
        FOREIGN KEY (order_id) REFERENCES DeliveryOrders(order_id)
);

--------------------------------------------------
-- 14) PAYMENTS
--------------------------------------------------
CREATE TABLE Payments (
    payment_id INT IDENTITY PRIMARY KEY,
    invoice_id INT,
    amount DECIMAL(12,2),
    paid_date DATETIME,
    method NVARCHAR(30),
    CONSTRAINT fk_payments_invoices 
        FOREIGN KEY (invoice_id) REFERENCES Invoices(invoice_id)
);

--------------------------------------------------
-- 15) COD RECONCILIATION  → ĐÃ ĐỔI TÊN
--------------------------------------------------
CREATE TABLE CodReconciliations (
    cod_id INT IDENTITY PRIMARY KEY,
    order_id INT,
    expected_cod DECIMAL(12,2),
    received_cod DECIMAL(12,2),
    mismatch_amount AS (expected_cod - received_cod),
    status NVARCHAR(20),
    CONSTRAINT fk_cod_orders 
        FOREIGN KEY (order_id) REFERENCES DeliveryOrders(order_id)
);

--------------------------------------------------
-- 16) ALERT RULES
--------------------------------------------------
CREATE TABLE AlertRules (
    rule_id INT IDENTITY PRIMARY KEY,
    rule_name NVARCHAR(150),
    condition NVARCHAR(255),
    severity NVARCHAR(20)
);

--------------------------------------------------
-- 17) ALERT EVENTS
--------------------------------------------------
CREATE TABLE AlertEvents (
    alert_id INT IDENTITY PRIMARY KEY,
    order_id INT,
    rule_id INT,
    detected_at DATETIME DEFAULT GETDATE(),
    risk_score DECIMAL(5,2),
    status NVARCHAR(20),
    CONSTRAINT fk_alertevents_orders 
        FOREIGN KEY (order_id) REFERENCES DeliveryOrders(order_id),
    CONSTRAINT fk_alertevents_rules 
        FOREIGN KEY (rule_id) REFERENCES AlertRules(rule_id)
);

--------------------------------------------------
-- 18) RECONCILIATION CASES
--------------------------------------------------
CREATE TABLE ReconciliationCases (
    case_id INT IDENTITY PRIMARY KEY,
    order_id INT,
    alert_id INT,
    assigned_to INT,
    issue_type NVARCHAR(100),
    status NVARCHAR(30),
    CONSTRAINT fk_cases_orders 
        FOREIGN KEY (order_id) REFERENCES DeliveryOrders(order_id),
    CONSTRAINT fk_cases_alerts 
        FOREIGN KEY (alert_id) REFERENCES AlertEvents(alert_id),
    CONSTRAINT fk_cases_users 
        FOREIGN KEY (assigned_to) REFERENCES Users(user_id)
);

--------------------------------------------------
-- 19) ALERT ACTIONS
--------------------------------------------------
CREATE TABLE AlertActions (
    action_id INT IDENTITY PRIMARY KEY,
    case_id INT,
    action_taken NVARCHAR(255),
    performed_by INT,
    action_time DATETIME DEFAULT GETDATE(),
    CONSTRAINT fk_actions_cases 
        FOREIGN KEY (case_id) REFERENCES ReconciliationCases(case_id),
    CONSTRAINT fk_actions_users 
        FOREIGN KEY (performed_by) REFERENCES Users(user_id)
);

--------------------------------------------------
-- 20) AUDIT LOG
--------------------------------------------------
CREATE TABLE AuditLogs (
    log_id INT IDENTITY PRIMARY KEY,
    user_id INT,
    action NVARCHAR(100),
    table_name NVARCHAR(50),
    record_id INT,
    action_time DATETIME DEFAULT GETDATE(),
    CONSTRAINT fk_audit_users 
        FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

--------------------------------------------------
-- INDEXES CHO SEARCH NHANH
--------------------------------------------------
CREATE INDEX idx_order_date ON DeliveryOrders(order_date);
CREATE INDEX idx_order_status ON DeliveryOrders(status);
CREATE INDEX idx_ledger_warehouse ON StockLedgers(warehouse_id);
CREATE INDEX idx_invoice_order ON Invoices(order_id);
CREATE INDEX idx_alert_status ON AlertEvents(status);

PRINT 'DATABASE CREATED SUCCESSFULLY!';
GO


------------------------------
-- INSERT SAMPLE DATA
------------------------------

------------------ ROLES ------------------
INSERT INTO Roles (role_name) VALUES
(N'Admin'),
(N'Accountant'),
(N'Warehouse Staff'),
(N'Driver'),
(N'Customer Service');

------------------ USERS ------------------
INSERT INTO Users (username, password_hash, full_name, role_id) VALUES
(N'admin1', 'hash123', N'Nguyễn Văn A', 1),
(N'acc1', 'hash123', N'Trần Thị B', 2),
(N'wh1', 'hash123', N'Lê Văn C', 3),
(N'drv1', 'hash123', N'Phạm Văn D', 4),
(N'cs1', 'hash123', N'Hoàng Thị E', 5);

------------------ CUSTOMERS ------------------
INSERT INTO Customers (customer_name, phone, email, address) VALUES
(N'Công ty ABC', '0901111111', 'abc@gmail.com', N'Hà Nội'),
(N'Công ty XYZ', '0902222222', 'xyz@gmail.com', N'HCM'),
(N'Cửa hàng Mây', '0903333333', 'may@gmail.com', N'Đà Nẵng'),
(N'Shop Hoa', '0904444444', 'hoa@gmail.com', N'Huế'),
(N'Store Sun', '0905555555', 'sun@gmail.com', N'Cần Thơ');

------------------ WAREHOUSES ------------------
INSERT INTO Warehouses (warehouse_name, location, manager) VALUES
(N'Kho Hà Nội', N'Hà Nội', N'Anh A'),
(N'Kho HCM', N'HCM', N'Anh B'),
(N'Kho Đà Nẵng', N'Đà Nẵng', N'Anh C'),
(N'Kho Huế', N'Huế', N'Anh D'),
(N'Kho Cần Thơ', N'Cần Thơ', N'Anh E');

------------------ PRODUCTS ------------------
INSERT INTO Products (sku, product_name, category, unit, price) VALUES
(N'P001', N'Nước suối', N'Beverage', N'chai', 5000),
(N'P002', N'Sữa hộp', N'Dairy', N'hộp', 12000),
(N'P003', N'Mì gói', N'Food', N'gói', 4000),
(N'P004', N'Bánh quy', N'Snack', N'hộp', 25000),
(N'P005', N'Trái cây', N'Fresh', N'kg', 30000);

------------------ DELIVERY ORDERS ------------------
INSERT INTO DeliveryOrders (customer_id, warehouse_id, route, has_cod, total_amount, status) VALUES
(1, 1, N'HN-1', 'Y', 100000, N'Pending'),
(2, 2, N'HCM-1', 'Y', 200000, N'Shipping'),
(3, 3, N'DN-1', 'N', 150000, N'Delivered'),
(4, 4, N'HU-1', 'Y', 80000, N'Pending'),
(5, 5, N'CT-1', 'N', 120000, N'Cancelled');

------------------ ORDER ITEMS ------------------
INSERT INTO OrderItems (order_id, product_id, qty, unit_price) VALUES
(1, 1, 10, 5000),
(1, 2, 5, 12000),
(2, 3, 20, 4000),
(3, 4, 3, 25000),
(4, 5, 2, 30000);

------------------ SHIPMENTS ------------------
INSERT INTO Shipments (order_id, driver_name, ship_date, delivery_date, status) VALUES
(1, N'Tài xế A', GETDATE(), NULL, N'Shipping'),
(2, N'Tài xế B', GETDATE(), NULL, N'Shipping'),
(3, N'Tài xế C', GETDATE()-1, GETDATE(), N'Delivered'),
(4, N'Tài xế D', GETDATE(), NULL, N'Pending'),
(5, N'Tài xế E', GETDATE(), NULL, N'Cancelled');

------------------ PROOF OF DELIVERY ------------------
INSERT INTO ProofOfDeliveries (shipment_id, image_url, signed_by, received_at, status) VALUES
(1, N'pod1.jpg', N'Anh A', NULL, N'Pending'),
(2, N'pod2.jpg', N'Anh B', NULL, N'Pending'),
(3, N'pod3.jpg', N'Anh C', GETDATE(), N'Completed'),
(4, N'pod4.jpg', N'Anh D', NULL, N'Pending'),
(5, N'pod5.jpg', N'Anh E', NULL, N'Cancelled');

------------------ OUTBOUND DOCUMENTS ------------------
INSERT INTO OutboundDocuments (order_id, warehouse_id, status) VALUES
(1,1,N'Approved'),
(2,2,N'Approved'),
(3,3,N'Closed'),
(4,4,N'Pending'),
(5,5,N'Cancelled');

------------------ INBOUND DOCUMENTS ------------------
INSERT INTO InboundDocuments (order_id, warehouse_id, reason) VALUES
(1,1,N'Return'),
(2,2,N'Damage'),
(3,3,N'Customer Refuse'),
(4,4,N'Wrong Item'),
(5,5,N'Cancelled');

------------------ STOCK LEDGER ------------------
INSERT INTO StockLedgers (warehouse_id, product_id, ref_id, ref_type, qty_change, balance_after) VALUES
(1,1,1,N'OUT',-10,90),
(2,2,2,N'OUT',-5,95),
(3,3,3,N'OUT',-20,80),
(4,4,4,N'OUT',-3,97),
(5,5,5,N'OUT',-2,98);

------------------ INVOICES ------------------
INSERT INTO Invoices (order_id, total_amount, status) VALUES
(1,100000,N'Unpaid'),
(2,200000,N'Unpaid'),
(3,150000,N'Paid'),
(4,80000,N'Unpaid'),
(5,120000,N'Cancelled');

------------------ PAYMENTS ------------------
INSERT INTO Payments (invoice_id, amount, paid_date, method) VALUES
(3,150000,GETDATE(),N'Bank'),
(1,50000,NULL,N'COD'),
(2,100000,NULL,N'COD'),
(4,80000,NULL,N'Cash'),
(5,0,NULL,N'None');

------------------ COD RECONCILIATION ------------------
INSERT INTO CodReconciliations (order_id, expected_cod, received_cod, status) VALUES
(1,100000,90000,N'Mismatch'),
(2,200000,200000,N'OK'),
(3,0,0,N'No COD'),
(4,80000,70000,N'Mismatch'),
(5,0,0,N'Cancelled');

------------------ ALERT RULES ------------------
INSERT INTO AlertRules (rule_name, condition, severity) VALUES
(N'Delay > 2 days', N'delivery_date late', N'High'),
(N'COD mismatch', N'expected != received', N'High'),
(N'Order Cancelled', N'status=Cancelled', N'Medium'),
(N'Stock negative', N'balance < 0', N'High'),
(N'Invoice overdue', N'unpaid > 7 days', N'Medium');

------------------ ALERT EVENTS ------------------
INSERT INTO AlertEvents (order_id, rule_id, risk_score, status) VALUES
(1,2,8.5,N'Open'),
(2,1,7.0,N'Open'),
(3,3,3.0,N'Closed'),
(4,2,9.0,N'Open'),
(5,3,2.0,N'Closed');

------------------ RECONCILIATION CASES ------------------
INSERT INTO ReconciliationCases (order_id, alert_id, assigned_to, issue_type, status) VALUES
(1,1,2,N'COD mismatch',N'Investigating'),
(2,2,2,N'Delay',N'Open'),
(3,3,5,N'Cancelled',N'Closed'),
(4,4,2,N'COD mismatch',N'Open'),
(5,5,5,N'Cancelled',N'Closed');

------------------ ALERT ACTIONS ------------------
INSERT INTO AlertActions (case_id, action_taken, performed_by) VALUES
(1,N'Contact customer',2),
(2,N'Call driver',5),
(3,N'Close case',1),
(4,N'Recheck COD',2),
(5,N'Archive',1);

------------------ AUDIT LOGS ------------------
INSERT INTO AuditLogs (user_id, action, table_name, record_id) VALUES
(1,N'CREATE',N'DeliveryOrders',1),
(2,N'UPDATE',N'Invoices',3),
(3,N'INSERT',N'StockLedgers',1),
(4,N'DELETE',N'Orders',5),
(5,N'VIEW',N'Customers',2);

PRINT 'SAMPLE DATA INSERTED SUCCESSFULLY!';

