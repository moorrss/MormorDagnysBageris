SELECT Products.Name AS 'Produkt', Ingredients.Name AS 'Ingridiens', RecipeIngredients.StockQuantity || ' kg' AS 'Antal'
FROM
    Products
    INNER JOIN RecipeIngredients ON Products.Id = RecipeIngredients.ProductId
    INNER JOIN Ingredients ON RecipeIngredients.IngredientId = Ingredients.Id
WHERE
    Products.Name = 'Kanelbulle';

SELECT Products.Name AS 'Produkt', Ingredients.Name AS 'Ingridiens', Suppliers.Name AS 'Leverantör', PhoneNumbers.PhoneNumber AS 'Telefon'
FROM
    Products
    INNER JOIN RecipeIngredients ON Products.Id = RecipeIngredients.ProductId
    INNER JOIN Ingredients ON RecipeIngredients.IngredientId = Ingredients.Id
    INNER JOIN SupplierCatalog ON Ingredients.Id = SupplierCatalog.IngredientId
    INNER JOIN Suppliers ON SupplierCatalog.SupplierId = Suppliers.Id
    INNER JOIN SuppliersPhone ON Suppliers.Id = SuppliersPhone.SupplierId
    INNER JOIN PhoneNumbers ON SuppliersPhone.PhoneId = PhoneNumbers.Id
WHERE
    Products.Name = 'Kanelbulle';

SELECT Name AS 'Ingridiens', StockQuantity || ' kg' AS 'Nuvarande antal'
FROM Ingredients
ORDER BY StockQuantity ASC;

SELECT Purchases.Id AS 'Köp ID', Purchases.Date, Suppliers.Name AS 'Leverantör', Ingredients.Name AS 'Ingridiens', PurchaseLines.StockQuantity || ' kg' AS 'Antal', PurchaseLines.PurchasesPrice AS 'Pris'
FROM
    Purchases
    INNER JOIN PurchaseLines ON Purchases.Id = PurchaseLines.PurchaseId
    INNER JOIN Suppliers ON Purchases.SupplierId = Suppliers.Id
    INNER JOIN Ingredients ON PurchaseLines.IngredientId = Ingredients.Id;

SELECT Suppliers.Name AS 'Leverantör', Contacts.FirstName || ' ' || Contacts.LastName AS 'Kontaktperson', Addresses.AddressLine AS 'Gatuadress', PostalCodes.PostalCode AS 'Postnummer', Cities.City AS 'Stad'
FROM
    suppliers
    LEFT JOIN contacts ON suppliers.Id = contacts.SupplierId
    LEFT JOIN addresses ON suppliers.AddressId = addresses.Id
    LEFT JOIN postalcodes ON addresses.PostalCodeId = postalcodes.Id
    LEFT JOIN cities ON postalcodes.CityId = cities.Id;