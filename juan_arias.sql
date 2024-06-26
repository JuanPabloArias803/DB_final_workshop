CREATE DATABASE juan_arias;
USE juan_arias;
CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price DECIMAL(8,2) NOT NULL CHECK (price>=0),
    stock INT NOT NULL CHECK (stock>=0)
);
CREATE TABLE clients(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number SMALLINT NOT NULL,
    email VARCHAR(50) NOT NULL
);
CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    state BOOLEAN NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(id)
);
CREATE TABLE operators(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    shift BOOLEAN NOT NULL,
    rol VARCHAR(10) NOT NULL,
    state BOOLEAN NOT NULL
);
CREATE TABLE dispatches(
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    date DATE NOT NULL,
    operator_id INT NOT NULL,
    FOREIGN KEY (operator_id) REFERENCES operators(id),
    picking_id INT NOT NULL
);
CREATE TABLE pickings(
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    date DATE NOT NULL,
    operator_id INT NOT NULL,
    FOREIGN KEY (operator_id) REFERENCES operators(id)
);
CREATE TABLE product_order(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    order_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);
-- alteraciones
ALTER TABLE clients
	ADD COLUMN referred INT,
    ADD FOREIGN KEY (referred) REFERENCES clients(id);
ALTER TABLE dispatches
	ADD FOREIGN KEY (picking_id) REFERENCES pickings(id);
-- insertar datos
INSERT INTO products (name,description,price,stock)
VALUES ('Shampoo','Para la caspa',5000,10),
('Desodorante','Para el grajo',3000,20),
('Deo Pies','Para la pecueca',7000,30);

