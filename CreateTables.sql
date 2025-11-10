DROP TABLE IF EXISTS Suppliers;

CREATE TABLE Suppliers (
    SupplierId INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100) UNIQUE
);

DROP TABLE IF EXISTS Cities;

CREATE TABLE Cities (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    City VARCHAR(80) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS PostalCodes;

CREATE TABLE PostalCodes (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    PostalCode VARCHAR(5) NOT NULL UNIQUE,
    CityId INTEGER NOT NULL,
    FOREIGN KEY (CityId) REFERENCES Cities (Id)
);

DROP TABLE IF EXISTS Addresses;

CREATE TABLE Addresses (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    AddressLine VARCHAR(40) NOT NULL,
    PostalCodeId INTEGER NOT NULL
);

DROP TABLE IF EXISTS Ingredients;

CREATE TABLE Ingredients (
    IngredientId INTEGER PRIMARY KEY AUTOINCREMENT,
    ItemNumber VARCHAR(20) NOT NULL UNIQUE,
    Name VARCHAR(100) NOT NULL,
    PricePerKg DECIMAL NOT NULL,
    StockQuantity DECIMAL NOT NULL DEFAULT 0.0
);

DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    ProductId INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(100) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS SupplierCatalog;

CREATE TABLE SupplierCatalog (
    SupplierId INTEGER,
    IngredientId INTEGER,
    PRIMARY KEY (SupplierId, IngredientId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (SupplierId) ON DELETE CASCADE,
    FOREIGN KEY (IngredientId) REFERENCES Ingredients (IngredientId) ON DELETE CASCADE
);

DROP TABLE IF EXISTS RecipeIngredients;

CREATE TABLE RecipeIngredients (
    ProductId INTEGER,
    IngredientId INTEGER,
    StockQuantity DECIMAL NOT NULL,
    PRIMARY KEY (ProductId, IngredientId),
    FOREIGN KEY (ProductId) REFERENCES Products (ProductId) ON DELETE CASCADE,
    FOREIGN KEY (IngredientId) REFERENCES Ingredients (IngredientId) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Purchases;

CREATE TABLE Purchases (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    SupplierId INTEGER NOT NULL,
    Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (SupplierId)
);

DROP TABLE IF EXISTS PurchaseLines;

CREATE TABLE PurchaseLines (
    PurchaseId INTEGER,
    IngredientId INTEGER,
    StockQuantity DECIMAL NOT NULL,
    PurchasesPrice DECIMAL NOT NULL,
    PRIMARY KEY (PurchaseId, IngredientId),
    FOREIGN KEY (PurchaseId) REFERENCES Purchases (Id) ON DELETE CASCADE,
    FOREIGN KEY (IngredientId) REFERENCES Ingredients (IngredientId)
);