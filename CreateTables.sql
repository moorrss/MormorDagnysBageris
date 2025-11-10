DROP TABLE IF EXISTS Suppliers;

CREATE TABLE Suppliers (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(100) NOT NULL,
);

DROP TABLE IF EXISTS Contacts;

CREATE TABLE Contacts (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    SupplierId INTEGER NOT NULL,
    FirstName VARCHAR(40) NOT NULL,
    LastName VARCHAR(60) NOT NULL,
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id)
);

DROP TABLE IF EXISTS EmailAddresses (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(80) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS SuppliersEmail;

CREATE TABLE SuppliersEmail (
    SupplierId INTEGER,
    EmailId INTEGER,
    PRIMARY KEY (SupplierId, EmailId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id),
    FOREIGN KEY (EmailId) REFERENCES EmailAddresses (Id)
);

DROP TABLE IF EXISTS ContactsEmail;

CREATE TABLE ContactsEmail (
    ContactId INTEGER,
    EmailId INTEGER,
    PRIMARY KEY (ContactId, EmailId),
    FOREIGN KEY (ContactId) REFERENCES Contacts (Id),
    FOREIGN KEY (EmailId) REFERENCES EmailAddresses (Id)
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
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    ItemNumber VARCHAR(20) NOT NULL UNIQUE,
    Name VARCHAR(100) NOT NULL,
    PricePerKg DECIMAL NOT NULL,
    StockQuantity DECIMAL NOT NULL DEFAULT 0.0
);

DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(100) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS SupplierCatalog;

CREATE TABLE SupplierCatalog (
    SupplierId INTEGER,
    IngredientId INTEGER,
    PRIMARY KEY (SupplierId, IngredientId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id) ON DELETE CASCADE,
    FOREIGN KEY (IngredientId) REFERENCES Ingredients (Id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS RecipeIngredients;

CREATE TABLE RecipeIngredients (
    ProductId INTEGER,
    IngredientId INTEGER,
    StockQuantity DECIMAL NOT NULL,
    PRIMARY KEY (ProductId, IngredientId),
    FOREIGN KEY (ProductId) REFERENCES Products (Id) ON DELETE CASCADE,
    FOREIGN KEY (IngredientId) REFERENCES Ingredients (Id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Purchases;

CREATE TABLE Purchases (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    SupplierId INTEGER NOT NULL,
    Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id)
);

DROP TABLE IF EXISTS PurchaseLines;

CREATE TABLE PurchaseLines (
    PurchaseId INTEGER,
    IngredientId INTEGER,
    StockQuantity DECIMAL NOT NULL,
    PurchasesPrice DECIMAL NOT NULL,
    PRIMARY KEY (PurchaseId, IngredientId),
    FOREIGN KEY (PurchaseId) REFERENCES Purchases (Id) ON DELETE CASCADE,
    FOREIGN KEY (IngredientId) REFERENCES Ingredients (Id)
);

DROP TABLE IF EXISTS PhoneNumbers;

CREATE TABLE PhoneNumbers (
    Id INTEGER PRIMARY KEY AUTO_INCREMENT,
    PhoneNumber VARCHAR(25) NOT NULL UNIQUE,
);

DROP TABLE IF EXISTS SuppliersPhone;

CREATE TABLE SuppliersPhone (
    SupplierId INTEGER,
    PhoneId INTEGER,
    PRIMARY KEY (SupplierId, PhoneId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id),
    FOREIGN KEY (PhoneId) REFERENCES PhoneNumbers (Id)
);

DROP TABLE IF EXISTS ContactsPhones;

CREATE TABLE ContactsPhone (
    ContactId INTEGER,
    PhoneId INTEGER,
    PRIMARY KEY (ContactId, PhoneId),
    FOREIGN KEY (ContactId) REFERENCES Contacts (Id),
    FOREIGN KEY (PhoneId) REFERENCES PhoneNumbers (Id)
);