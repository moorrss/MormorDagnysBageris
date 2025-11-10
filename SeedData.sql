INSERT INTO
    Suppliers (Name)
VALUES ('Kvarnen AB'),
    ('Socker AB'),
    ('Fruk och Bär');

INSERT INTO
    Ingredients (
        ItemNumber,
        Name,
        PricePerKg,
        StockQuantity
    )
VALUES (
        'MJO-VET',
        'Vetemjöl',
        10.50,
        100.0
    ),
    (
        'SOC-STR',
        'Strösocker',
        15.00,
        50.0
    ),
    (
        'KAN-MAL',
        'Kanel',
        80.00,
        10.0
    ),
    (
        'KRD-MAL',
        'Kardemumma',
        150.00,
        5.0
    ),
    (
        'MJO-RAG',
        'Rågmjöl',
        12.00,
        80.0
    ),
    (
        'APP-R',
        'Äpplen',
        25.00,
        15.0
    );

INSERT INTO
    Products (Name)
VALUES ('Kanelbulle'),
    ('Kardemummabulle'),
    ('Surdegslimpa'),
    ('Äppelkaka');

INSERT INTO
    Contacts (
        SupplierId,
        FirstName,
        LastName
    )
VALUES (1, 'Gunde', 'Kvarn'),
    (2, 'Gunhild', 'Gransson'),
    (3, 'Lisa', 'Svan');

INSERT INTO
    EmailAddresses (Email)
VALUES ('GundeKvarn@live.se'),
    ('gunhildgra@live.se'),
    ('lisasvan@live.se');

INSERT INTO
    PhoneNumbers (PhoneNumber)
VALUES ('010-123456'),
    ('020-654321'),
    ('010-987654');

INSERT INTO
    SuppliersEmail (SupplierId, EmailId)
VALUES (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO
    SuppliersPhone (SupplierId, PhoneId)
VALUES (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO
    ContactsEmail (ContactId, EmailId)
VALUES (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO
    ContactsPhone (ContactId, PhoneId)
VALUES (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO
    SupplierCatalog (SupplierId, IngredientId)
VALUES (1, 1),
    (1, 5),
    (2, 2),
    (2, 3),
    (2, 4),
    (3, 6);

INSERT INTO
    RecipeIngredients (
        ProductId,
        IngredientId,
        StockQuantity
    )
VALUES (1, 1, 0.5),
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

INSERT INTO
    Purchases (SupplierId, Date)
VALUES (1, '2025-10-31 09:30:00');

INSERT INTO
    PurchaseLines (
        PurchaseId,
        IngredientId,
        StockQuantity,
        PurchasesPrice
    )
VALUES (1, 1, 50.0, 10.25),
    (1, 5, 25.0, 12.00);

INSERT INTO
    Cities (City)
VALUES ('Kvarnstad'),
    ('Grannstad'),
    ('Malmö');

INSERT INTO
    PostalCodes (PostalCode, CityId)
VALUES ('12345', 1),
    ('54321', 2),
    ('21122', 3);

INSERT INTO
    Addresses (AddressLine, PostalCodeId)
VALUES ('KvarnGatan 1', 1),
    ('Granstigen 3', 2),
    ('Storbackagatan 2', 3);

UPDATE Suppliers SET AddressId = 1 WHERE Id = 1;

UPDATE Suppliers SET AddressId = 2 WHERE Id = 2;

UPDATE Suppliers SET AddressId = 3 WHERE Id = 3;