CREATE DATABASE TeLoVendo;  

USE TeLoVendo; 

CREATE TABLE proveedores ( 
  id_proveedor INT PRIMARY KEY AUTO_INCREMENT, 
  nombre_representante VARCHAR(50), 
  nombre_corporativo VARCHAR(100), 
  telefono1 VARCHAR(20), 
  nombre_contacto1 VARCHAR(50), 
  telefono2 VARCHAR(20), 
  nombre_contacto2 VARCHAR(50), 
  categoria VARCHAR(50), 
  correo_facturacion VARCHAR(100) 
); 

CREATE TABLE clientes ( 
  id_cliente INT PRIMARY KEY AUTO_INCREMENT, 
  nombre VARCHAR(50), 
  apellido VARCHAR(50), 
  direccion VARCHAR(100) 
); 

CREATE TABLE productos ( 
  id_producto INT PRIMARY KEY AUTO_INCREMENT, 
  nombre_producto VARCHAR(100), 
  precio DECIMAL(10, 2), 
  categoria VARCHAR(50), 
  color VARCHAR(50), 
  stock VARCHAR(50) 
); 

CREATE TABLE proveedor_producto ( 
  id_proveedor INT, 
  id_producto INT, 
  stock INT, 
  FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor), 
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto) 
); 
  