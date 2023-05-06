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

INSERT INTO proveedores (nombre_representante, nombre_corporativo, telefono1, nombre_contacto1, telefono2, nombre_contacto2, categoria, correo_facturacion) VALUE  
('Carlos Gomez', 'CGOMEZ CIA', '+5691111111', 'Carlos Gomez', '+56912345678', 'Roberto Toro', 'Electronica', 'contacto@cgomezcia.cl'),  
('Luis Perez', 'LPEREZ CIA', '+5692222222', 'Fernando Torres', '+56923456789', 'Luis Perez', 'Computacion', 'contacto@lperezcia.com'), 
('Pedro Navarro', 'PNAVARRO Y CIA', '+5693333333', 'Pedro Navarro', '+56934567890', 'Jorge Soto', 'Audio', 'contacto@pnavarrocia.es'), 
('Tomas Gonzalez', 'TGONZA CIA', '+5694444444', 'Tomas Gonzalez', '+56945678901', 'Matias Vera', 'Videojuegos', 'contacto@tgonza.cl'), 
('Hernan Torres', 'HTORRES CIA', '+5695555555', 'Hernan Torres', '+56956789012', 'Claudio Barrios', 'Fotografia', 'contacto@htorres.com'); 
  
INSERT INTO clientes (nombre, apellido, direccion) VALUE  
('Tomas', 'Ruiz', 'Compañia 123'),  
('Miguel', 'Soto', 'Irarrazabal 456'),  
('Daniel', 'Watson','Las Condes 789'),  
('Julia', 'Rodriguez', 'Las Torres 741'),  
('Boris', 'Prat', 'Los Conquistadores 852'); 

INSERT INTO productos (nombre_producto, precio, categoria, color, stock) VALUE  
('Televisor LED Samsung', '499990', 'Electronica', 'Negro', '10'),  
('Smartphone iPhone 13', '1299990', 'Electronica', 'Plateado', '8'),  
('Laptop HP Pavilion', '799990','Computacion', 'Plata', '15'),  
('Cámara Canon EOS Rebel T7i', '899990', 'Fotografia', 'Negro', '5'), 
('Smartwatch Apple Watch Series 7', '399990', 'Electronica', 'Azul', '20'), 
('Consola de videojuegos PlayStation 5', '699990', 'Videojuegos', 'Blanco', '7'), 
('Tablet Samsung Galaxy Tab S7+', '699990', 'Electronica', 'Gris', '15'), 
('Parlante Bluetooth JBL Charge 4', '149990', 'Audio', 'Negro', '20'), 
('Monitor LG UltraWide 34"', '449990', 'Computacion', 'Plateado', '10'),  
('Auriculares inalámbricos Sony WH-1000XM4', '329990', 'Audio', 'Negro', '15'); 

INSERT INTO proveedor_producto (id_proveedor, id_producto, stock) VALUE  
('1', '1', '10'),  
('2', '2', '8'),  
('3', '3','15'),  
('4', '4', '5'),  
('5', '5', '20'); 


SELECT categoria, COUNT(*) AS cantidad FROM productos 
GROUP BY categoria 
ORDER BY cantidad DESC 
LIMIT 1;

SELECT nombre_producto, stock FROM productos
ORDER BY stock DESC
LIMIT 10;

SELECT color, COUNT(*) AS cantidad
FROM productos
GROUP BY color
ORDER BY cantidad DESC
LIMIT 1;

SELECT p.nombre_corporativo, SUM(pp.stock) AS stock_total
FROM proveedores p
INNER JOIN proveedor_producto pp ON p.id_proveedor = pp.id_proveedor
GROUP BY p.nombre_corporativo
ORDER BY stock_total ASC
LIMIT 1;

  
CREATE TEMPORARY TABLE temp_table
SELECT categoria FROM productos
GROUP BY categoria
ORDER BY COUNT(*) DESC
LIMIT 1;

UPDATE productos
SET categoria = 'Electrónica y computación'
WHERE categoria = (
  SELECT categoria
  FROM temp_table
);

DROP TEMPORARY TABLE temp_table;
  