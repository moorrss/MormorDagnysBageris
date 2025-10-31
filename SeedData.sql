
INSERT INTO Suppliers(
Name,
Address,
ContactPerson,
Phone,
Email
)VALUES(
'Kvarnen AB',
'KvarnGatan 1, 123 45 Kvarnstd',
'Gunde Kvarn',
'010-123456',
'GundeKvarn@live.se'),
('Socker AB',
'Granstigen 3, 543 21 Grannstad',
'Gunhild Gransson',
'020-654321',
'gunhildgra@live.se'),
('Fruk och Bär',
'Storbackagatn 2, Malmö',
'Lisa Svan',
'010-987654',
'lisasvan@live.se');


INSERT INTO Ingredients(
ItemNumber,
Name,
PricePerKg,
StockQuantity
)VALUES(
'MJOL-VETE', 'Vetemjöl', 10.50, 100.0),
('SOCK-STR', 'Strösocker', 15.00, 50.0),
('KAN-MAL', 'Kanel', 80.00, 10.0),
('KRD-MAL', 'Kardemumma', 150.00, 5.0),
('MJOL-RAG', 'Rågmjöl', 12.00, 80.0),
('APPLE-R', 'Äpplen', 25.00, 15.0);

INSERT INTO Products(
Name
)VALUES(
'Kanelbulle'),
('Kardemummabulle'),
('Surdegslimpa'),
('Äppelkaka');

INSERT INTO SupplierCatalog(
SupplierId,
IngredientId
)VALUES(
1, 1),
(1, 5),
(2, 2),
(2, 3),
(2, 4),
(3, 6);


INSERT INTO RecipeIngredients(
ProductId,
IngredientId,
StockQuantity
)VALUES(
1, 1, 0.5),
(1, 2, 0.1), 
(1, 3, 0.02), 
(2, 1, 0.5), 
(2, 2, 0.1), 
(2, 4, 0.03), 
(3, 1, 0.3), 
(3, 5, 0.7), 
(4, 1, 0.4), 
(4, 2, 0.2), 
(4, 6, 1.0); 


INSERT INTO Purchases(
SupplierId,
Date
)VALUES(
1, '2025-10-31 09:30:00'
);


INSERT INTO PurchaseLines(
PurchaseId,
IngredientId,
StockQuantity,
PurchasesPrice
)VALUES(
1, 1, 50.0, 10.25), 
(1, 5, 25.0, 12.00);

