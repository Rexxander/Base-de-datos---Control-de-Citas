CREATE DATABASE IF NOT EXISTS mechanic_shop;
USE mechanic_shop;

CREATE TABLE Customers (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) NOT NULL
);

CREATE TABLE Vehicles (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Plate VARCHAR(20) NOT NULL UNIQUE,
    Brand VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    CustomerId INT NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
);

CREATE TABLE Appointments (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    CustomerId INT NOT NULL,
    VehicleId INT NOT NULL,
    `Date` VARCHAR(20) NOT NULL,
    `Time` VARCHAR(10) NOT NULL,
    Service VARCHAR(100) NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id),
    FOREIGN KEY (VehicleId) REFERENCES Vehicles(Id)
);

INSERT INTO Customers (Name, Phone) VALUES
('Juan Perez', '809-555-1111'),
('Maria Lopez', '829-555-2222');

INSERT INTO Vehicles (Plate, Brand, Model, CustomerId) VALUES
('A123456', 'Toyota', 'Corolla', 1),
('G987654', 'Honda', 'Civic', 2);

INSERT INTO Appointments (CustomerId, VehicleId, `Date`, `Time`, Service) VALUES
(1, 1, '20/11/2026', '09:00', 'Oil change'),
(2, 2, '20/11/2026', '10:00', 'Brake check');

select * from Customers