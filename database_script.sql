CREATE DATABASE РосМолоко;
GO

USE RussianMilkDB;
GO

CREATE TABLE Products (
    ProductId INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    FatContent DECIMAL(4,2) NOT NULL,
    PackageType NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Warehouses (
    WarehouseId INT IDENTITY(1,1) PRIMARY KEY,
    WarehouseName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(200) NOT NULL
);
GO

CREATE TABLE Batches (
    BatchId INT IDENTITY(1,1) PRIMARY KEY,
    ProductId INT NOT NULL,
    WarehouseId INT NOT NULL,
    ProductionDate DATE NOT NULL,
    ExpirationDate DATE NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    CONSTRAINT FK_Batches_Products FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
    CONSTRAINT FK_Batches_Warehouses FOREIGN KEY (WarehouseId) REFERENCES Warehouses(WarehouseId)
);
GO

INSERT INTO Products (ProductName, FatContent, PackageType)
VALUES
(N'Молоко пастеризованное', 2.50, N'Пакет 1 л'),
(N'Кефир', 3.20, N'Бутылка 0.9 л'),
(N'Сметана', 15.00, N'Стакан 300 г'),
(N'Ряженка', 4.00, N'Бутылка 0.5 л');
GO

INSERT INTO Warehouses (WarehouseName, Address)
VALUES
(N'Склад №1', N'Москва, ул. Центральная, 10'),
(N'Склад №2', N'Подольск, ул. Заводская, 5'),
(N'Холодильный склад', N'Люберцы, Промышленный проезд, 7');
GO

INSERT INTO Batches (ProductId, WarehouseId, ProductionDate, ExpirationDate, Quantity)
VALUES
(1, 1, '2026-04-01', '2026-04-10', 500),
(2, 2, '2026-04-03', '2026-04-12', 300),
(3, 1, '2026-04-05', '2026-04-20', 200),
(4, 3, '2026-04-07', '2026-04-16', 150);
GO

SELECT * FROM Products;
SELECT * FROM Warehouses;
SELECT * FROM Batches;
GO
