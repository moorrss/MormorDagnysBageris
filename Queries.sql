SELECT
Products.Name AS 'Produkt',
Ingredients.Name AS 'Ingridiens',
StockQuantity || ' kg' AS 'Antal'
FROM Products INNER JOIN RecipeIngredients
ON Products.ProductId = RecipeIngredients.ProductId INNER JOIN Ingredients
ON RecipeIngredients.IngredientId = Ingredients.IngredientId 
WHERE Products.Name = 'Kanelbulle';

SELECT
Products.Name AS 'Produkt',
Ingredients.Name AS 'Ingridiens',
Suppliers.Name AS 'Leverantör',
Suppliers.Phone AS 'Telefon'
FROM Products INNER JOIN RecipeIngredients
ON Products.ProductId = RecipeIngredients.ProductId INNER JOIN Ingredients
ON RecipeIngredients.IngredientId = Ingredients.IngredientId INNER JOIN SupplierCatalog
ON Ingredients.IngredientId = SupplierCatalog.IngredientId INNER JOIN Suppliers
ON SupplierCatalog.SupplierId = Suppliers.SupplierId
WHERE Products.Name = 'Kanelbulle';

SELECT
Name AS 'Ingridiens',
StockQuantity || ' kg' AS 'Nuvarande antal'
FROM Ingredients ORDER BY StockQuantity ASC;

SELECT
Purchases.Id AS 'Köp ID',
Purchases.Date,
Suppliers.Name AS 'Leverantör',
Ingredients.Name AS 'Ingridiens',
PurchaseLines.StockQuantity || ' kg' AS 'Antal',
PurchaseLines.PurchasesPrice AS 'Pris'
FROM Purchases INNER JOIN PurchaseLines ON
Purchases.Id = PurchaseLines.PurchaseId INNER JOIN Suppliers
ON Purchases.SupplierId = Suppliers.SupplierId INNER JOIN Ingredients
ON PurchaseLines.IngredientId = Ingredients.IngredientId;
