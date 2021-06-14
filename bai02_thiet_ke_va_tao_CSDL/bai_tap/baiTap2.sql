create database bai02_baiTap2_QuanLyBanHang;
USE bai02_baiTap2_QuanLyBanHang;
CREATE TABLE customer (
    customer_id 	INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
	customer_name 	VARCHAR(60) NOT NULL,
	customer_age 	INT			CHECK(customer_age > 0)
);
CREATE TABLE order1 (
	order1_id 			INT 		NOT NULL AUTO_INCREMENT PRIMARY KEY,
	customer_id			INT,
	order1_date 		DATETIME,
	order1_total_price 	DOUBLE,
	FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);
CREATE TABLE product (
    product_id 		INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
	product_name 	VARCHAR(60) NOT NULL,
	product_price 	DOUBLE
);
CREATE TABLE order_detail (
    order1_id 			INT,
    product_id		 	INT,
    order_detail_QTY 	INT,
    PRIMARY KEY (order1_id,product_id),
    FOREIGN KEY (order1_id) REFERENCES order1 (order1_id),
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);