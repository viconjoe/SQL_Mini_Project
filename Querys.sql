CREATE TABLE `books` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `author` VARCHAR(50) NOT NULL,
  `date` DATE NOT NULL,
  `genre_id` int NOT NULL
);

CREATE TABLE `genre` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `class` VARCHAR(20) NOT NULL
);

CREATE TABLE `suppliers` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `phone_number` VARCHAR(15) NOT NULL,
  `email` VARCHAR(35) UNIQUE,
  `address` VARCHAR(150) NOT NULL
);

CREATE TABLE `sales` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `date` datetime NOT NULL,
  `total_price` decimal(6,2) NOT NULL
);

CREATE TABLE `books_sales` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `inventory_id` int NOT NULL,
  `sales_id` int NOT NULL
);

CREATE TABLE `purchases` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `inventory_id` int NOT NULL
);

CREATE TABLE `inventory` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL
);

CREATE TABLE `returns` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `sale_id` int NOT NULL,
  `inventory_id` int NOT NULL,
  `incidence` text NOT NULL
);

CREATE TABLE `employees` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `DNI` VARCHAR(10) NOT NULL,
  `address` VARCHAR(150),
  `phone_number` int NOT NULL,
  `salary` decimal(10,2) NOT NULL
);

ALTER TABLE `books` ADD FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

ALTER TABLE `sales` ADD FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

ALTER TABLE `books_sales` ADD FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`);

ALTER TABLE `books_sales` ADD FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`);

ALTER TABLE `purchases` ADD FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

ALTER TABLE `purchases` ADD FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`);

ALTER TABLE `inventory` ADD FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

ALTER TABLE `inventory` ADD FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

ALTER TABLE `returns` ADD FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`);

ALTER TABLE `returns` ADD FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`);


INSERT INTO genre (class) VALUES
  ('Action'),
  ('Comedy'),
  ('Drama'),
  ('Horror'),
  ('Romance'),
  ('Science Fiction'),
  ('Thriller'),
  ('Western'),
  ('Adventure'),
  ('Documentary');


INSERT INTO employees (name, last_name, DNI, address, phone_number, salary)
VALUES 
('Antonio', 'García', '12345678-A', 'Calle Mayor 3, Madrid, España', '910123456', 756.81),
('Carmen', 'López', '87654321-B', 'Avenida de la Libertad 14, Valencia, España', '960234567', 1207.94),
('David', 'Martínez', '54321678-C', 'Plaza del Castillo 8, Pamplona, España', '948345678', 627.42),
('Ana', 'Fernández', '87654321-D', 'Calle San Juan 21, Barcelona, España', '934456789', 945.67),
('Pablo', 'Sánchez', '98765432-E', 'Paseo de la Castellana 100, Madrid, España', '911567890', 1166.05),
('Marta', 'Gómez', '34567890-F', 'Plaza Mayor 7, Salamanca, España', '923678901', 1250.89),
('Luis', 'Rodríguez', '01234567-G', 'Calle Gran Vía 50, Madrid, España', '915789012', 956.80),
('Laura', 'García', '21098765-H', 'Calle de Alcalá 200, Madrid, España', '911890123', 1189.49),
('Javier', 'Martín', '67890123-I', 'Calle San Francisco 12, Córdoba, España', '957901234', 1301.52),
('Isabel', 'Pérez', '45678901-J', 'Calle Real 2, Sevilla, España', '955012345', 805.85);


INSERT INTO books (name, author, date, genre_id)
VALUES
('Cien años de soledad', 'Gabriel García Márquez', '1967-05-30', 1),
('1984', 'George Orwell', '1949-06-08', 2),
('Orgullo y prejuicio', 'Jane Austen', '1813-01-28', 3),
('El Hobbit', 'J.R.R. Tolkien', '1937-09-21', 4),
('El psicoanalista', 'John Katzenbach', '2002-05-07', 5),
('La casa de los espíritus', 'Isabel Allende', '1982-01-01', 1),
('La naranja mecánica', 'Anthony Burgess', '1962-04-28', 2),
('El retrato de Dorian Gray', 'Oscar Wilde', '1890-07-01', 3),
('El señor de los anillos', 'J.R.R. Tolkien', '1954-07-29', 4),
('Los pilares de la Tierra', 'Ken Follett', '1989-10-02', 5);


INSERT INTO suppliers (name, phone_number, email, address)
VALUES
('Proveedor A', '910123456', 'proveedora@example.com', 'Calle Mayor 3, Madrid, España'),
('Proveedor B', '960234567', 'proveedorb@example.com', 'Avenida de la Libertad 14, Valencia, España'),
('Proveedor C', '948345678', 'proveedorc@example.com', 'Plaza del Castillo 8, Pamplona, España'),
('Proveedor D', '934456789', 'proveedord@example.com', 'Calle San Juan 21, Barcelona, España'),
('Proveedor E', '911567890', 'proveedore@example.com', 'Paseo de la Castellana 100, Madrid, España'),
('Proveedor F', '923678901', 'proveedorf@example.com', 'Plaza Mayor 7, Salamanca, España'),
('Proveedor G', '915789012', 'proveedorg@example.com', 'Calle Gran Vía 50, Madrid, España'),
('Proveedor H', '911890123', 'proveedorh@example.com', 'Calle de Alcalá 200, Madrid, España'),
('Proveedor I', '957901234', 'proveedori@example.com', 'Calle San Francisco 12, Córdoba, España'),
('Proveedor ),J', '955012345', 'proveedorj@example.com', 'Calle Real 2, Sevilla, España');


INSERT INTO sales (employee_id, date, total_price)
VALUES
(1, '2022-01-01', 150.50),
(2, '2022-01-02', 85.25),
(3, '2022-01-03', 200.00),
(4, '2022-01-04', 50.75),
(5, '2022-01-05', 120.90),
(1, '2022-01-06', 75.00),
(2, '2022-01-07', 160.30),
(3, '2022-01-08', 95.20),
(4, '2022-01-09', 180.50),
(5, '2022-01-10', 30.40);

INSERT INTO inventory (book_id, supplier_id, price)
VALUES
(1, 3, 10.50),
(2, 4, 15.75),
(3, 5, 8.90),
(4, 2, 20.00),
(5, 1, 12.30),
(1, 7, 9.50),
(2, 6, 14.25),
(3, 9, 11.20),
(4, 8, 18.50),
(5, 10, 7.40);


INSERT INTO books_sales (inventory_id, sales_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(0, 10);


INSERT INTO purchases (supplier_id, inventory_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


INSERT INTO returns (sale_id, inventory_id, incidence)
VALUES
(1, 1, 'El libro estaba en mal estado'),
(2, 2, 'El cliente se equivocó de libro'),
(3, 3, 'El libro no era el que el cliente esperaba'),
(4, 4, 'El libro llegó tarde'),
(5, 5, 'El cliente decidió cancelar la compra'),
(6, 6, 'El libro estaba repetido'),
(7, 7, 'El libro no era el que se anunciaba'),
(8, 8, 'El libro llegó dañado'),
(9, 9, 'El libro no llegó en el plazo establecido'),
(10, 10, 'El cliente cambió de opinión');

-- 1. Nombre de libros, genero y proveedor en el inventario ordenado por nombre ascendente.

SELECT b.name, g.class, s.name
 FROM inventory i
 LEFT JOIN books As b ON b.id = i.book_id
 INNER JOIN genre AS g ON b.genre_id = g.id
 INNER JOIN suppliers AS s ON i.supplier_id = s.id
 ORDER BY b.name ASC;

-- 2. Libros que no están en el inventarios

SELECT b.name
 FROM inventory AS i
 RIGHT JOIN books b ON b.id = i.book_id
 WHERE i.supplier_id is null;

-- 3. Media del salario de los empleados

SELECT ROUND(AVG(salary),2 ) media
 FROM employees;

-- 4. Total de venta por día

SELECT s.date, SUM(total_price) total
FROM sales AS s
GROUP BY s.date;

-- 5. Cantidad de Ventas y nombre de cada trabajador

SELECT COUNT(employee_id) sales, e.name, e.last_name
 FROM sales AS s
 LEFT JOIN employees AS e ON s.employee_id = e.id
 GROUP BY employee_id;

-- 6. Listar nombre de libro con su provedor ordenado por precio

SELECT b.name, s.name, i.price
 FROM inventory i
 LEFT JOIN books b ON b.id = i.book_id
 INNER JOIN suppliers s ON i.supplier_id = s.id
 ORDER BY i.price DESC;

-- 7. Lista de libros que han sido devuelto y su motivo

SELECT b.name, r.incidence
 FROM inventory i
 INNER JOIN returns r ON i.id =  r.inventory_id
 LEFT JOIN books b ON b.id = i.book_id
 ORDER BY b.name;
