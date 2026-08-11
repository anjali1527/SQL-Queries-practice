CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE categories(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name varchar(40) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    city VARCHAR(50),
    created_at DATE
);

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    FOREIGN KEY(category_id)
        REFERENCES categories(category_id),
    price FLOAT ,
    CONSTRAINT chk_price
        CHECK (price>=0),
    stock_quantity INT ,
    CONSTRAINT chk_stock_quantity
        CHECK (stock_quantity>=0) 
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id),
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING'
  
);

CREATE TABLE order_items(
    order_id INT,
   
    product_id INT,
   
    quantity INT not null,
   
    unit_price DECIMAL(10,2) NOT NULL,
    
    PRIMARY KEY(order_id,product_id),
     CONSTRAINT chk_quantity
        CHECK (quantity>0),
	FOREIGN KEY(order_id)
        REFERENCES orders(order_id),
         FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


INSERT INTO categories
(category_id, category_name)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances'),
(4, 'Books'),
(5, 'Sports');

INSERT INTO customers
(customer_id, first_name, last_name, email, city, created_at)
VALUES
(1, 'Aarav', 'Sharma', 'aarav.sharma@gmail.com', 'Delhi', '2024-01-10'),

(2, 'Ishita', 'Verma', 'ishita.verma@gmail.com', 'Gurugram', '2024-02-15'),

(3, 'Arjun', 'Singh', 'arjun.singh@gmail.com', 'Noida', '2024-03-20'),

(4, 'Meera', 'Gupta', 'meera.gupta@gmail.com', 'Faridabad', '2024-04-05'),

(5, 'Kabir', 'Kumar', 'kabir.kumar@gmail.com', 'Delhi', '2024-05-12'),

(6, 'Riya', 'Kapoor', 'riya.kapoor@gmail.com', 'Jaipur', '2024-06-18');

INSERT INTO products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(101, 'Laptop', 1, 65000.00, 25),

(102, 'Smartphone', 1, 35000.00, 40),

(103, 'Wireless Headphones', 1, 3000.00, 100),

(104, 'T-Shirt', 2, 1200.00, 150),

(105, 'Jeans', 2, 2500.00, 80),

(106, 'Air Conditioner', 3, 45000.00, 15),

(107, 'Microwave Oven', 3, 12000.00, 30),

(108, 'SQL Programming Book', 4, 900.00, 60),

(109, 'Data Science Book', 4, 1100.00, 50),

(110, 'Running Shoes', 5, 3500.00, 70);

INSERT INTO orders
(order_id, customer_id, order_date, status)
VALUES
(1001, 1, '2024-06-01', 'DELIVERED'),

(1002, 2, '2024-06-03', 'DELIVERED'),

(1003, 3, '2024-06-05', 'SHIPPED'),

(1004, 1, '2024-06-10', 'DELIVERED'),

(1005, 4, '2024-06-12', 'PENDING'),

(1006, 5, '2024-06-15', 'DELIVERED'),

(1007, 2, '2024-06-18', 'CANCELLED'),

(1008, 6, '2024-06-20', 'DELIVERED'),

(1009, 3, '2024-06-22', 'DELIVERED'),

(1010, 5, '2024-06-25', 'SHIPPED');

INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1001, 101, 1, 65000.00),
(1001, 103, 2, 3000.00),

(1002, 102, 1, 35000.00),
(1002, 104, 2, 1200.00),

(1003, 105, 1, 2500.00),
(1003, 110, 1, 3500.00),

(1004, 106, 1, 45000.00),

(1005, 107, 1, 12000.00),
(1005, 108, 2, 900.00),

(1006, 101, 1, 65000.00),
(1006, 109, 1, 1100.00),

(1007, 103, 1, 3000.00),

(1008, 104, 3, 1200.00),
(1008, 110, 1, 3500.00),

(1009, 102, 1, 35000.00),
(1009, 108, 1, 900.00),

(1010, 107, 2, 12000.00),
(1010, 109, 1, 1100.00);