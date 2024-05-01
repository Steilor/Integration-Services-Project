
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/05/2024 11:49:52
-- Generated from EDMX file: C:\Users\steil\Desktop\Big Data\BD\NorthwindDwh\NorthwindDwh.ConceptualModel\Model\NorthwindModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DwhNorthwind];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CustomersSet'
CREATE TABLE [dbo].[CustomersSet] (
    [CustomerID] nvarchar(5)  NOT NULL,
    [CompanyName] nvarchar(40)  NOT NULL
);
GO

-- Creating table 'EmployeesSet'
CREATE TABLE [dbo].[EmployeesSet] (
    [EmployeeID] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(30)  NOT NULL
);
GO

-- Creating table 'OrdersSet'
CREATE TABLE [dbo].[OrdersSet] (
    [OrderID] int IDENTITY(1,1) NOT NULL,
    [CustomerID] nvarchar(max)  NOT NULL,
    [EmployeeID] nvarchar(max)  NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [RequiredDate] datetime  NOT NULL,
    [ShipVia] nvarchar(max)  NOT NULL,
    [Freight] decimal(18,0)  NOT NULL,
    [ShipName] nvarchar(15)  NOT NULL,
    [ShipAddress] nvarchar(60)  NOT NULL,
    [ShipCity] nvarchar(15)  NOT NULL,
    [ShipRegion] nvarchar(15)  NOT NULL,
    [ShipPostalCode] nvarchar(10)  NOT NULL,
    [ShipCountry] nvarchar(15)  NOT NULL,
    [CustomersCustomerID] nvarchar(5)  NOT NULL,
    [EmployeesEmployeeID] int  NOT NULL,
    [ShipperID] nvarchar(max)  NOT NULL,
    [ShippersShipperID] int  NOT NULL,
    [OrderDetailsOrderID] int  NOT NULL
);
GO

-- Creating table 'ShippersSet'
CREATE TABLE [dbo].[ShippersSet] (
    [ShipperID] int IDENTITY(1,1) NOT NULL,
    [CompanyName] nvarchar(40)  NOT NULL,
    [Phone] nvarchar(24)  NOT NULL
);
GO

-- Creating table 'OrderDetailsSet'
CREATE TABLE [dbo].[OrderDetailsSet] (
    [OrderID] int IDENTITY(1,1) NOT NULL,
    [ProductID] int  NOT NULL,
    [UnitPrice] nvarchar(max)  NOT NULL,
    [Quantity] nvarchar(max)  NOT NULL,
    [Discount] nvarchar(max)  NOT NULL,
    [ProductsProductID] int  NOT NULL,
    [Orders_OrderID] int  NOT NULL
);
GO

-- Creating table 'ProductsSet'
CREATE TABLE [dbo].[ProductsSet] (
    [ProductID] int IDENTITY(1,1) NOT NULL,
    [ProductName] nvarchar(40)  NOT NULL,
    [Discontinued] bit  NOT NULL,
    [CategoryID] int  NOT NULL,
    [Categories_CateogryID] int  NOT NULL
);
GO

-- Creating table 'CategoriesSet'
CREATE TABLE [dbo].[CategoriesSet] (
    [CateogryID] int IDENTITY(1,1) NOT NULL,
    [CategoryName] nvarchar(15)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CustomerID] in table 'CustomersSet'
ALTER TABLE [dbo].[CustomersSet]
ADD CONSTRAINT [PK_CustomersSet]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [EmployeeID] in table 'EmployeesSet'
ALTER TABLE [dbo].[EmployeesSet]
ADD CONSTRAINT [PK_EmployeesSet]
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC);
GO

-- Creating primary key on [OrderID] in table 'OrdersSet'
ALTER TABLE [dbo].[OrdersSet]
ADD CONSTRAINT [PK_OrdersSet]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [ShipperID] in table 'ShippersSet'
ALTER TABLE [dbo].[ShippersSet]
ADD CONSTRAINT [PK_ShippersSet]
    PRIMARY KEY CLUSTERED ([ShipperID] ASC);
GO

-- Creating primary key on [OrderID] in table 'OrderDetailsSet'
ALTER TABLE [dbo].[OrderDetailsSet]
ADD CONSTRAINT [PK_OrderDetailsSet]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [ProductID] in table 'ProductsSet'
ALTER TABLE [dbo].[ProductsSet]
ADD CONSTRAINT [PK_ProductsSet]
    PRIMARY KEY CLUSTERED ([ProductID] ASC);
GO

-- Creating primary key on [CateogryID] in table 'CategoriesSet'
ALTER TABLE [dbo].[CategoriesSet]
ADD CONSTRAINT [PK_CategoriesSet]
    PRIMARY KEY CLUSTERED ([CateogryID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomersCustomerID] in table 'OrdersSet'
ALTER TABLE [dbo].[OrdersSet]
ADD CONSTRAINT [FK_CustomersOrders]
    FOREIGN KEY ([CustomersCustomerID])
    REFERENCES [dbo].[CustomersSet]
        ([CustomerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomersOrders'
CREATE INDEX [IX_FK_CustomersOrders]
ON [dbo].[OrdersSet]
    ([CustomersCustomerID]);
GO

-- Creating foreign key on [EmployeesEmployeeID] in table 'OrdersSet'
ALTER TABLE [dbo].[OrdersSet]
ADD CONSTRAINT [FK_EmployeesOrders]
    FOREIGN KEY ([EmployeesEmployeeID])
    REFERENCES [dbo].[EmployeesSet]
        ([EmployeeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeesOrders'
CREATE INDEX [IX_FK_EmployeesOrders]
ON [dbo].[OrdersSet]
    ([EmployeesEmployeeID]);
GO

-- Creating foreign key on [ShippersShipperID] in table 'OrdersSet'
ALTER TABLE [dbo].[OrdersSet]
ADD CONSTRAINT [FK_ShippersOrders]
    FOREIGN KEY ([ShippersShipperID])
    REFERENCES [dbo].[ShippersSet]
        ([ShipperID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ShippersOrders'
CREATE INDEX [IX_FK_ShippersOrders]
ON [dbo].[OrdersSet]
    ([ShippersShipperID]);
GO

-- Creating foreign key on [ProductsProductID] in table 'OrderDetailsSet'
ALTER TABLE [dbo].[OrderDetailsSet]
ADD CONSTRAINT [FK_ProductsOrderDetails]
    FOREIGN KEY ([ProductsProductID])
    REFERENCES [dbo].[ProductsSet]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductsOrderDetails'
CREATE INDEX [IX_FK_ProductsOrderDetails]
ON [dbo].[OrderDetailsSet]
    ([ProductsProductID]);
GO

-- Creating foreign key on [Categories_CateogryID] in table 'ProductsSet'
ALTER TABLE [dbo].[ProductsSet]
ADD CONSTRAINT [FK_CategoriesProducts]
    FOREIGN KEY ([Categories_CateogryID])
    REFERENCES [dbo].[CategoriesSet]
        ([CateogryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriesProducts'
CREATE INDEX [IX_FK_CategoriesProducts]
ON [dbo].[ProductsSet]
    ([Categories_CateogryID]);
GO

-- Creating foreign key on [Orders_OrderID] in table 'OrderDetailsSet'
ALTER TABLE [dbo].[OrderDetailsSet]
ADD CONSTRAINT [FK_OrderDetailsOrders]
    FOREIGN KEY ([Orders_OrderID])
    REFERENCES [dbo].[OrdersSet]
        ([OrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderDetailsOrders'
CREATE INDEX [IX_FK_OrderDetailsOrders]
ON [dbo].[OrderDetailsSet]
    ([Orders_OrderID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------