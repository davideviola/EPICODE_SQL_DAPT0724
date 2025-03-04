-- Crea il database "lezione2sql"
CREATE DATABASE lezione2sql;

-- Seleziona il database "lezione2sql" per lavorarci
USE lezione2sql;

-- Crea la tabella "Product" con le colonne ProductID, CategoryID, ProductName, e ListPrice
CREATE TABLE Product 
( 
    ProductID INT PRIMARY KEY,           -- Colonna ProductID come chiave primaria
    CategoryID INT,                      -- Colonna CategoryID (relazione con la tabella Category)
    ProductName VARCHAR(50),             -- Colonna ProductName (nome del prodotto)
    ListPrice DECIMAL(7,2)               -- Colonna ListPrice (prezzo del prodotto)
);

-- Crea la tabella "Category" con le colonne CategoryID e CategoryName
CREATE TABLE Category 
( 
    CategoryID INT PRIMARY KEY,          -- Colonna CategoryID come chiave primaria
    CategoryName VARCHAR(25)             -- Colonna CategoryName (nome della categoria)
);

-- Inserisce un record nella tabella "Product" con i valori specificati
INSERT INTO 
    Product (ProductID, CategoryID, ProductName, ListPrice) 
VALUES 
    (1, 1, 'Pastascuitta', 3.44);       -- Primo prodotto (ID 1, categoria 1, nome "Pastascuitta", prezzo 3.44)
    
-- Inserisce più record nella tabella "Product"
INSERT INTO 
    Product
VALUES 
    (2, 1, 'Caffè', 9.99),             -- Secondo prodotto (ID 2, categoria 1, nome "Caffè", prezzo 9.99)
    (3, 1, 'Sapone', 4.00);            -- Terzo prodotto (ID 3, categoria 1, nome "Sapone", prezzo 4.00)

-- Seleziona e mostra tutti i record dalla tabella "Product"
SELECT * FROM Product;

-- Inserisce record nella tabella "Category"
INSERT INTO 
    Category
VALUES
    (1, 'Alimentari'),                 -- Categoria 1: "Alimentari"
    (2, 'Igiene');                     -- Categoria 2: "Igiene"
    
-- Seleziona e mostra tutti i record dalla tabella "Category"
SELECT * FROM Category;

-- Aggiunge una chiave esterna alla tabella "Product" per riferirsi alla tabella "Category"
ALTER TABLE 
    Product
ADD CONSTRAINT FOREIGN KEY 
    (CategoryID)                        -- Colonna CategoryID in "Product" diventa chiave esterna
REFERENCES 
    Category (CategoryID);              -- Riferisce alla colonna CategoryID della tabella "Category"

-- Elimina le tabelle "Product" e "Category"
DROP TABLE Product, Category;

-- Ristabilisce la tabella "Category" dopo averla eliminata
CREATE TABLE Category 
( 
    CategoryID INT PRIMARY KEY,         -- Colonna CategoryID come chiave primaria
    CategoryName VARCHAR(25)            -- Colonna CategoryName (nome della categoria)
);

-- Ristabilisce la tabella "Product" dopo averla eliminata, senza chiave esterna
CREATE TABLE Product 
( 
    ProductID INT PRIMARY KEY,          -- Colonna ProductID come chiave primaria
    CategoryID INT,                     -- Colonna CategoryID (relazione con la tabella Category)
    ProductName VARCHAR(50),            -- Colonna ProductName (nome del prodotto)
    ListPrice DECIMAL(7,2),             -- Colonna ListPrice (prezzo del prodotto)
    CONSTRAINT PK_Product PRIMARY KEY (ProductID)  -- Specifica la chiave primaria per la tabella
    -- CONSTRAINT FK_Product FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID)  -- Chave esterna commentata (commentata, non attiva)
);
